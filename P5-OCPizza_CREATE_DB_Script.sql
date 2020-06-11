
CREATE TABLE public.utilisateur (
                utilisateur_id SMALLINT NOT NULL,
                nom VARCHAR(30) NOT NULL,
                prenom VARCHAR(30) NOT NULL,
                pseudo VARCHAR(30) NOT NULL,
                mot_de_passe VARCHAR(30) NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (utilisateur_id)
);


CREATE TABLE public.client (
                client_id INTEGER NOT NULL,
                telephone VARCHAR(10) NOT NULL,
                mail VARCHAR(100) NOT NULL,
                utilisateur_id SMALLINT NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (client_id)
);


CREATE TABLE public.facture (
                facture_numero INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                nom_client VARCHAR(30) NOT NULL,
                libelle_commande VARCHAR(100) NOT NULL,
                total_TTC NUMERIC(4,2) NOT NULL,
                client_id INTEGER NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (facture_numero)
);


CREATE SEQUENCE public.point_de_vente_id_seq;

CREATE TABLE public.point_de_vente (
                point_de_vente_id SMALLINT NOT NULL DEFAULT nextval('public.point_de_vente_id_seq'),
                raison_sociale VARCHAR(50) NOT NULL,
                adresse VARCHAR(100) NOT NULL,
                telephone VARCHAR(10) NOT NULL,
                mail VARCHAR(100) NOT NULL,
                gerant VARCHAR(30) NOT NULL,
                CONSTRAINT point_de_vente_pk PRIMARY KEY (point_de_vente_id)
);


ALTER SEQUENCE public.point_de_vente_id_seq OWNED BY public.point_de_vente.point_de_vente_id;

CREATE TABLE public.commande (
                commande_numero INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                etat VARCHAR NOT NULL,
                nom_client VARCHAR(30) NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                preparateur VARCHAR NOT NULL,
                adresse_livraison VARCHAR(100) NOT NULL,
                prix_TTC NUMERIC(4,2) NOT NULL,
                client_id INTEGER NOT NULL,
                point_de_vente_id SMALLINT NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (commande_numero)
);


CREATE TABLE public.adresse (
                adresse_id INTEGER NOT NULL,
                nom_client VARCHAR(30) NOT NULL,
                numero_voie SMALLINT NOT NULL,
                voie VARCHAR(50) NOT NULL,
                code_postal INTEGER NOT NULL,
                ville VARCHAR(50) NOT NULL,
                commande_numero INTEGER NOT NULL,
                client_id INTEGER NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (adresse_id)
);


CREATE TABLE public.livraison (
                livraison_numero INTEGER NOT NULL,
                date TIMESTAMP NOT NULL,
                livreur VARCHAR(30) NOT NULL,
                nom_client VARCHAR(30) NOT NULL,
                adresse_livraison VARCHAR(100) NOT NULL,
                commande_numero INTEGER NOT NULL,
                facture_numero INTEGER NOT NULL,
                CONSTRAINT livraison_pk PRIMARY KEY (livraison_numero)
);


CREATE TABLE public.stock (
                stock_id SMALLINT NOT NULL,
                categorie VARCHAR(30) NOT NULL,
                nom_produit VARCHAR(30),
                nom_ingredient VARCHAR(30),
                fournisseur VARCHAR(30) NOT NULL,
                quantite NUMERIC(3,1) NOT NULL,
                point_de_vente_id SMALLINT NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (stock_id)
);


CREATE TABLE public.produit (
                produit_id SMALLINT NOT NULL,
                categorie VARCHAR(30) NOT NULL,
                nom VARCHAR(30) NOT NULL,
                descriptif VARCHAR(100) NOT NULL,
                prix_unitaire_HT NUMERIC(4,2) NOT NULL,
                taux_TVA_100 NUMERIC(3,1) NOT NULL,
                stock_id SMALLINT NOT NULL,
                CONSTRAINT produit_pk PRIMARY KEY (produit_id)
);


CREATE TABLE public.ligne_de_commande (
                commande_numero INTEGER NOT NULL,
                produit_id SMALLINT NOT NULL,
                nom_produit VARCHAR(30) NOT NULL,
                prix_unitaire_TTC NUMERIC(4,2) NOT NULL,
                quantite SMALLINT NOT NULL,
                CONSTRAINT ligne_de_commande_pk PRIMARY KEY (commande_numero, produit_id)
);


CREATE TABLE public.personnel (
                personnel_id SMALLINT NOT NULL,
                fonction VARCHAR(30) NOT NULL,
                point_de_vente_id SMALLINT NOT NULL,
                utilisateur_id SMALLINT NOT NULL,
                CONSTRAINT personnel_pk PRIMARY KEY (personnel_id)
);


ALTER TABLE public.personnel ADD CONSTRAINT utilisateur_personnel_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.utilisateur (utilisateur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.client ADD CONSTRAINT utilisateur_client_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.utilisateur (utilisateur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (client_id)
REFERENCES public.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.facture ADD CONSTRAINT client_facture_fk
FOREIGN KEY (client_id)
REFERENCES public.client (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livraison ADD CONSTRAINT facture_livraison_fk
FOREIGN KEY (facture_numero)
REFERENCES public.facture (facture_numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.personnel ADD CONSTRAINT point_de_vente_personnel_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.point_de_vente (point_de_vente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT point_de_vente_stock_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.point_de_vente (point_de_vente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT point_de_vente_commande_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.point_de_vente (point_de_vente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ligne_de_commande ADD CONSTRAINT commande_ligne_de_commande_fk
FOREIGN KEY (commande_numero)
REFERENCES public.commande (commande_numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livraison ADD CONSTRAINT commande_livraison_fk
FOREIGN KEY (commande_numero)
REFERENCES public.commande (commande_numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.adresse ADD CONSTRAINT commande_adresse_fk
FOREIGN KEY (commande_numero)
REFERENCES public.commande (commande_numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.produit ADD CONSTRAINT stock_produit_fk
FOREIGN KEY (stock_id)
REFERENCES public.stock (stock_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ligne_de_commande ADD CONSTRAINT produit_ligne_de_commande_fk
FOREIGN KEY (produit_id)
REFERENCES public.produit (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
