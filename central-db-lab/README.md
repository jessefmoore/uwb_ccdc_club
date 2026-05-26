# Central Database Lab (WordPress + Nextcloud on a shared MariaDB)

A Ludus range that demonstrates a **central database** pattern: one MariaDB server hosts the
databases for two separate web apps. All three tiers run as Docker containers, configured by
Ansible. The WordPress site is superficially skinned to look like the GrayHats club landing page.

> ⚠️ **Intentionally vulnerable training lab.** Credentials are deliberately weak and stored in
> cleartext, the central database is network-exposed (`root@'%'`), and WordPress runs an old
> core (5.0) plus a known-vulnerable plugin (`wp-file-manager` 6.0, CVE-2020-25213 RCE). Deploy
> only in an isolated range. The creds here protect nothing of value — never reuse them.

## Topology (single flat VLAN)

| VM | role | container |
|----|------|-----------|
| `db` | central database | `mariadb` (publishes 3306) |
| `wordpress` | web app 1 | `wordpress:5.0` → remote DB, GrayHats theme + vuln plugin |
| `nextcloud` | web app 2 | `nextcloud:24` → remote DB (headless install) |

Each web VM derives the DB host from its own VLAN IP (swaps the last octet, `central_db_last_octet`),
so the config is range-agnostic.

## Layout

```
central-db-lab/
├── range-config.yml          # Ludus range definition (3 VMs)
└── ansible/
    ├── requirements.yml       # geerlingguy.docker
    └── roles/
        ├── central_db_docker/ # mariadb container + init.sql (both schemas, exposed root)
        ├── wordpress_docker/  # wordpress + GrayHats theme + bundled vuln plugin
        └── nextcloud_docker/  # nextcloud headless install
```

## Deploy (Ludus CLI)

```bash
ludus templates list                      # confirm a debian-12 template exists
ludus ansible role add geerlingguy.docker
ludus ansible role add -d ./ansible/roles/central_db_docker
ludus ansible role add -d ./ansible/roles/wordpress_docker
ludus ansible role add -d ./ansible/roles/nextcloud_docker
ludus range config set -f range-config.yml
ludus range deploy
```

Re-pushing an edited role requires `--force` (`ludus ansible role add -d <dir> --force`); Ludus
does not overwrite an existing role otherwise.

## Credentials (lab-only, intentionally weak)

| What | User | Password |
|------|------|----------|
| MariaDB root (exposed `@'%'`) | `root` | `toor` |
| WordPress DB | `wp_user` | `password` |
| Nextcloud DB | `nc_user` | `password` |
| WordPress admin | `admin` | `admin` |
| Nextcloud admin | `admin` | `admin` |

## Notes

- The vulnerable plugin is bundled in `wordpress_docker/files/` because wordpress.org's archived
  6.0 zip is double-wrapped and the install happens from the local file (no network needed).
- The `wordpress:cli-php7.4` image is pinned deliberately — the latest wp-cli runs PHP 8, which
  fatals on WordPress 5.0 core.
