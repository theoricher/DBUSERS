<?php
function plugin_version_dbusers()
{
return array('name' => 'dbusers',
'version' => '1.0',
'author'=> 'Théo RICHER',
'license' => 'GPLv3',
'verMinOcs' => '2.4');
}

function plugin_init_dbusers()
{
$object = new plugins;
$object -> add_cd_entry("dbusers","other");

$object -> sql_query("CREATE TABLE `dbusers` (
   `ID`                           INT(11)      NOT NULL AUTO_INCREMENT,
   `HARDWARE_ID`                  INT(11)      NOT NULL,
   `NAME`                         VARCHAR(255)     NULL DEFAULT NULL,
   PRIMARY KEY (`HARDWARE_ID`, `ID`),
   INDEX `NAME` (`NAME`),
   INDEX `ID` (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT;");

}

function plugin_delete_dbusers()
{
$object = new plugins;
$object -> del_cd_entry("dbusers");

$object -> sql_query("DROP TABLE `dbusers`;");

}

?>
