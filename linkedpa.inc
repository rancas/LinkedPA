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
    'il-comune' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'il-comune',
      'title' => 'Il Comune',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('main-menu'),
    ),
    'urp' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'urp',
      'title' => 'URP',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('main-menu'),
    ),
    'trasparenza' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'trasparenza',
      'title' => 'Trasparenza',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('main-menu'),
    ),
    'trasparenza/assenze-personale-dipendente' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'trasparenza/assenze-personale-dipendente',
      'title' => 'Assenze personale dipendente',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'parent' => 'trasparenza',
      'menus' => array('main-menu'),
    ),
    'albo-pretorio' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'albo-pretorio',
      'title' => 'Albo Pretorio',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('main-menu'),
    ),
    'contatti' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'contatti',
      'title' => 'Contatti',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('main-menu'),
    ),
    'note-legali' => array(
      'type' => 'pagina',
      'uid' => 1,
      'path' => 'note-legali',
      'title' => 'Note legali',
      'body' => '<p>Puoi modificare questo testo di esempio.</p>',
      'menus' => array('footer-menu'),
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
      'field_tipo_pagina' => 'Generica',
    ),
    'user' => array(
      'path' => 'user',
      'title' => 'Area riservata',
      'menus' => array('footer-menu'),
    ),

  );
  return $items;
}


