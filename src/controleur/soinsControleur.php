<?php

use App\Modele\Produits;

require_once __DIR__ . '/../modele/Produits.php';

function soinsControleur($twig, $db, $page) {
    $produitsModel = new Produits($db);
    $tousProduits = $produitsModel->selectAllWithCategorie();

    $produitsParCategorie = [];

    // Liste des sous-catégories de soins (à adapter selon ta base de données)
    $categoriesSoins = [
        'Crème',
        'Lotion',
        'Gommage',
        'Sérum',
        'Nettoyant',
        'Masque',
        'Tonique',
        'Hydratant',
        'Soin Contour des Yeux'
    ];

    foreach ($tousProduits as $produit) {
        $categorieNom = $produit['categorie_nom'];

        if (!in_array($categorieNom, $categoriesSoins, true)) {
            continue; // On saute tout ce qui n’est pas un soin
        }

        if (!isset($produitsParCategorie[$categorieNom])) {
            $produitsParCategorie[$categorieNom] = [];
        }

        $produitsParCategorie[$categorieNom][] = $produit;
    }

    echo $twig->render('soins.html.twig', [
        'produits_par_categorie' => $produitsParCategorie
    ]);
}
