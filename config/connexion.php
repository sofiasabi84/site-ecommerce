<?php

// Ne pas toucher ! NE RIEN CHANGER

function connect($config){
    try{
        $db = new
PDO('mysql:host='.$config['serveur'].';dbname='.$config['db'],$config['login'],
$config['mdp']);
    }
    catch(Exception $e){
        $db = NULL;
    }
    return $db;
}
?>