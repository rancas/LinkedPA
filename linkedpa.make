; LinkedPA profile make file
core = 7.x
api = 2


;  -  Modules  -

projects[ctools][subdir] = contrib
projects[ctools][version] = 1.0-rc1

projects[date][subdir] = contrib
projects[date][version] = 2.0-rc1

projects[devel][subdir] = contrib
projects[devel][version] = 1.2

projects[diff][subdir] = contrib
projects[diff][version] = 2.0

projects[ds][subdir] = contrib
projects[ds][version] = 1.4

projects[entity][subdir] = contrib
projects[entity][version] = 1.0-rc1

projects[entityreference][subdir] = contrib
projects[entityreference][version] = 1.0-beta3

projects[field_group][subdir] = contrib
projects[field_group][version] = 1.1

projects[features][subdir] = contrib
projects[features][version] = 1.0-beta6

projects[link][subdir] = contrib
projects[link][version] = 1.0

projects[media][subdir] = contrib
projects[media][version] = 1.0-rc2

projects[panels][subdir] = contrib
projects[panels][version] = 3.0-alpha3

projects[pathauto][subdir] = contrib
projects[pathauto][version] = 1.0

projects[strongarm][subdir] = contrib
projects[strongarm][version] = 2.0-beta5

projects[taxonomy_csv][subdir] = contrib
projects[taxonomy_csv][version] = 5.7

projects[taxonomy_manager][subdir] = contrib
projects[taxonomy_manager][version] = 1.0-beta2

projects[token][subdir] = contrib
projects[token][version] = 1.0-beta7

projects[transliteration][subdir] = contrib
projects[transliteration][version] = 3.0

projects[views][subdir] = contrib
projects[views][version] = 3.0

projects[views_bulk_operations][subdir] = contrib
projects[views_bulk_operations][version] = 3.0-beta3



;  -  Patches  -

; http://drupal.org/node/1079782
; Add support hook_entity_property_info().
;projects[link][patch][] = "http://drupal.org/files/issues/1079782-link-entity_property-7.patch"


;  -  Libraries  -

; Add the colorbox library.
libraries[colorbox][download][type] = "get"
libraries[colorbox][download][url] = "http://jacklmoore.com/colorbox/colorbox.zip"
libraries[colorbox][directory_name] = "colorbox"
libraries[colorbox][destination] = "libraries"


;  -  LinkedPA  -

projects[linkedpa_features][type] = module
projects[linkedpa_features][download][type] = git
projects[linkedpa_features][download][url] = git@github.com:sardbaba/linkedpa_features.git
projects[linkedpa_features][download][branch] = master

projects[linkedpa_theme][type] = theme
projects[linkedpa_theme][download][type] = git
projects[linkedpa_theme][download][url] = git@github.com:sardbaba/linkedpa_theme.git
projects[linkedpa_theme][download][branch] = master


