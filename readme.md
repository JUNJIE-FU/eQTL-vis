# zmap eqtlviz module instruction
zmap eqtlviz drupal module is used for display zea mays eqtl bubblemap and LD headmap.
## Installation
you would use drush command to install and enable this module. e.g.
`drush en -y zmap_eqtlviz`
alter installed, it would created four tables necessary in database. otherwise you can create these tables through `includes/zmap_eqtlviz.sql` manual. 
Then you should import eqtl data to these tables use sql command.
Last you should do is create a directory or symbollink under drupal public dir(`sites/default/files`) which to store your LD data. 