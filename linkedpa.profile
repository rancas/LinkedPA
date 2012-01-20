<?php
// $Id: standard.profile,v 1.2 2010/07/22 16:16:42 dries Exp $

require_once 'linkedpa.inc';

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function linkedpa_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = t('LinkedPA');
}

/**
 * Implements of hook_install_tasks().
 */
function linkedpa_install_tasks() {
  $tasks = array(
    'linkedpa_import_vocabularies_batch' => array(
      'display_name' => st('Import terms'),
      'display' => TRUE,
      'type' => 'batch',
      'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
    ),
    'linkedpa_create_menus' => array(),
    'linkedpa_batch_processing' => array(
      'display_name' => st('Install LinkedPA'),
      'display' => TRUE,
      'type' => 'batch',
      'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
    ),
    'linkedpa_config_vars' => array(),
  );
  return $tasks;
}

function linkedpa_config_vars() {
  // Add text formats. -- from D7Standard
  $filtered_html_format = array(
    'format' => 'filtered_html',
    'name' => 'Filtered HTML',
    'weight' => 0,
    'filters' => array(
      // URL filter.
      'filter_url' => array(
        'weight' => 0,
        'status' => 1,
      ),
      // HTML filter.
      'filter_html' => array(
        'weight' => 1,
        'status' => 1,
      ),
      // Line break filter.
      'filter_autop' => array(
        'weight' => 2,
        'status' => 1,
      ),
      // HTML corrector filter.
      'filter_htmlcorrector' => array(
        'weight' => 10,
        'status' => 1,
      ),
    ),
  );
  $filtered_html_format = (object) $filtered_html_format;
  filter_format_save($filtered_html_format);

  $full_html_format = array(
    'format' => 'full_html',
    'name' => 'Full HTML',
    'weight' => 1,
    'filters' => array(
      // URL filter.
      'filter_url' => array(
        'weight' => 0,
        'status' => 1,
      ),
      // Line break filter.
      'filter_autop' => array(
        'weight' => 1,
        'status' => 1,
      ),
      // HTML corrector filter.
      'filter_htmlcorrector' => array(
        'weight' => 10,
        'status' => 1,
      ),
    ),
  );
  $full_html_format = (object) $full_html_format;
  filter_format_save($full_html_format);

  // theme
  theme_enable(array('linkedpatheme', 'seven'));
  variable_set('theme_default', 'linkedpatheme');
  variable_set('admin_theme', 'seven');

  // Set default homepage
  variable_set('site_frontpage', 'frontpage');

  // Set default timezone
  variable_set('site_default_country', 'Italy');
  variable_set('date_default_timezone', 'Europe/Rome');
  variable_set('date_first_day', 'Monday');
      
  // Keep errors in the log and off the screen
  variable_set('error_level', 0);
}

/**
 * Defines batch op for importing
 */
function linkedpa_import_vocabularies_batch() {
  $batch = array(
    'operations' => array(
      array('linkedpa_import_vocabularies', array()),
    ),
    'finished' => 'linkedpa_import_vocabularies_finished',
    'title' => t('Import terms'),
    'init_message' => t('Starting import.'),
    'progress_message' => t('Processed @current out of @total.'),
    'error_message' => t('Example Batch has encountered an error.'),
  );
  return $batch;
}

/**
 * Import batch operation for vocs
 */
function linkedpa_import_vocabularies(&$context) {
  if (!isset($context['sandbox']['progress'])) {
    $vocs = taxonomy_vocabulary_load_multiple(FALSE);
    $context['sandbox']['progress'] = 0;
    $context['sandbox']['current_node'] = 0;
    $context['sandbox']['max'] = count($vocs);
    $context['sandbox']['vocs'] = $vocs;
  }

  $voc = array_pop($context['sandbox']['vocs']);
  linkedpa_import_vocabulary($voc, $context);
  $context['sandbox']['progress']++;

  if ($context['sandbox']['progress'] != $context['sandbox']['max']) {
    $context['finished'] = $context['sandbox']['progress'] / $context['sandbox']['max'];
  }
}

/**
 * Imports terms into a vocabulary using taxonomy csv
 */
function linkedpa_import_vocabulary($voc, &$context) {
  // Note: drupal_get_path('profile', 'linkedpa') didn't work here.
  $import_dir =  dirname(__FILE__) . '/taxonomy_import/';

  // Use Taxonomy CSV to import terms from a file.
  $module_dir = dirname(__FILE__) . '/modules/contrib/taxonomy_csv';
  require_once("$module_dir/import/taxonomy_csv.import.api.inc");

  // Import terms for each voc, where a .csv file exits.
  $filename = $import_dir . $voc->machine_name . '.csv';


$myFile = "linkedpa_profile_debug.txt";
$fh = fopen($myFile, 'a') or die("can't open file");
fwrite($fh, "add " . $filename . "\n");
fclose($fh);


  if (!file_exists($filename)) {
    return;
  }

  // Set options for import.
  $options['import_format'] = TAXONOMY_CSV_FORMAT_PARENTS;
  $options['enclosure'] = '"';
  $options['vocabulary_target'] = 'existing';
  $options['vocabulary_id'] = $voc->vid;
  $options['check_hierarchy'] = FALSE;
  $options['set_hierarchy'] = 1;
  $options['existing_items'] = TAXONOMY_CSV_EXISTING_UPDATE_MERGE;
  $options['url'] = $filename;
  taxonomy_csv_import($options);

  $context['results'][] = t('Imported terms for vocabulary @voc_name', array('@voc_name' => $voc->name));
}

