<?php
function grayhats_assets() {
    wp_enqueue_style(
        'grayhats-fonts',
        'https://fonts.googleapis.com/css2?family=Noto+Sans+Mono:wght@400;500;700&display=swap',
        array(),
        null
    );
    wp_enqueue_style('grayhats-style', get_stylesheet_uri(), array('grayhats-fonts'), '1.0');
}
add_action('wp_enqueue_scripts', 'grayhats_assets');
