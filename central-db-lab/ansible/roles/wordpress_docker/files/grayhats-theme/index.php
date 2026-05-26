<?php $logo = get_template_directory_uri() . '/assets/logo_transparent.png'; ?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
  <meta charset="<?php bloginfo('charset'); ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?php bloginfo('name'); ?> &#8211; Cybersecurity @ UW Bothell</title>
  <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>

<header class="site-header">
  <div class="wrap">
    <a class="brand" href="#home">
      <img src="<?php echo esc_url($logo); ?>" alt="GrayHats logo">
      <span class="name"><b>Gray</b>Hats</span>
    </a>
    <nav class="nav">
      <a href="#home">Home</a>
      <a href="#about">About</a>
      <a href="#advisors">Advisors</a>
      <a href="#officers">Officers</a>
      <a href="#events">Events</a>
      <a href="#photos">Photos</a>
      <a href="#pcf">PCF</a>
      <a href="#contact">Contact</a>
    </nav>
  </div>
</header>

<main id="home">
  <section class="hero">
    <div class="wrap">
      <span class="badge">INV-140 &middot; UNIVERSITY OF WASHINGTON BOTHELL</span>
      <h1><span class="gray">Gray</span><span class="hats">Hats</span></h1>
      <p class="tagline">Cybersecurity @ University of Washington Bothell</p>
      <p class="motto">Step into the Gray area.<span class="cursor">_</span></p>
      <div class="cta">
        <a class="btn primary" href="#about">Explore the Club</a>
        <a class="btn ghost" href="#contact">Join Us</a>
      </div>
    </div>
  </section>

  <section id="about">
    <div class="wrap">
      <h2><span class="hash">#</span> About Us</h2>
      <p class="lead">Student-led cybersecurity with hands-on learning in tools, techniques, and
        concepts &mdash; all skill levels and majors welcome.</p>
      <div class="cards">
        <div class="card">
          <span class="tag">Red Team</span>
          <h3>Offensive Security &amp; CTF</h3>
          <div class="time">Monday &middot; 1:30&ndash;3:30 PM</div>
          <p>Offensive security techniques and capture-the-flag challenges.</p>
        </div>
        <div class="card">
          <span class="tag">General Meetings</span>
          <h3>Workshops &amp; Speakers</h3>
          <div class="time">Friday &middot; 12:00&ndash;2:00 PM</div>
          <p>Hands-on workshops and talks from industry speakers.</p>
        </div>
        <div class="card">
          <span class="tag">CCDC Training</span>
          <h3>Network Defense</h3>
          <div class="time">Friday &middot; 2:00&ndash;4:00 PM</div>
          <p>Collegiate Cyber Defense Competition preparation and blue-team drills.</p>
        </div>
      </div>
    </div>
  </section>

  <section id="officers">
    <div class="wrap">
      <h2><span class="hash">#</span> Officers</h2>
      <p class="lead">Club leadership for the current year.</p>
      <div class="officers">
        <div class="officer"><div class="role">President</div><div class="who">Blake Bedford</div></div>
        <div class="officer"><div class="role">Vice President</div><div class="who">Aidan Messmer</div></div>
        <div class="officer"><div class="role">Treasurer</div><div class="who">Vinisha Bala Dhayanidhi</div></div>
      </div>
    </div>
  </section>
</main>

<footer class="site-footer" id="contact">
  <div class="wrap">
    <p>&copy; <?php echo date('Y'); ?> GrayHats &middot; Cybersecurity @ UW Bothell</p>
    <p>Site by <span class="mono">Blake Bedford</span></p>
  </div>
</footer>

<?php wp_footer(); ?>
</body>
</html>
