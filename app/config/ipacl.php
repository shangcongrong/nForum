<?php
$config['ipacl']['global'] = array(); 
$config['ipacl']['wsapi']['sys_checkpwd'] = array(
    array("0.0.0.1", 0, false),
    array("::1", 0, false)
);
$config['ipacl']['wsapi']['u_setpwd'] = array(
    array("0.0.0.1", 0, false),
    array("::1", 0, false)
);
$config['ipacl']['wsapi']['sys_test'] = array(
    array("0.0.0.1", 0, false),
    array("::1", 0, false)
);
?>
