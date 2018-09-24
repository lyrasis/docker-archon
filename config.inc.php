<?php
   $_ARCHON->db->ServerType = "MySQL";
   $_ARCHON->db->ServerAddress = getenv('MYSQL_HOST');
   $_ARCHON->db->Login = getenv('MYSQL_USER');
   $_ARCHON->db->Password = getenv('MYSQL_PASSWORD');
   $_ARCHON->db->DatabaseName = getenv('MYSQL_DB');
?>
