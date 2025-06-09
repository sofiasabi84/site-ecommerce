-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 09 juin 2025 à 00:08
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cosmetic`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `URLimage` varchar(255) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`),
  UNIQUE KEY `idx_nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `URLimage`, `parent_id`) VALUES
(1, 'Rouges a levres', 'https://media.vogue.fr/photos/5fdb9697111af4d42011261a/master/w_1366%2cc_limit/ROUGE%20DIOR%20-%20LIP%20ARTISTRY%20(2).jpg', NULL),
(2, 'Fond de Teint', 'https://tse3.mm.bing.net/th?id=OIP.WceOAdq3RzyQols94NQ9vAHaFp&pid=Api', NULL),
(3, 'Palette pour les Yeux', 'https://tse1.explicit.bing.net/th?id=OIP.MVXxLDMbvxsiTuhAXijljQHaD4&pid=Api', NULL),
(4, 'Mascara', 'https://tse3.mm.bing.net/th?id=OIP.npVoROCt-nkHazolxnpmNAHaDt&pid=Api', NULL),
(5, 'Blush', 'https://tse4.mm.bing.net/th?id=OIP.OLRNiZ5xfQw24plJ6flH9AHaHa&pid=Api', NULL),
(6, 'Anti-Cerne', 'https://www.lemeilleuravis.com/wp-content/uploads/2020/07/le-nyx-professionnal-correcteur-et-anti-cernes-studio-photogenic-2.jpg', NULL),
(7, 'Soins', 'https://exemple.com/image-categorie-soins.jpg', NULL),
(9, 'Parfums', NULL, NULL),
(10, 'Lotion', 'https://exemple.com/image-lotion.jpg', 7),
(11, 'Crème', 'https://exemple.com/image-creme.jpg', 7),
(12, 'Gommage', 'https://exemple.com/image-gommage.jpg', 7),
(13, 'Sérum', 'https://exemple.com/image-serum.jpg', 7),
(14, 'Masque', 'https://exemple.com/image-masque.jpg', 7),
(15, 'Démaquillant', 'https://exemple.com/image-demaquillant.jpg', 7),
(16, 'Correcteur', 'https://exemple.com/image-correcteur.jpg', 7);

-- --------------------------------------------------------

--
-- Structure de la table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `newsletter`
--

INSERT INTO `newsletter` (`id`, `email`, `date_inscription`) VALUES
(1, 'sabisofiadu84@gmail.com', '2025-06-08 22:03:56'),
(2, 'du84@gmail.com', '2025-06-08 22:14:29'),
(3, 'siq@gmail.com', '2025-06-08 22:36:43');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_categorie` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` int NOT NULL,
  `stock` int NOT NULL,
  `URLimage` varchar(255) NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `id_categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `id_categorie`, `nom`, `prix`, `stock`, `URLimage`, `categorie`, `description`) VALUES
