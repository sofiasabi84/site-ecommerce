<?php
use App\Modele\Produits;
require_once __DIR__ . '/../modele/Produits.php';

function produitControleur($twig, $db) {
    if (!isset($_GET['id'])) {
        echo "Produit introuvable (paramètre manquant)";
        return;
    }

    $id = (int)$_GET['id'];
    $produitsModel = new Produits($db);
    $produit = $produitsModel->selectprod($id);

    if (!$produit) {
        echo "Produit non trouvé.";
        return;
    }

    echo $twig->render('produit.html.twig', ['produit' => $produit]);
}
