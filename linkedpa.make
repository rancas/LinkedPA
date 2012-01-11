; LinkedPA profile make file
core = 7.x
api = 2

;  -  Modules  -

; Main modules
projects[ctools] = 1.0-rc1

; Features
projects[features] = 1.0-beta6

projects[diff] = 2.0
projects[strongarm] = 2.0-beta5

;Field types
projects[entityreference] = 1.0-beta3
projects[field_group] = 1.1 
projects[link] = 1.0
projects[date] = 2.0-rc1


;Taxonomy utils
projects[taxonomy_csv] = 5.6
projects[taxonomy_manager] = 1.0-beta2


;Web services

;Misc
projects[colorbox] = 1.2
projects[media] = 1.0-rc2


;LinkedPA Features
projects[linkedpa_features][type] = module
projects[linkedpa_features][download][type] = get
projects[linkedpa_features][download][url] = http://localhost/content_types_and_taxonomies-7.x-1.0-beta1.tar


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