(25, 5, 'Blush Rosé', 12, 0, 'https://www.sothys.fr/images/blush-rose-collection-maquillage-sothys-paris-AH2024-1_5858_800.jpg', '', 'Rehausse délicatement le teint d\'une touche rosée. Idéal pour un look romantique et frais.'),
(26, 5, 'Blush Pêche', 13, 0, 'https://img01.ztat.net/article/spp-media-p1/0429431674dc479fb420217b53b37aac/c9405d20fdda4e608cb5ffb58a65348a.jpg?imwidth=1800&filter=packshot', '', 'Un souffle de douceur pour vos joues. La teinte pêche offre un éclat naturel et discret au teint.'),
(27, 6, 'Anti-Cerne Clair', 11, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwe7008f6c/images/hi-res/SKU/SKU_672/451695_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Corrige et illumine les cernes avec une texture légère. Idéal pour les peaux claires, il réveille instantanément le regard.'),
(28, 6, 'Anti-Cerne Medium', 12, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw1c87e673/images/hi-res/SKU/SKU_672/451688_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Couvre efficacement les cernes et les imperfections tout en offrant une teinte médium qui s\'adapte parfaitement au teint hâlé.'),
(35, 5, 'Blush Rose Poudré', 11, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw658fdbea/images/hi-res/SKU/SKU_3198/585603_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Teinte douce et veloutée pour un fini mat naturel. S’applique facilement pour un teint subtilement coloré.'),
(36, 5, 'Blush Corail', 12, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw9d4669e4/images/hi-res/SKU/SKU_3198/582910_swatch.jpg?sw=265&sh=265&sm=fit', '', 'Un blush frais et lumineux pour un effet bonne mine immédiat. La teinte corail réchauffe toutes les carnations.'),
(37, 5, 'Blush Liquide', 12, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwc6692224/images/hi-res/SKU/SKU_2383/527974_swatch.jpg?sw=265&sh=265&sm=fit', '', 'Texture fluide et modulable pour un effet seconde peau. Apporte une touche de couleur naturelle au visage.'),
(40, 6, 'Anti-Cerne Hydratant', 11, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw43e81fdb/images/hi-res/SKU/SKU_2039/528303_swatch.jpg?sw=265&sh=265&sm=fit', '', 'Ce correcteur allie couvrance et soin grâce à sa formule enrichie en agents hydratants. Fini naturel garanti.'),
(46, 11, 'Contour des Yeux', 15, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwce60f7a9/images/hi-res/SKU/SKU_6183/749036_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Soin ciblé pour réduire les poches, les cernes et lisser le contour de l’œil. Regard reposé jour après jour.\r\n\r\n'),
(54, 9, 'Ambre Mystérieux', 64, 10, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw109b983d/images/hi-res/SKU/SKU_5949/733611_swatch.jpg', '', 'Plongez dans un univers sensuel avec Ambre Mystérieux, un parfum aux notes chaleureuses et mystérieuses qui éveillent les sens. Sa composition élégante marie l’ambre doré à des touches boisées et épicées, créant une aura sophistiquée et irrésistible.\r\n\r\n✨ Notes riches et profondes pour une longue tenue\r\n🌿 Parfum élégant, idéal pour les soirées et occasions spéciales\r\n💫 Une signature olfactive unique qui captive et séduit'),
(55, 9, 'Brume Matinale', 30, 40, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwfd07c3fa/images/hi-res/SKU/SKU_6/439867_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Commencez votre journée en douceur avec la Brume Matinale, un soin léger et rafraîchissant qui hydrate et tonifie votre peau en un instant. Enrichie en actifs naturels, elle revitalise le teint pour un effet bonne mine immédiat.\r\n\r\n💧 Hydratation légère et sensation de fraîcheur\r\n🌿 Formule apaisante et non collante\r\n✨ Parfait pour réveiller la peau et fixer le maquillage\r\n🌸 Idéale pour une routine matinale dynamisante'),
(58, 9, 'Bois Envoûtant', 70, 12, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw0708e8c9/images/hi-res/SKU/618682_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Laissez-vous séduire par Bois Envoûtant, une fragrance sophistiquée qui révèle toute la richesse des notes boisées. Ses accords chauds et enveloppants évoquent un voyage sensoriel unique, mêlant intensité et raffinement.\r\n\r\n🌲 Notes profondes de cèdre, santal et patchouli\r\n✨ Parfum durable et élégant, idéal en soirée\r\n🌿 Une signature olfactive puissante et captivante'),
(133, 16, 'Correcteur Fluide', 0, 0, 'https://exemple.com/image-correcteur-fluide.jpg', '', NULL),
(134, 11, 'Crème Avène', 35, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwc5b00ae2/images/hi-res/SKU/SKU_6054/659056_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau une cure de lumière et de jeunesse avec la Crème Avène Activ B3. Enrichie en niacinamide (vitamine B3) et en provitamine C, cette crème innovante corrige les premiers signes de l\'âge, illumine le teint et renforce la barrière cutanée jour après jour. Sa texture fondante et non grasse convient parfaitement aux peaux sensibles et réactives.\r\n\r\n✔ Atténue les taches pigmentaires\r\n✔ Lisse les ridules et unifie le teint\r\n✔ Apaise et hydrate intensément grâce à l’eau thermale d’Avène\r\n✔ Testée sous contrôle dermatologique'),
(135, 11, 'Crème de Nuit', 45, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwc301dc2b/images/hi-res/SKU/SKU_3716/657797_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau une parenthèse de douceur et de régénération avec la Crème Nuit Clarins. Véritable soin cocon, elle agit pendant que vous dormez pour lisser les traits, hydrater intensément et réveiller l’éclat naturel de votre peau. Sa formule enrichie en extraits de plantes soigneusement sélectionnés aide la peau à récupérer du stress quotidien.\r\n\r\n🌙 Nourrit et régénère en profondeur\r\n🌿 Extraits végétaux aux propriétés revitalisantes\r\n💧 Peau souple, reposée et lumineuse au réveil\r\n💤 Texture veloutée, parfaite pour les peaux fatiguées ou stressées'),
(136, 11, 'Crème Hydratante', 15, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw6262a7ff/images/hi-res/SKU/SKU_3578/578103_swatch.jpeg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau une hydratation durable et sur-mesure avec la Crème Hydratante Bioderma. Grâce à son complexe dermatologique breveté, elle renforce la barrière cutanée, restaure l\'équilibre en eau et redonne éclat et confort dès la première application. Sa texture onctueuse et légère pénètre rapidement sans laisser de film gras.\r\n\r\n💧 Hydrate intensément et durablement\r\n🌿 Respecte les peaux sensibles grâce à une formulation haute tolérance\r\n🛡 Renforce la barrière cutanée et prévient les tiraillements\r\n✨ Laisse la peau douce, souple et lumineuse'),
(137, 9, 'Parfum CHANEL', 150, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwbab29bf5/images/hi-res/SKU/SKU_4/337229_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Découvrez Eau de Parfum Élégance, une fragrance raffinée qui sublime votre personnalité avec des notes florales et gourmandes. Son sillage délicat et sensuel enveloppe la peau d’un voile précieux, parfait pour toutes les occasions où vous souhaitez laisser une impression inoubliable.\r\n\r\n🌸 Accord floral harmonieux avec une touche de vanille douce\r\n✨ Parfum longue tenue pour un effet durable\r\n🌿 Flacon élégant, reflet d’un luxe discret et intemporel'),
(138, 9, 'Lancôme', 73, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw22b0e072/images/hi-res/SKU/SKU_2/254230_swatch.jpg', '', 'Découvrez l’univers olfactif de Lancôme, symbole de raffinement et de féminité. Chaque parfum est une œuvre d’art, alliant délicatesse et intensité, pour révéler votre personnalité avec grâce et audace. Des notes florales, fruitées ou boisées s’entrelacent avec élégance pour offrir un sillage inoubliable.\r\n\r\n✨ Formulations d’exception pour une tenue longue durée\r\n🌸 Parfums iconiques, modernes et intemporels\r\n🌿 Un luxe accessible qui sublime chaque moment de votre vie'),
(139, 2, 'Fdt Poudre', 45, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw6ee3b369/images/hi-res/SKU/SKU_4386/645617_swatch.jpg', '', 'Obtenez un teint uniforme et matifié avec le Fond de Teint Poudre, une texture fine et légère qui se fond parfaitement sur la peau. Idéal pour camoufler les petites imperfections tout en laissant respirer la peau pour un fini naturel et velouté.\r\n\r\n✨ Unifie et matifie sans effet masque\r\n🌿 Texture légère, facile à appliquer et à estomper\r\n💧 Contrôle la brillance tout au long de la journée\r\n🌟 Convient à tous les types de peau, même sensibles'),
(140, 9, 'Fleur de Vanille', 99, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw98cff227/images/hi-res/SKU/SKU_4886/703141_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Laissez-vous envelopper par Fleur de Vanille, une fragrance délicate qui marie la douceur envoûtante de la vanille à des notes florales raffinées. Ce parfum chaleureux et sensuel évoque un sillage à la fois tendre et sophistiqué, parfait pour illuminer vos journées et soirées.\r\n\r\n🌸 Accord gourmand de vanille subtilement associé à des fleurs délicates\r\n✨ Tenue longue durée pour un charme durable\r\n🌿 Une essence raffinée, idéale pour une féminité douce et captivante'),
(141, 2, 'Fond de Teint Fluide', 47, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw2338f84c/images/hi-res/SKU/SKU_6/97075_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Découvrez le Fond de Teint Fluide, une texture légère et fluide qui unifie le teint tout en offrant une couvrance modulable. Sa formule hydratante laisse la peau douce, confortable et éclatante de santé toute la journée.\r\n\r\n💧 Hydrate et protège la peau\r\n✨ Camoufle les imperfections pour un fini naturel\r\n🌿 Texture légère, facile à appliquer et à estomper\r\n🌟 Convient à tous les types de peau, même sensibles'),
(142, 7, 'Gel Nettoyant Doux', 0, 0, 'https://exemple.com/image-gel-nettoyant.jpg', '', NULL),
(143, 1, 'Gloss Transparent', 0, 0, 'https://exemple.com/image-gloss-transparent.jpg', '', NULL),
(144, 12, 'Gommage Visage et Cheveux', 16, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwb258a9e6/images/hi-res/SKU/SKU_2217/503123_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Ce soin exfoliant doux élimine les impuretés, les cellules mortes et l\'excès de sébum en un seul geste. Adapté à la fois au visage et au cuir chevelu, il purifie, lisse et stimule la microcirculation pour un effet \"peau neuve\" immédiat et une chevelure plus saine dès la racine.\r\n\r\n🌿 Micrograins d’origine naturelle pour une exfoliation efficace mais douce\r\n💧 Nettoie, purifie et oxygène la peau et le cuir chevelu\r\n✨ Teint plus lumineux, cheveux plus légers et éclatants de santé\r\n🧖‍♀️ Idéal avant un masque ou un shampoing pour booster l’efficacité des soins'),
(145, 2, 'Haute Couvrance', 37, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwb8bffede/images/hi-res/SKU/SKU_2875/575018_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez-vous une couvrance optimale avec le Fond de Teint Haute Couvrance, spécialement conçu pour camoufler toutes les imperfections, rougeurs et marques. Sa texture riche mais légère s’applique facilement pour un fini mat, naturel et longue tenue.\r\n\r\n✨ Couvre parfaitement sans effet masque\r\n🌿 Matifie et contrôle la brillance\r\n💧 Confortable, ne dessèche pas la peau\r\n🌟 Convient particulièrement aux peaux mixtes à grasses'),
(146, 15, 'Huile Démaquillante', 0, 0, 'https://exemple.com/image-huile-demaquillante.jpg', '', NULL),
(147, 9, 'Jardin Secret', 75, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwec9d304a/images/hi-res/SKU/SKU_6339/761423_swatch.jpeg', '', 'Succombez au charme irrésistible de J\'adore, un parfum emblématique qui marie avec délicatesse des notes solaires et florales. Cette fragrance lumineuse et sensuelle révèle une féminité radieuse, captivante et élégante, parfaite pour illuminer chaque instant.\r\n\r\n🌼 Notes florales envoûtantes de jasmin et de rose\r\n☀️ Accents chauds et solaires qui évoquent la lumière et la joie\r\n✨ Tenue longue durée pour un sillage vibrant et raffiné\r\n🌿 Un classique de la maison Lancôme, symbole de luxe et de grâce'),
(148, 10, 'Lotion Tonique Acide Glycolique 7%', 25, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwd6a9fc9c/images/hi-res/PID_principal/PID_principal_640/P3921104_principal.jpg', '', 'Offrez à votre peau une exfoliation douce et efficace avec la Lotion Tonique à l’Acide Glycolique 7%. Ce soin raffine le grain de peau, réduit les imperfections et stimule le renouvellement cellulaire pour un teint plus lumineux et uniformisé. Sa formule légère prépare parfaitement la peau à recevoir vos soins quotidiens.\r\n\r\n✨ Exfolie en douceur grâce à l’acide glycolique concentré\r\n🌿 Purifie, affine et lisse la texture de la peau\r\n💧 Hydrate et équilibre le pH cutané\r\n🌟 Idéale pour les peaux ternes, fatiguées ou sujettes aux irrégularités'),
(149, 4, 'Mascara Allongeant', 15, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwc85538e1/images/hi-res/SKU/SKU_5643/690234_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Ouvrez votre regard avec le Mascara Allongeant, conçu pour étirer chaque cil à l’extrême sans paquets ni surcharge. Sa brosse précise et sa formule légère gainent les cils un à un pour un résultat allongé, élégant et naturel.\r\n\r\n👁️ Allonge visiblement les cils dès la première application\r\n✨ Sépare sans alourdir, pour un effet cils à cils\r\n💧 Tenue parfaite toute la journée, sans bavure\r\n🌿 Convient aux yeux sensibles et porteurs de lentilles'),
(150, 4, 'Mascara Cils à Cils', 44, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwaecb6dbe/images/hi-res/SKU/SKU_6522/762797_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à vos cils la signature Yves Saint Laurent avec le Mascara Cils à Cils, pensé pour une définition parfaite et un effet étoffé sur-mesure. Grâce à sa brosse exclusive et sa formule gainante, chaque cil est enrobé, séparé et allongé avec élégance – sans paquets, sans surcharge.\r\n\r\n👁️ Effet cils à cils net, précis et sophistiqué\r\n✨ Texture modulable pour un volume maîtrisé\r\n💧 Tenue impeccable toute la journée\r\n🌿 Enrichi en provitamine B5 pour fortifier les cils'),
(151, 4, 'Mascara Volume', 15, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw09f84b30/images/hi-res/SKU/SKU_6081/713779_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Apportez du caractère à votre regard avec le Mascara Volume, formulé pour densifier les cils dès la racine et leur offrir un volume spectaculaire. Sa brosse épaisse enrobe chaque cil d’une texture riche et crémeuse pour un effet immédiat, sans paquets.\r\n\r\n👁️ Volume extrême en un seul passage\r\n✨ Cils visiblement plus épais et galbés\r\n💧 Tenue longue durée, sans transfert ni effritement\r\n🌿 Convient aux yeux sensibles et testée ophtalmologiquement'),
(152, 4, 'Mascara Volume Noir', 32, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw56bc8657/images/hi-res/SKU/SKU_4632/421048_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Sublimez votre regard avec le Mascara Volume NOI, conçu pour offrir un volume intense et une profondeur extrême grâce à sa teinte noire ultra pigmentée. Sa brosse volumatrice déploie les cils en éventail pour un effet spectaculaire, dès la première application.\r\n\r\n🖤 Noir profond pour un regard intense\r\n👁️ Volume maximal sans paquets\r\n✨ Longue tenue, sans bavure ni effet chute\r\n🌿 Convient aux yeux sensibles et testé dermatologiquement'),
(153, 4, 'Mascara Waterproof', 0, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw99562578/images/hi-res/SKU/SKU_3376/275755_swatch.jpg', '', 'Affrontez toutes les conditions avec le Mascara Waterproof, formulé pour résister à l’eau, à l’humidité et aux émotions sans compromis sur l’intensité. Sa brosse haute précision enrobe chaque cil pour un regard défini, allongé et volumineux, toute la journée.\r\n\r\n💧 Résiste à l’eau, à la transpiration et aux larmes\r\n👁️ Allonge et galbe les cils sans paquets\r\n✨ Tenue 24h, sans bavure ni effritement\r\n🌿 Convient aux yeux sensibles et porteurs de lentilles'),
(154, 14, 'Masque Hydratant Nuit', 16, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwca39206f/images/hi-res/SKU/SKU_1900/506213_swatch.jpeg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau une cure d’hydratation intense pendant votre sommeil avec le Masque Hydratant Nuit. Sa formule riche et nourrissante pénètre profondément pour réparer, revitaliser et restaurer l’équilibre cutané. Au réveil, votre peau est visiblement repulpée, douce et lumineuse.\r\n\r\n💧 Hydrate intensément toute la nuit\r\n🌿 Renforce la barrière cutanée et nourrit en profondeur\r\n✨ Texture enveloppante pour un confort optimal sans sensation collante\r\n🌙 Idéal pour tous les types de peau, même sensibles'),
(155, 14, 'Masque Purifiant Coco', 11, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw0eb35f04/images/hi-res/SKU/SKU_3839/532072_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau un moment de pure détente avec le Masque Purifiant Coco. Enrichi en extrait de noix de coco, il purifie en profondeur tout en hydratant intensément, pour une peau nette, douce et délicatement nourrie.\r\n\r\n🥥 Purifie et désincruste les impuretés sans dessécher\r\n🌿 Hydrate et apaise grâce aux vertus naturelles de la noix de coco\r\n✨ Texture onctueuse et enveloppante pour un confort optimal\r\n🌸 Parfum doux et exotique pour un véritable instant de bien-être'),
(156, 3, 'Palette Nude', 55, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwd4edb82a/images/hi-res/SKU/SKU_3375/611586_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Laissez parler votre beauté naturelle avec la Palette Nude, un assortiment harmonieux de teintes douces, mates et satinées, parfaites pour créer des looks subtils de jour comme des smokey eyes élégants en soirée. Sa texture soyeuse s’estompe facilement pour un résultat professionnel en un geste.\r\n\r\n👁️ Tons chauds et froids pour tous les styles\r\n✨ Fini mat, satiné ou irisé selon l’envie\r\n🌿 Formule longue tenue, confortable à porter\r\n💼 Idéale pour un maquillage quotidien ou des occasions spéciales'),
(157, 3, 'Palette Smokey', 55, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw54e1ecb9/images/hi-res/SKU/SKU_5130/719269_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Osez le regard captivant avec la Palette Smokey, une sélection de teintes profondes, mates et irisées, pensées pour sculpter un maquillage charbonneux sophistiqué. Faciles à estomper, les fards offrent une pigmentation intense pour un look audacieux du soir comme du jour.\r\n\r\n👁️ Gris, noir, taupe et prunes pour un smokey sur-mesure\r\n✨ Fini intense, longue tenue sans chute\r\n🌿 Texture veloutée, ultra-facile à travailler\r\n💼 Parfaite pour les soirées, événements ou regards dramatiques'),
(158, 3, 'Palette Yeux', 28, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw706edced/images/hi-res/SKU/SKU_6310/758329_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Laissez parler votre beauté naturelle avec la Palette Nude, un assortiment harmonieux de teintes douces, mates et satinées, parfaites pour créer des looks subtils de jour comme des smokey eyes élégants en soirée. Sa texture soyeuse s’estompe facilement pour un résultat professionnel en un geste.\r\n\r\n👁️ Tons chauds et froids pour tous les styles\r\n✨ Fini mat, satiné ou irisé selon l’envie\r\n🌿 Formule longue tenue, confortable à porter\r\n💼 Idéale pour un maquillage quotidien ou des occasions spéciales'),
(159, 9, 'Parfum Intense Nuit', 88, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw14299c58/images/hi-res/SKU/SKU_2461/562281_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Plongez dans l’obscurité envoûtante avec Parfum Intense Nuit 🌙, une fragrance profonde et sensuelle qui révèle toute la puissance de la nuit. Ses notes riches et enivrantes évoquent le mystère, la séduction et l’élégance absolue, parfaites pour des soirées inoubliables.\r\n\r\n✨ Accords intenses de bois précieux, épices et musc\r\n🌙 Sillage sophistiqué et longue tenue\r\n🌿 Une essence captivante pour une féminité audacieuse et mystérieuse'),
(160, 2, 'Poudre Compacte', 25, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwc709b504/images/hi-res/SKU/SKU_4389/618214_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Adoptez un teint lumineux et matifié avec la Poudre Compacte, idéale pour fixer le maquillage et contrôler la brillance tout au long de la journée. Sa texture douce et fine s’applique facilement pour un résultat naturel et sans défaut.\r\n\r\n✨ Matifie sans assécher la peau\r\n🌿 Lisse le grain de peau et unifie le teint\r\n💧 Peut s’utiliser seule ou en finition de fond de teint\r\n🌟 Convient à tous les types de peau'),
(161, 9, 'Rosée d’Aube', 0, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw84204c9b/images/hi-res/SKU/SKU_6528/749296_swatch.jpg', '', 'Éveillez vos sens avec Rosée d’Aube, une fragrance légère et délicate qui capture la fraîcheur et la douceur du matin. Ses notes aériennes et florales apportent une sensation de renouveau, parfaite pour commencer la journée avec élégance et vitalité.\r\n\r\n🌸 Accords subtils de fleurs blanches et agrumes frais\r\n✨ Sillage léger, parfait pour un usage quotidien\r\n🌿 Formule douce et raffinée, idéale pour une féminité naturelle'),
(162, 1, 'Rouge à Lèvres Longue Tenue', 0, 0, 'https://exemple.com/image-rouge-longue-tenue.jpg', '', NULL),
(163, 1, 'Rouge à Lèvres Mat', 0, 0, 'https://exemple.com/image-rouge-mat.jpg', '', NULL),
(164, 1, 'Rouge à Lèvres Mat Rouge', 0, 0, 'https://exemple.com/image-rouge-mat-rouge.jpg', '', NULL),
(165, 1, 'Rouge à Lèvres Satiné Rose', 0, 0, 'https://exemple.com/image-rouge-satine-rose.jpg', '', NULL),
(166, 13, 'Sérum Illuminateur', 21, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw0a17aa52/images/hi-res/SKU/SKU_6183/748490_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Découvrez le pouvoir du Sérum Illuminateur, un soin haute performance qui illumine intensément la peau, estompe les zones ternes et unifie le teint. Sa formule enrichie en actifs éclat révèle une peau radieuse, lisse et pleine de vitalité.\r\n\r\n✨ Illumine et unifie le teint\r\n🌿 Atténue les imperfections et les traces de fatigue\r\n💧 Hydrate en profondeur pour un confort optimal\r\n🌟 Convient à tous les types de peau, même sensibles'),
(167, 13, 'Sérum Vitamine C', 15, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw52f6a2cf/images/hi-res/SKU/SKU_1130/502455_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Sérum Vitamine C – L’éclat puissant de la jeunesse\r\n\r\nBoostez la luminosité de votre peau avec le Sérum Vitamine C, un concentré énergisant qui protège contre les radicaux libres tout en uniformisant le teint. Sa formule enrichie en vitamine C stabilisée revitalise la peau, atténue les taches et redonne un éclat naturel et durable.\r\n\r\n🍊 Antioxydant puissant contre le vieillissement cutané\r\n✨ Illumine le teint et réduit les signes de fatigue\r\n💧 Hydrate et raffermit la peau\r\n🌿 Convient à tous les types de peau, même sensibles'),
(168, 9, 'Soleil d’Orient', 75, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw4bd3fcbb/images/hi-res/SKU/SKU_5017/719955_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Découvrez Soleil d’Orient, une fragrance captivante qui mêle la chaleur des épices orientales à la douceur envoûtante des notes florales. Ce parfum riche et sensuel évoque les couchers de soleil dorés et les mystères d’un horizon lointain.\r\n\r\n✨ Notes épicées de cardamome et cannelle\r\n🌺 Accents floraux de jasmin et fleur d’oranger\r\n🌿 Sillage profond et longue tenue pour un charme irrésistible'),
(174, 12, 'Gommage Visage Douceur', 20, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwcb1ed85e/images/hi-res/SKU/SKU_6359/761820_swatch.jpeg', '', 'Plongez dans un moment de pure délicatesse avec le Gommage au Sucre Rose The Ritual of Yozakura. Inspiré de la floraison nocturne des cerisiers japonais, ce soin exfoliant associe des cristaux de sucre à l’élégance de la fleur de cerisier rose pour lisser la peau en douceur et éveiller les sens.\r\n\r\nSa texture fondante élimine les cellules mortes tout en nourrissant la peau, laissant un voile délicatement parfumé et une douceur irrésistible au toucher.\r\n\r\n🌸 Exfolie en douceur grâce au sucre naturel\r\n🌿 Enrichi en extraits de fleur de cerisier et huiles nourrissantes\r\n💖 Parfum floral apaisant et raffiné\r\n✨ Peau soyeuse, éclatante et délicatement parfumée'),
(175, 12, 'Gommage Corps Exfoliant', 11, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw53311056/images/hi-res/SKU/SKU_3783/547656_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à votre corps une exfoliation sensorielle avec le Gommage Corps Exfoliant, votre allié pour une peau lisse, douce et éclatante. Sa formule aux grains naturels élimine les cellules mortes en douceur tout en stimulant la microcirculation, pour une peau visiblement plus saine et tonifiée.\r\n\r\nIdéal avant l’application d’un soin hydratant ou autobronzant, il prépare la peau et sublime son éclat naturel.\r\n\r\n🌿 Exfoliation efficace sans agresser la peau\r\n💧 Hydrate et nourrit grâce à des huiles végétales bienfaisantes\r\n✨ Lisse, adoucit et ravive l’éclat de la peau\r\n🌸 Parfum délicat pour une expérience bien-être complète'),
(176, 12, 'Gommage Lèvres Sucré', 20, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw252ceeb2/images/hi-res/SKU/SKU_4407/693101_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à vos lèvres un soin gourmand et efficace avec le Sugar Lip Polish, un gommage exfoliant au sucre roux qui lisse, adoucit et nourrit en profondeur. Sa formule délicate élimine les petites peaux mortes tout en laissant un fini soyeux, prêt à recevoir votre baume ou rouge à lèvres préféré.\r\n\r\nGrâce à l’action exfoliante du sucre naturel et à un cocktail d’huiles nourrissantes, vos lèvres retrouvent douceur, confort et éclat.\r\n\r\n🍯 Exfolie en douceur avec du sucre roux naturel\r\n💋 Lisse et prépare les lèvres au maquillage\r\n💧 Nourrit intensément grâce aux huiles végétales (jojoba, coco, etc.)\r\n✨ Résultat : des lèvres douces, nettes et visiblement plus belles'),
(177, 12, 'Gommage Purifiant Charbon', 12, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwff1a9431/images/hi-res/SKU/SKU_3375/615410_swatch.jpg', '', 'Libérez votre peau des impuretés avec le Gommage Purifiant au Charbon, un soin puissant qui combine l’action exfoliante de micrograins naturels à la force détoxifiante du charbon actif. Idéal pour les peaux mixtes à grasses, il désincruste les pores, affine le grain de peau et élimine l’excès de sébum sans agresser.\r\n\r\nRésultat : une peau purifiée, nette et visiblement plus fraîche.\r\n\r\n🖤 Charbon actif : absorbe les toxines et purifie en profondeur\r\n🌿 Micrograins exfoliants : éliminent cellules mortes et impuretés\r\n✨ Grain de peau affiné, teint plus uniforme\r\n🧖‍♂️ Utilisation 1 à 2 fois par semaine pour un effet peau neuve'),
(178, 12, 'Gommage Mains & Pieds', 10, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw5b38b2b6/images/hi-res/SKU/SKU_6381/760934_swatch.jpg', '', 'Offrez à vos extrémités le soin qu’elles méritent avec le Gommage Mains & Pieds, spécialement conçu pour lisser, adoucir et revitaliser les zones souvent sollicitées mais négligées. Grâce à sa texture riche en micrograins exfoliants et en agents nourrissants, il élimine rugosités et peaux mortes tout en laissant un toucher soyeux.\r\n\r\n👣 Exfolie efficacement sans dessécher\r\n🤲 Idéal pour préparer la peau avant un soin hydratant ou une manucure/pédicure\r\n🌿 Enrichi en huiles adoucissantes pour une peau souple et réparée\r\n💆‍♀️ Sensation de confort immédiat et fini non gras'),
(179, 10, 'Lotion Tonique Rafraîchissante', 15, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwf538112b/images/hi-res/SKU/SKU_6436/761488_swatch.jpg', '', 'Revitalisez votre peau avec la Lotion Tonique Rafraîchissante, un soin léger qui purifie et tonifie sans agresser. Sa formule douce élimine les traces de maquillage et les impuretés résiduelles tout en apportant une sensation de fraîcheur immédiate.\r\n\r\n💧 Hydrate et apaise la peau\r\n🌿 Convient à tous les types de peau, même sensibles\r\n✨ Prépare la peau à recevoir vos soins hydratants\r\n🍃 Laisse un teint éclatant et une sensation de bien-être'),
(180, 10, 'Lotion Apaisante Camomille', 16, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwa25c75b0/images/hi-res/SKU/SKU_6436/761487_swatch.jpg', '', 'Calmez et hydratez votre peau avec la Lotion Apaisante à la Camomille, formulée pour apaiser les rougeurs, les irritations et les sensations d’inconfort. Riche en extraits naturels de camomille, elle protège et rééquilibre la peau tout en laissant un fini frais et délicatement parfumé.\r\n\r\n🌼 Apaise immédiatement les peaux sensibles et réactives\r\n💧 Hydrate en douceur sans dessécher\r\n🍃 Formule douce, idéale après le démaquillage ou une exposition au soleil\r\n✨ Peau douce, apaisée et parfaitement préparée pour le soin suivant'),
(181, 10, 'Lotion Purifiante Thé Vert', 15, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwd1faf0fe/images/hi-res/SKU/SKU_5994/426693_swatch.jpg', '', 'Offrez à votre peau une véritable bouffée d’air frais avec la Lotion Purifiante au Thé Vert. Sa formule enrichie en extrait naturel de thé vert aide à purifier, matifier et tonifier la peau, tout en éliminant les impuretés et l’excès de sébum.\r\n\r\n🍃 Purifie en douceur et resserre les pores\r\n🌿 Antioxydant naturel pour protéger la peau des agressions extérieures\r\n💧 Rafraîchit et équilibre les peaux mixtes à grasses\r\n✨ Teint net, matifié et éclatant de santé'),
(182, 10, 'Lotion Hydratante Aloe Vera', 14, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw16ce39db/images/hi-res/SKU/SKU_4973/716257_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau une dose quotidienne d’hydratation et de fraîcheur avec la Lotion Hydratante à l’Aloe Vera. Sa formule légère et non grasse pénètre rapidement pour revitaliser et calmer les peaux sèches ou sensibles, tout en restaurant l’équilibre naturel de la peau.\r\n\r\n🌿 Riche en extrait naturel d’aloe vera aux propriétés apaisantes\r\n💧 Hydrate intensément et durablement\r\n✨ Laisse la peau douce, souple et rafraîchie\r\n🍃 Convient à tous les types de peau, même les plus sensibles'),
(183, 14, 'Masque Purifiant Argile Verte', 18, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw8697cad8/images/hi-res/SKU/SKU_5154/718123_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau un soin purifiant en profondeur avec le Masque à l’Argile Verte. Riche en minéraux, il absorbe l’excès de sébum, désincruste les pores et élimine les impuretés pour un teint net et un grain de peau affiné.\r\n\r\n🌿 Purifie et matifie les peaux mixtes à grasses\r\n💧 Réduit les brillances et resserre les pores\r\n✨ Laisse la peau douce, fraîche et équilibrée\r\n🧖‍♀️ Utilisation régulière pour une peau visiblement plus saine et éclatante'),
(184, 14, 'Masque Hydratant au Miel', 21, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwec7fd160/images/hi-res/SKU/SKU_6436/762581_swatch.jpg', '', 'Plongez votre peau dans un cocon de douceur avec le Masque Hydratant au Miel, riche en propriétés nourrissantes et hydratantes. Ce soin onctueux nourrit intensément la peau tout en lui apportant confort et souplesse.\r\n\r\n🍯 Hydrate profondément et protège la barrière cutanée\r\n🌿 Nourrit et apaise les peaux sèches et sensibles\r\n✨ Texture fondante pour un plaisir d’application unique\r\n💖 Laisse la peau douce, lumineuse et délicatement parfumée'),
(185, 14, 'Masque Apaisant à l’Aloe Vera', 19, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw52bd276f/images/hi-res/SKU/SKU_1/510234_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Plongez votre peau dans un bain de douceur avec le Masque Apaisant à l’Aloe Vera. Formulé à base d’extrait naturel d’aloe vera, ce soin hydrate en profondeur tout en apaisant les rougeurs et les irritations, pour un confort immédiat.\r\n\r\n🌿 Apaise et calme les peaux sensibles et réactives\r\n💧 Hydrate intensément et restaure l’équilibre cutané\r\n✨ Texture légère et fraîche pour une sensation de bien-être durable\r\n🍃 Idéal après une exposition au soleil ou en cas de peau stressée'),
(186, 14, 'Masque Éclat Vitamine C', 22, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwb3c44824/images/hi-res/SKU/SKU_5419/643013_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Révélez l’éclat naturel de votre teint avec le Masque Éclat à la Vitamine C, un soin revitalisant qui illumine et uniformise la peau. Sa formule enrichie en vitamine C puissante lutte contre les signes de fatigue et les taches pour un visage visiblement plus frais et rayonnant.\r\n\r\n🍊 Stimule le renouvellement cellulaire et ravive l’éclat\r\n🌿 Protège la peau grâce à ses propriétés antioxydantes\r\n💧 Hydrate et lisse la texture cutanée\r\n✨ Teint lumineux, uniforme et plein de vitalité'),
(187, 13, 'Sérum Anti-âge', 30, 0, 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw736d072f/images/hi-res/SKU/SKU_5707/740574_swatch.jpg', '', 'Combattez les signes du temps avec ce Sérum Anti-âge puissant, formulé pour lisser les rides, raffermir la peau et raviver l’éclat naturel du visage. Sa texture légère pénètre rapidement pour un effet visible dès les premières utilisations.\r\n\r\n✨ Réduit rides et ridules\r\n🌿 Stimule la production de collagène pour une peau plus ferme\r\n💧 Hydrate intensément et protège contre les agressions extérieures\r\n🌟 Convient à tous les types de peau, même sensibles'),
(188, 13, 'Sérum Hydratant ', 29, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw42532991/images/hi-res/SKU/SKU_1130/502450_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Offrez à votre peau un véritable shot d’hydratation avec ce Sérum Hydratant ultra-léger. Sa formule concentrée pénètre rapidement pour nourrir intensément la peau, prévenir la déshydratation et révéler un teint frais et lumineux.\r\n\r\n💧 Hydrate en profondeur sans effet gras\r\n🌿 Renforce la barrière cutanée et protège contre les agressions extérieures\r\n✨ Améliore la texture et l’élasticité de la peau\r\n🌟 Convient à tous les types de peau, même sensibles'),
(189, 13, 'Sérum Éclat', 32, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwf2bce930/images/hi-res/SKU/SKU_3841/618986_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Illuminez votre teint avec le Sérum Éclat, formulé pour revitaliser et unifier la peau. Grâce à ses actifs puissants, il booste la production de collagène et réduit les signes de fatigue pour un visage frais, rayonnant et plein de vitalité.\r\n\r\n✨ Ravive l’éclat du teint\r\n🌿 Combat les signes de fatigue et les taches pigmentaires\r\n💧 Hydrate intensément et lisse la texture de la peau\r\n🌟 Convient à tous les types de peau'),
(190, 13, 'Sérum Purifiant', 27, 0, 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw3ff1588a/images/hi-res/SKU/SKU_3376/633711_swatch.jpg?sw=585&sh=585&sm=fit', '', 'Découvrez le pouvoir purifiant de ce Sérum Purifiant, spécialement conçu pour réguler l’excès de sébum et désincruster les pores. Sa formule légère agit en profondeur pour prévenir les imperfections et révéler une peau plus saine, matifiée et éclatante.\r\n\r\n🌿 Régule la production de sébum\r\n💧 Purifie sans dessécher ni agresser\r\n✨ Affine le grain de peau et resserre les pores\r\n🌟 Convient aux peaux mixtes à grasses');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `libelle`) VALUES
(1, 'Administrateur'),
(2, 'Client');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `mdp` varchar(256) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `idRole` int DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idRole` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `mdp`, `nom`, `prenom`, `idRole`) VALUES
(9, 'matartcha@gmail.com', '$2y$10$/YBZefWQPmfV3nkkdPkNe.EYDITz9H19zgzXrzFCF5FThEEXVDusy', 'nene', 'mathis', 1),
(17, 'norasabi@gmail.com', '$2y$10$0Qaz7yXJZR1vfPEraMmQvOgipsMOFKve0XQKRcM49IO04I2hpc/Cy', 'gy', 'bi', 1),
(19, 'sabisofiadu84@gmail.com', '$2y$10$GhL/bT/ET3s5t879mrH7au3ISlPXAiYj20zYNtTN0gUQY3mTyPDCS', 'SABI', 'NAJATE', 1),
(23, 'piou@gmail.com', '$2y$10$ZVPItNXvDyavqCD7grGlLOK5m2OBwPim.gZKkY7I/P.9CA3c6JsJm', 'piou', 'piou', NULL),
(24, 'sofiadu84@gmail.com', '$2y$10$MBfpuLLV654zYZJjvV8B/OVp89i.If0oc6apRT.qTMVnfCxMJkjO.', 'SABI', 'NAJATE', 2),
(25, 'du84@gmail.com', '$2y$10$wsPqaT2yfwNX2JIpfoe2Au8hI1c7y.xIDYfYcwJLU.1tWL57mmYTK', 'SABI', 'NAJATE', 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
