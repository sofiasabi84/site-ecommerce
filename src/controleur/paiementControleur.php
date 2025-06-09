<?php

class paiementControleur {
    private $twig;
    private $db;

    public function __construct($twig, $db) {
        $this->twig = $twig;
        $this->db = $db;
    }

    public function afficher($page) {
        $message = null;
        if (isset($_SESSION['message'])) {
            $message = $_SESSION['message'];
            unset($_SESSION['message']);
        }

        // Exemple panier simulé
        $panier = [
            ['nom' => 'Produit 1', 'quantite' => 2, 'prix' => 15.00],
            ['nom' => 'Produit 2', 'quantite' => 1, 'prix' => 25.50]
        ];

        echo $this->twig->render('paiement.html.twig', [
            'panier' => $panier,
            'message' => $message,
            'page' => $page
        ]);
    }

    public function traiterPaiement() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $numeroCarte = filter_input(INPUT_POST, 'numeroCarte', FILTER_SANITIZE_STRING);
            $nomCarte = filter_input(INPUT_POST, 'nomCarte', FILTER_SANITIZE_STRING);
            $dateExpiration = filter_input(INPUT_POST, 'dateExpiration', FILTER_SANITIZE_STRING);
            $cvv = filter_input(INPUT_POST, 'cvv', FILTER_SANITIZE_STRING);

            if (!$this->validerDonneesPaiement($numeroCarte, $nomCarte, $dateExpiration, $cvv)) {
                $_SESSION['message'] = ['type' => 'error', 'text' => "Veuillez vérifier vos informations de paiement"];
                header('Location: index.php?page=paiement');
                exit;
            }

            // Traitement paiement fictif
            $_SESSION['message'] = ['type' => 'success', 'text' => "Paiement effectué avec succès"];
            header('Location: index.php?page=paiement');
            exit;
        }
    }

    private function validerDonneesPaiement($numeroCarte, $nomCarte, $dateExpiration, $cvv) {
        if (!preg_match('/^[0-9]{16}$/', str_replace(' ', '', $numeroCarte))) {
            return false;
        }
        if (strlen($nomCarte) < 3) {
            return false;
        }
        if (!preg_match('/^(0[1-9]|1[0-2])\/([0-9]{2})$/', $dateExpiration)) {
            return false;
        }
        if (!preg_match('/^[0-9]{3,4}$/', $cvv)) {
            return false;
        }
        return true;
    }
}