/**
 * Prints message after batch is finished
 */
function linkedpa_import_vocabularies_finished($success, $results, $operations) {
  $message = "";
  if ($success) {
    $message .= theme('item_list', array('items' => $results));
  }
  $message .= t("Import finished");
  drupal_set_message($message);
}


/**
 * Create menus.
 */
function linkedpa_create_menus() {
  $menus = _get_menus();
  foreach ($menus as $menu) {
    if (!isset($menu['description'])) $menu['description'] = '';
    menu_save($menu);
  }
}

function linkedpa_batch_processing(&$install_state) {
  return array(
    'title' => st('Create basic nodes and menu items'),
    'operations' => array(
      array('linkedpa_batch_create_nodes_batch', array()),
      array('linkedpa_batch_create_menu_items_batch', array()),
    ),
  );
}

/**
 * Create nodes.
 */
function linkedpa_batch_create_nodes_batch(&$context) {
 if (empty($context['sandbox'])) {
    $context['sandbox']['items'] = _get_nodes_and_menu_items();
    $context['sandbox']['keys'] = array_keys($context['sandbox']['items']);
    $context['sandbox']['progress'] = 0;
    $context['sandbox']['max'] = count($context['sandbox']['keys']);
  }

  $items =& $context['sandbox']['items'];
  $key = $context['sandbox']['keys'][$context['sandbox']['progress']];

  $item_arr = $items[$key];

  // Create and save node object
  if (isset($item_arr['type'])) {
    $node = new stdClass();
    $node->type = $item_arr['type'];
    node_object_prepare($node);

    // Initialize node fields
    $node->title = $item_arr['title'];
    $node->language = LANGUAGE_NONE;
    $node->uid = $item_arr['uid'];
    $node->title_field[$node->language][0]['value'] =  $item_arr['title'];
    $node->body[$node->language][0]['value'] =  $item_arr['body'];
    $node->body[$node->language][0]['summary'] = $item_arr['body'];
    $node->body[$node->language][0]['format'] = 'filtered_html';
    $node->path = array('pathauto' => 0, 'alias' => $item_arr['path']);

    // Save node
    if($node = node_submit($node)) { // Prepare node for saving
      node_save($node);
      $item_arr['path'] = 'node/' . $node->nid;
      $items[$key] = $item_arr;
    }
  }

  $context['sandbox']['progress']++;

  if ($context['sandbox']['progress'] != $context['sandbox']['max']) {
    $context['finished'] = $context['sandbox']['progress'] / $context['sandbox']['max'];
  } else {
    variable_set('linkedpa_nodes_and_menu_items', $items);
  }
}


/**
 * Create menu items.
 */
function linkedpa_batch_create_menu_items_batch(&$context) {
  if (empty($context['sandbox'])) {
    $context['sandbox']['items'] = variable_get('linkedpa_nodes_and_menu_items', array());
    $context['sandbox']['keys'] = array_keys($context['sandbox']['items']);
    $context['sandbox']['progress'] = 0;
    $context['sandbox']['max'] = count($context['sandbox']['keys']);
  }

  $items =& $context['sandbox']['items'];
  $key = $context['sandbox']['keys'][$context['sandbox']['progress']];

  $item_arr = $items[$key];

  // Create menu items
  if (isset($item_arr['menus'])) {
    foreach ($item_arr['menus'] as $menu) {
      $item = array(
        'link_title' =>  $item_arr['title'],
        'link_path' => $item_arr['path'],
        'weight' => isset($item_arr['weight']) ? $item_arr['weight'] : 0,
      );
      $item['menu_name'] = $menu;
      if (isset($item_arr['parent']) && isset($items[$item_arr['parent']][$menu . '.mlid'])) {
        $item['plid'] = $items[$item_arr['parent']][$menu . '.mlid'];
      } else {
        $item['expanded'] = true;
      }
      if ($mlid = menu_link_save($item)) {
        $items[$key][$menu . '.mlid'] = $mlid;
      }
      unset($item);
    }
  }

  $context['sandbox']['progress']++;

  if ($context['sandbox']['progress'] != $context['sandbox']['max']) {
    $context['finished'] = $context['sandbox']['progress'] / $context['sandbox']['max'];
  } else {
    menu_rebuild();
    variable_del('linkedpa_nodes_and_menu_items');
  }
}
