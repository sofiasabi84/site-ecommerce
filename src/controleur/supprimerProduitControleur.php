<?php
function supprimerProduitControleur($twig, $db) {
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    if (isset($_GET['id'])) {
        $id = (int) $_GET['id'];
        if (isset($_SESSION['panier'][$id])) {
            unset($_SESSION['panier'][$id]);
        }
    }

    header('Location: index.php?page=panier');
    exit;
}
