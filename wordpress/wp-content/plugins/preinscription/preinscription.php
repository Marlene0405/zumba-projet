<?php
/*
Plugin Name: Préinscription
Plugin URI: http://wordpress.org/plugins/hello-dolly/
Description: Formulaire de préinscription
Author: Marlène Canot
Version: 0.1
Author URI: http://
*/

add_action('init', 'preinscription_init');
/**
 * Permet d'initialiser les fonctionnalités liées au formulaire
 */
function preinscription_init(){
    register_post_type('formulaire', array(
        'public'=> true,
        'labels' => array(
            'name' => __( 'Pré-inscription' ),
            'singular_name' => __( 'Pré-inscription' )
        ),
        'public' => true,
        'hierarchical' => true,
        'show_ui' => true,
        'publicly_queryable' => true,
        'exclude_from_search' => false,
        'menu_position' => 5,
        'capabililty_type'=>'post',
        'supports' => array( 'title', 'editor', 'comments', 'trackbacks', 'author', 'excerpt', 'custom-fields', 'thumbnail' ),
        'rewrite' => array( 'slug' => 'mypage', 'with_front' => false ),
    ));
}
/**
 * Permet d'afficher le formulaire
 */
function preinscription_show(){
    echo 'mon formulaire sera ici';
}