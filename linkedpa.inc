<?php

/**
 * Return menus.
 */
function _get_menus() {
  // Define new menus
  $menus = array();
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
    'user/login' => array(
      'path' => 'user/login',
      'title' => 'Log in',
      'weight' => -20,
      'menus' => array('user-menu'),
    ),
    'user/register' => array(
      'path' => 'user/register',
      'title' => 'Register',
      'weight' => -15,
      'menus' => array('user-menu'),
    ),
  );
  return $items;
}


