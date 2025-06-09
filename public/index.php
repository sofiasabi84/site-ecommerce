<?php
session_start();

require_once '../lib/vendor/autoload.php'; 
require_once '../config/parametres.php'; 
require_once '../config/connexion.php'; 
require_once '../src/controleur/_controleurs.php'; 
require_once '../config/routes.php'; 
require_once '../src/modele/_classes.php';

require_once __DIR__ . '/../src/controleur/PaiementControleur.php';
require_once __DIR__ . '/../src/controleur/SoinsControleur.php';


$db = connect($config);

$loader = new \Twig\Loader\FilesystemLoader('../src/vue/');
$twig = new \Twig\Environment($loader, []);

list($contenu, $page) = getPage($db);

if ($contenu === 'paiementControleur') {
    $controleur = new paiementControleur($twig, $db);

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $controleur->traiterPaiement();
    } else {
        $controleur->afficher($page);
    }
} else {
    if (function_exists($contenu)) {
        $contenu($twig, $db, $page);
    } else {
        echo "Page '$page' introuvable.";
    }
}

