<?php
function modifierQuantiteControleur($twig, $db) {
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    if (!isset($_GET['id'], $_GET['action'])) {
        header('Location: index.php?page=panier');
        exit;
    }

    $id = (int) $_GET['id'];
    $action = $_GET['action'];

    if (isset($_SESSION['panier'][$id])) {
        if ($action === 'plus') {
            $_SESSION['panier'][$id]['quantite']++;
        } elseif ($action === 'moins') {
            $_SESSION['panier'][$id]['quantite']--;
            if ($_SESSION['panier'][$id]['quantite'] <= 0) {
                unset($_SESSION['panier'][$id]);
            }
        }
    }

    header('Location: index.php?page=panier');
    exit;
}
