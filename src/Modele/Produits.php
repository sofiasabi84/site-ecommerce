<?php 

namespace App\Modele;

class Produits {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function selectprod($id) {
        $sql = "SELECT id, nom, prix, URLimage, description FROM produits WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id' => $id]);
        $produit = $stmt->fetch(\PDO::FETCH_ASSOC);
        return $produit ?: false;
    }

    public function selectByCategory($id_categorie) {
        // Récupérer les sous-catégories
        $sqlSub = "SELECT id FROM categorie WHERE parent_id = :id_categorie";
        $stmtSub = $this->db->prepare($sqlSub);
        $stmtSub->execute(['id_categorie' => $id_categorie]);
        $subCategories = $stmtSub->fetchAll(\PDO::FETCH_COLUMN);

        // Inclure la catégorie principale dans la liste
        $categories = array_merge([$id_categorie], $subCategories);

        // Construire la partie IN (?, ?, ...)
        $placeholders = implode(',', array_fill(0, count($categories), '?'));

        // Préparer la requête avec IN pour toutes les catégories
        $sql = "SELECT id, nom, prix, URLimage FROM produits WHERE id_categorie IN ($placeholders)";
        $stmt = $this->db->prepare($sql);
        $stmt->execute($categories);

        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function selectAllWithCategorie() {
        $sql = "SELECT p.id, p.nom, p.prix, p.URLimage, c.nom AS categorie_nom 
                FROM produits p
                INNER JOIN categorie c ON p.id_categorie = c.id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function rechercherProduits($motCle) {
    $sql = "SELECT * FROM produits WHERE nom LIKE :motCle OR description LIKE :motCle";
    $stmt = $this->db->prepare($sql);
    $stmt->execute(['motCle' => '%' . $motCle . '%']);
    return $stmt->fetchAll();
}

}
