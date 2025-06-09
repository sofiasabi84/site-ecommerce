<?php
require_once __DIR__ . '/../modele/Produits.php';

// Connexion PDO (exemple, adapte selon ta config)
try {
    $db = new PDO('mysql:host=localhost;dbname=cosmetic;charset=utf8', 'root', '');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die('Erreur connexion BDD : ' . $e->getMessage());
}

$produitsModele = new Produits($db);

// Récupérer 4 produits par exemple (avec leurs IDs en BDD)
$produit1 = $produitsModele->selectprod(1);
$produit2 = $produitsModele->selectprod(2);
$produit3 = $produitsModele->selectprod(3);
$produit4 = $produitsModele->selectprod(4);

// Récupérer aussi les catégories (idées)
$categorie1 = [ 'nom' => 'Rouge à Lèvres', 'URLimage' => '/images/rouge_levres.jpg' ];
$categorie2 = [ 'nom' => 'Fond de Teint', 'URLimage' => '/images/fond_teint.jpg' ];
$categorie3 = [ 'nom' => 'Palette Yeux', 'URLimage' => '/images/palette_yeux.jpg' ];
$categorie4 = [ 'nom' => 'Mascara', 'URLimage' => '/images/mascara.jpg' ];
$categorie5 = [ 'nom' => 'Blush', 'URLimage' => '/images/blush.jpg' ];
$categorie6 = [ 'nom' => 'Anti-Cerne', 'URLimage' => '/images/eyeliner.jpg' ];

// Appel du moteur de rendu Twig (exemple)
echo $twig->render('maquillage.html.twig', [
    'produit1' => $produit1,
    'produit2' => $produit2,
    'produit3' => $produit3,
    'produit4' => $produit4,
    'categorie1' => $categorie1,
    'categorie2' => $categorie2,
    'categorie3' => $categorie3,
    'categorie4' => $categorie4,
    'categorie5' => $categorie5,
    'categorie6' => $categorie6,
]);
