<?php

// Ajouter cet import au début pour inclure la classe Produits
use App\Modele\Produits;

function ajouterPanierControleur($twig, $db) {
    // Vérifier que l'id du produit est passé en GET
    if (!isset($_GET['id']) || empty($_GET['id'])) {
        header("Location: index.php?page=maquillage");
        exit;
    }

    $idProduit = (int) $_GET['id'];

    $produitsModel = new Produits($db);
    $produit = $produitsModel->selectprod($idProduit);

    if (!$produit) {
        // Produit non trouvé : rediriger vers la page maquillage
        header("Location: index.php?page=maquillage");
        exit;
    }

    // Démarrer la session si pas déjà démarrée
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Initialiser le panier dans la session s'il n'existe pas
    if (!isset($_SESSION['panier'])) {
        $_SESSION['panier'] = [];
    }

    // Ajouter le produit au panier (incrementer la quantité si déjà présent)
    if (isset($_SESSION['panier'][$idProduit])) {
        $_SESSION['panier'][$idProduit]['quantite']++;
    } else {
        $_SESSION['panier'][$idProduit] = [
            'id' => $produit['id'],
            'nom' => $produit['nom'],
            'prix' => $produit['prix'],
            'quantite' => 1,
            'URLimage' => $produit['URLimage']
        ];
    }

    // Rediriger vers la page panier (ou maquillage)
    header("Location: index.php?page=panier");
    exit;
}
