<?php

/**
 * Return menus.
 */
function _get_menus() {
  // Define new menus
  $menus = array(
    'horizontal' => array(
	'menu_name' => 'horizontal-menu',
	'title' => 'Horizontal menu',
	'description' => 'il menu orizzontale'
	),
    'footer' => array(
	'menu_name' => 'footer-menu',
	'title' => 'Footer menu',
	'description' => 'il menu del footer'
	),
  );
  return $menus;
}


/**
 * Returns node and menu structure.
 */
function _get_nodes_and_menu_items() {
 $items = array(
    'about' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'about',
      'title' => 'About us',
      'body' => '<p>You can edit this text.</p>',
      'menus' => array('main-menu'),
    ),
    'contact' => array(
      'path' => 'contact',
      'title' => 'Contact us',
      'parent' => 'about',
      'menus' => array('main-menu'),
    ),
    'education' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'education',
      'title' => 'Education',
      'body' => '<p>You can edit this text.</p>',
      'menus' => array('main-menu'),
    ),
    'education/undergraduate' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'education/undergraduate',
      'title' => 'Undergraduate',
      'body' => '<p>You can edit this text.</p>',
      'parent' => 'education',
      'menus' => array('main-menu'),
    ),
    'education/masters' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'education/masters',
      'title' => 'Masters',
      'body' => '<p>You can edit this text.</p>',
      'parent' => 'education',
      'menus' => array('main-menu'),
    ),

    'note-legali' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'note-legali',
      'title' => 'Note legali',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('footer-menu'),
      'field_tipo_pagina' => 'Generica',
    ),
    'mappa-del-sito' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'mappa-del-sito',
      'title' => 'Mappa del sito',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('footer-menu'),
    ),
    'privacy' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'privacy',
      'title' => 'Privacy',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('footer-menu'),
    ),
    'credits' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'credits',
      'title' => 'Credits',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('footer-menu'),
    ),
    'user' => array(
      'path' => 'user',
      'title' => 'Area riservata',
      'menus' => array('footer-menu'),
    ),

  );
  return $items;
}


