<?php

use App\Modele\Produits;
// inclure la classe Produits manuellement
require_once __DIR__ . '/../modele/Produits.php';

// ta fonction contrôleur
function parfumsControleur($twig, $db) {
    $produits = new Produits($db);
    $idCategorieParfums = 9;  // adapte l'id selon ta table catégorie

    $listeParfums = $produits->selectByCategory($idCategorieParfums);


    echo $twig->render('parfums.html.twig', ['parfums' => $listeParfums]);
}
