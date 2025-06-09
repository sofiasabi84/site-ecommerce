<?php
function panierControleur($twig, $db) {
    $panier = isset($_SESSION['panier']) ? $_SESSION['panier'] : [];

    // Calcul du total panier
    $totalPanier = 0;
    foreach ($panier as $item) {
        $totalPanier += $item['prix'] * $item['quantite'];
    }

    // Gestion du code promo (soumis via POST)
    $codePromo = '';
    $remise = 0;
    $livraison = 5; // frais de base si total < 50€

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['promo'])) {
        $codePromo = trim($_POST['promo']);

        if (strtoupper($codePromo) === 'BIENVENUE') {
            $remise = 0.20 * $totalPanier;
        }
    }

    // Livraison gratuite dès 50€ (après remise)
    $totalApresRemise = $totalPanier - $remise;
    if ($totalApresRemise >= 50) {
        $livraison = 0;
    }

    $totalFinal = $totalApresRemise + $livraison;

    echo $twig->render('panier.html.twig', [
        'panier' => $panier,
        'totalPanier' => $totalPanier,
        'codePromo' => $codePromo,
        'remise' => $remise,
        'livraison' => $livraison,
        'totalFinal' => $totalFinal,
    ]);
}
