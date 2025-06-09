<?php
use App\Modele\Produits;

require_once __DIR__ . '/../modele/Produits.php';

function rechercheControleur($twig, $db, $page) {
    $produits = new Produits($db);
    $motCle = $_GET['q'] ?? '';
    $resultats = [];

    if (!empty($motCle)) {
        $resultats = $produits->rechercherProduits($motCle);
    }

    echo $twig->render('recherche.html.twig', [
        'motCle' => $motCle,
        'resultats' => $resultats
    ]);
}
