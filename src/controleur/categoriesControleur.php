<?php
use App\Modele\Produits;

require_once __DIR__ . '/../modele/Produits.php';


function categoriesControleur($twig, $db, $filtreCategorie = null) {
    $produitsModel = new Produits($db);

    $tousProduits = $produitsModel->selectAllWithCategorie();

    $produitsParCategorie = [];

    // Liste des catégories maquillage
    $categoriesMaquillage = [
        'Rouges à lèvres',
        'Palette pour les Yeux',
        'Anti-Cerne',
        'Blush',
        'Fond de Teint',
        'Mascara'
    ];

    foreach ($tousProduits as $produit) {
        $categorieNom = $produit['categorie_nom'];

        if ($filtreCategorie === 'soins' && strtolower($categorieNom) !== 'soins') {
            continue;
        }

        if ($filtreCategorie === 'maquillage' && !in_array($categorieNom, $categoriesMaquillage, true)) {
            continue;
        }

        if (!isset($produitsParCategorie[$categorieNom])) {
            $produitsParCategorie[$categorieNom] = [];
        }
        $produitsParCategorie[$categorieNom][] = $produit;
    }

    // Choix de la vue selon filtre
    if ($filtreCategorie === 'soins') {
        echo $twig->render('soins.html.twig', ['produits_par_categorie' => $produitsParCategorie]);
    } else {
        // Par défaut maquillage (ou tout si null)
        echo $twig->render('maquillage.html.twig', ['produits_par_categorie' => $produitsParCategorie]);
    }
}
