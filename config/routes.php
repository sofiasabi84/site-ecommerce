<?php


function getPage($db) {
    $lesPages = [
        'accueil' => "accueilControleur",
        'contact' => "contactControleur",
        'mention' => "mentionControleur",
        'apropos' => "aproposControleur",
        'panier' => "panierControleur",
        'ajouterPanier' => 'ajouterPanierControleur',
        'maquillage' => "categoriesControleur", // On ajoute 'soins' ici
        'connexion' => "connexionControleur",
        'inscrire' => "inscrireControleur",
        'modifier_quantite' => 'modifierQuantiteControleur',
        'supprimer_produit' => 'supprimerProduitControleur',
        'parfums' => 'parfumsControleur',
        'authentification' => 'authentificationControleur',
        'produit' => 'produitControleur',
        'paiement' => 'paiementControleur',
        'soins' => 'soinsControleur',
        'recherche' => 'rechercheControleur',

    ];

    $page = isset($_GET['page']) ? $_GET['page'] : 'authentification';


    if (isset($lesPages[$page])) {
        $contenu = $lesPages[$page];
    } else {
        $contenu = $lesPages['accueil'];
        $page = 'accueil'; // pour éviter un undefined
    }

    // Retourne le contrôleur ET la page
    return [$contenu, $page];
}

