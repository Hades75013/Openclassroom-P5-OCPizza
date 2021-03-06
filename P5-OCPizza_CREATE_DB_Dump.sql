PGDMP         +            
    w            OCPIZZA    12.0    12.0 7    Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            \           1262    26111    OCPIZZA    DATABASE     �   CREATE DATABASE "OCPIZZA" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE "OCPIZZA";
                postgres    false            �            1259    26143    adresse    TABLE     N  CREATE TABLE public.adresse (
    adresse_id integer NOT NULL,
    nom_client character varying(30) NOT NULL,
    numero_voie smallint NOT NULL,
    voie character varying(50) NOT NULL,
    code_postal integer NOT NULL,
    ville character varying(50) NOT NULL,
    commande_numero integer NOT NULL,
    client_id integer NOT NULL
);
    DROP TABLE public.adresse;
       public         heap    postgres    false            �            1259    26117    client    TABLE     �   CREATE TABLE public.client (
    client_id integer NOT NULL,
    telephone character varying(10) NOT NULL,
    mail character varying(100) NOT NULL,
    utilisateur_id smallint NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    26135    commande    TABLE     �  CREATE TABLE public.commande (
    commande_numero integer NOT NULL,
    date timestamp without time zone NOT NULL,
    etat character varying NOT NULL,
    nom_client character varying(30) NOT NULL,
    libelle character varying(100) NOT NULL,
    preparateur character varying NOT NULL,
    adresse_livraison character varying(100) NOT NULL,
    prix_ttc numeric(4,2) NOT NULL,
    client_id integer NOT NULL,
    point_de_vente_id smallint NOT NULL
);
    DROP TABLE public.commande;
       public         heap    postgres    false            �            1259    26122    facture    TABLE       CREATE TABLE public.facture (
    facture_numero integer NOT NULL,
    date timestamp without time zone NOT NULL,
    nom_client character varying(30) NOT NULL,
    libelle_commande character varying(100) NOT NULL,
    total_ttc numeric(4,2) NOT NULL,
    client_id integer NOT NULL
);
    DROP TABLE public.facture;
       public         heap    postgres    false            �            1259    26163    ligne_de_commande    TABLE     �   CREATE TABLE public.ligne_de_commande (
    commande_numero integer NOT NULL,
    produit_id smallint NOT NULL,
    nom_produit character varying(30) NOT NULL,
    prix_unitaire_ttc numeric(4,2) NOT NULL,
    quantite smallint NOT NULL
);
 %   DROP TABLE public.ligne_de_commande;
       public         heap    postgres    false            �            1259    26148 	   livraison    TABLE     U  CREATE TABLE public.livraison (
    livraison_numero integer NOT NULL,
    date timestamp without time zone NOT NULL,
    livreur character varying(30) NOT NULL,
    nom_client character varying(30) NOT NULL,
    adresse_livraison character varying(100) NOT NULL,
    commande_numero integer NOT NULL,
    facture_numero integer NOT NULL
);
    DROP TABLE public.livraison;
       public         heap    postgres    false            �            1259    26168 	   personnel    TABLE     �   CREATE TABLE public.personnel (
    personnel_id smallint NOT NULL,
    fonction character varying(30) NOT NULL,
    point_de_vente_id smallint NOT NULL,
    utilisateur_id smallint NOT NULL
);
    DROP TABLE public.personnel;
       public         heap    postgres    false            �            1259    26129    point_de_vente    TABLE     3  CREATE TABLE public.point_de_vente (
    point_de_vente_id smallint NOT NULL,
    raison_sociale character varying(50) NOT NULL,
    adresse character varying(100) NOT NULL,
    telephone character varying(10) NOT NULL,
    mail character varying(100) NOT NULL,
    gerant character varying(30) NOT NULL
);
 "   DROP TABLE public.point_de_vente;
       public         heap    postgres    false            �            1259    26127    point_de_vente_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.point_de_vente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.point_de_vente_id_seq;
       public          postgres    false    206            ]           0    0    point_de_vente_id_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.point_de_vente_id_seq OWNED BY public.point_de_vente.point_de_vente_id;
          public          postgres    false    205            �            1259    26158    produit    TABLE     <  CREATE TABLE public.produit (
    produit_id smallint NOT NULL,
    categorie character varying(30) NOT NULL,
    nom character varying(30) NOT NULL,
    descriptif character varying(100) NOT NULL,
    prix_unitaire_ht numeric(4,2) NOT NULL,
    taux_tva_100 numeric(3,1) NOT NULL,
    stock_id smallint NOT NULL
);
    DROP TABLE public.produit;
       public         heap    postgres    false            �            1259    26153    stock    TABLE     :  CREATE TABLE public.stock (
    stock_id smallint NOT NULL,
    categorie character varying(30) NOT NULL,
    nom_produit character varying(30),
    nom_ingredient character varying(30),
    fournisseur character varying(30) NOT NULL,
    quantite numeric(3,1) NOT NULL,
    point_de_vente_id smallint NOT NULL
);
    DROP TABLE public.stock;
       public         heap    postgres    false            �            1259    26112    utilisateur    TABLE     �   CREATE TABLE public.utilisateur (
    utilisateur_id smallint NOT NULL,
    nom character varying(30) NOT NULL,
    prenom character varying(30) NOT NULL,
    pseudo character varying(30) NOT NULL,
    mot_de_passe character varying(30) NOT NULL
);
    DROP TABLE public.utilisateur;
       public         heap    postgres    false            �
           2604    26132     point_de_vente point_de_vente_id    DEFAULT     �   ALTER TABLE ONLY public.point_de_vente ALTER COLUMN point_de_vente_id SET DEFAULT nextval('public.point_de_vente_id_seq'::regclass);
 O   ALTER TABLE public.point_de_vente ALTER COLUMN point_de_vente_id DROP DEFAULT;
       public          postgres    false    206    205    206            Q          0    26143    adresse 
   TABLE DATA           |   COPY public.adresse (adresse_id, nom_client, numero_voie, voie, code_postal, ville, commande_numero, client_id) FROM stdin;
    public          postgres    false    208   zJ       L          0    26117    client 
   TABLE DATA           L   COPY public.client (client_id, telephone, mail, utilisateur_id) FROM stdin;
    public          postgres    false    203   �J       P          0    26135    commande 
   TABLE DATA           �   COPY public.commande (commande_numero, date, etat, nom_client, libelle, preparateur, adresse_livraison, prix_ttc, client_id, point_de_vente_id) FROM stdin;
    public          postgres    false    207   �J       M          0    26122    facture 
   TABLE DATA           k   COPY public.facture (facture_numero, date, nom_client, libelle_commande, total_ttc, client_id) FROM stdin;
    public          postgres    false    204   �J       U          0    26163    ligne_de_commande 
   TABLE DATA           r   COPY public.ligne_de_commande (commande_numero, produit_id, nom_produit, prix_unitaire_ttc, quantite) FROM stdin;
    public          postgres    false    212   �J       R          0    26148 	   livraison 
   TABLE DATA           �   COPY public.livraison (livraison_numero, date, livreur, nom_client, adresse_livraison, commande_numero, facture_numero) FROM stdin;
    public          postgres    false    209   K       V          0    26168 	   personnel 
   TABLE DATA           ^   COPY public.personnel (personnel_id, fonction, point_de_vente_id, utilisateur_id) FROM stdin;
    public          postgres    false    213   (K       O          0    26129    point_de_vente 
   TABLE DATA           m   COPY public.point_de_vente (point_de_vente_id, raison_sociale, adresse, telephone, mail, gerant) FROM stdin;
    public          postgres    false    206   EK       T          0    26158    produit 
   TABLE DATA           s   COPY public.produit (produit_id, categorie, nom, descriptif, prix_unitaire_ht, taux_tva_100, stock_id) FROM stdin;
    public          postgres    false    211   bK       S          0    26153    stock 
   TABLE DATA           {   COPY public.stock (stock_id, categorie, nom_produit, nom_ingredient, fournisseur, quantite, point_de_vente_id) FROM stdin;
    public          postgres    false    210   K       K          0    26112    utilisateur 
   TABLE DATA           X   COPY public.utilisateur (utilisateur_id, nom, prenom, pseudo, mot_de_passe) FROM stdin;
    public          postgres    false    202   �K       ^           0    0    point_de_vente_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.point_de_vente_id_seq', 1, false);
          public          postgres    false    205            �
           2606    26147    adresse adresse_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (adresse_id);
 <   ALTER TABLE ONLY public.adresse DROP CONSTRAINT adresse_pk;
       public            postgres    false    208            �
           2606    26121    client client_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (client_id);
 :   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pk;
       public            postgres    false    203            �
           2606    26142    commande commande_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (commande_numero);
 >   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pk;
       public            postgres    false    207            �
           2606    26126    facture facture_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_pk PRIMARY KEY (facture_numero);
 <   ALTER TABLE ONLY public.facture DROP CONSTRAINT facture_pk;
       public            postgres    false    204            �
           2606    26167 &   ligne_de_commande ligne_de_commande_pk 
   CONSTRAINT     }   ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT ligne_de_commande_pk PRIMARY KEY (commande_numero, produit_id);
 P   ALTER TABLE ONLY public.ligne_de_commande DROP CONSTRAINT ligne_de_commande_pk;
       public            postgres    false    212    212            �
           2606    26152    livraison livraison_pk 
   CONSTRAINT     b   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pk PRIMARY KEY (livraison_numero);
 @   ALTER TABLE ONLY public.livraison DROP CONSTRAINT livraison_pk;
       public            postgres    false    209            �
           2606    26172    personnel personnel_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_pk PRIMARY KEY (personnel_id);
 @   ALTER TABLE ONLY public.personnel DROP CONSTRAINT personnel_pk;
       public            postgres    false    213            �
           2606    26134     point_de_vente point_de_vente_pk 
   CONSTRAINT     m   ALTER TABLE ONLY public.point_de_vente
    ADD CONSTRAINT point_de_vente_pk PRIMARY KEY (point_de_vente_id);
 J   ALTER TABLE ONLY public.point_de_vente DROP CONSTRAINT point_de_vente_pk;
       public            postgres    false    206            �
           2606    26162    produit produit_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pk PRIMARY KEY (produit_id);
 <   ALTER TABLE ONLY public.produit DROP CONSTRAINT produit_pk;
       public            postgres    false    211            �
           2606    26157    stock stock_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (stock_id);
 8   ALTER TABLE ONLY public.stock DROP CONSTRAINT stock_pk;
       public            postgres    false    210            �
           2606    26116    utilisateur utilisateur_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (utilisateur_id);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pk;
       public            postgres    false    202            �
           2606    26188    adresse client_adresse_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT client_adresse_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 C   ALTER TABLE ONLY public.adresse DROP CONSTRAINT client_adresse_fk;
       public          postgres    false    208    203    2732            �
           2606    26183    commande client_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT client_commande_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 E   ALTER TABLE ONLY public.commande DROP CONSTRAINT client_commande_fk;
       public          postgres    false    203    2732    207            �
           2606    26193    facture client_facture_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.facture
    ADD CONSTRAINT client_facture_fk FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 C   ALTER TABLE ONLY public.facture DROP CONSTRAINT client_facture_fk;
       public          postgres    false    204    2732    203            �
           2606    26228    adresse commande_adresse_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT commande_adresse_fk FOREIGN KEY (commande_numero) REFERENCES public.commande(commande_numero);
 E   ALTER TABLE ONLY public.adresse DROP CONSTRAINT commande_adresse_fk;
       public          postgres    false    207    2738    208            �
           2606    26218 /   ligne_de_commande commande_ligne_de_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT commande_ligne_de_commande_fk FOREIGN KEY (commande_numero) REFERENCES public.commande(commande_numero);
 Y   ALTER TABLE ONLY public.ligne_de_commande DROP CONSTRAINT commande_ligne_de_commande_fk;
       public          postgres    false    207    212    2738            �
           2606    26223    livraison commande_livraison_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT commande_livraison_fk FOREIGN KEY (commande_numero) REFERENCES public.commande(commande_numero);
 I   ALTER TABLE ONLY public.livraison DROP CONSTRAINT commande_livraison_fk;
       public          postgres    false    209    207    2738            �
           2606    26198    livraison facture_livraison_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT facture_livraison_fk FOREIGN KEY (facture_numero) REFERENCES public.facture(facture_numero);
 H   ALTER TABLE ONLY public.livraison DROP CONSTRAINT facture_livraison_fk;
       public          postgres    false    204    209    2734            �
           2606    26213 #   commande point_de_vente_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT point_de_vente_commande_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(point_de_vente_id);
 M   ALTER TABLE ONLY public.commande DROP CONSTRAINT point_de_vente_commande_fk;
       public          postgres    false    2736    207    206            �
           2606    26203 %   personnel point_de_vente_personnel_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT point_de_vente_personnel_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(point_de_vente_id);
 O   ALTER TABLE ONLY public.personnel DROP CONSTRAINT point_de_vente_personnel_fk;
       public          postgres    false    213    206    2736            �
           2606    26208    stock point_de_vente_stock_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT point_de_vente_stock_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(point_de_vente_id);
 G   ALTER TABLE ONLY public.stock DROP CONSTRAINT point_de_vente_stock_fk;
       public          postgres    false    206    2736    210            �
           2606    26238 .   ligne_de_commande produit_ligne_de_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT produit_ligne_de_commande_fk FOREIGN KEY (produit_id) REFERENCES public.produit(produit_id);
 X   ALTER TABLE ONLY public.ligne_de_commande DROP CONSTRAINT produit_ligne_de_commande_fk;
       public          postgres    false    211    2746    212            �
           2606    26233    produit stock_produit_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.produit
    ADD CONSTRAINT stock_produit_fk FOREIGN KEY (stock_id) REFERENCES public.stock(stock_id);
 B   ALTER TABLE ONLY public.produit DROP CONSTRAINT stock_produit_fk;
       public          postgres    false    2744    211    210            �
           2606    26178    client utilisateur_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client
    ADD CONSTRAINT utilisateur_client_fk FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(utilisateur_id);
 F   ALTER TABLE ONLY public.client DROP CONSTRAINT utilisateur_client_fk;
       public          postgres    false    203    202    2730            �
           2606    26173 "   personnel utilisateur_personnel_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT utilisateur_personnel_fk FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(utilisateur_id);
 L   ALTER TABLE ONLY public.personnel DROP CONSTRAINT utilisateur_personnel_fk;
       public          postgres    false    202    2730    213            Q      x������ � �      L      x������ � �      P      x������ � �      M      x������ � �      U      x������ � �      R      x������ � �      V      x������ � �      O      x������ � �      T      x������ � �      S      x������ � �      K      x������ � �     