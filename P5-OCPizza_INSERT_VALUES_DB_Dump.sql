PGDMP     ,                
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
    public          postgres    false    203   �L       P          0    26135    commande 
   TABLE DATA           �   COPY public.commande (commande_numero, date, etat, nom_client, libelle, preparateur, adresse_livraison, prix_ttc, client_id, point_de_vente_id) FROM stdin;
    public          postgres    false    207   N       M          0    26122    facture 
   TABLE DATA           k   COPY public.facture (facture_numero, date, nom_client, libelle_commande, total_ttc, client_id) FROM stdin;
    public          postgres    false    204   �R       U          0    26163    ligne_de_commande 
   TABLE DATA           r   COPY public.ligne_de_commande (commande_numero, produit_id, nom_produit, prix_unitaire_ttc, quantite) FROM stdin;
    public          postgres    false    212   �U       R          0    26148 	   livraison 
   TABLE DATA           �   COPY public.livraison (livraison_numero, date, livreur, nom_client, adresse_livraison, commande_numero, facture_numero) FROM stdin;
    public          postgres    false    209   �W       V          0    26168 	   personnel 
   TABLE DATA           ^   COPY public.personnel (personnel_id, fonction, point_de_vente_id, utilisateur_id) FROM stdin;
    public          postgres    false    213   �Z       O          0    26129    point_de_vente 
   TABLE DATA           m   COPY public.point_de_vente (point_de_vente_id, raison_sociale, adresse, telephone, mail, gerant) FROM stdin;
    public          postgres    false    206   �[       T          0    26158    produit 
   TABLE DATA           s   COPY public.produit (produit_id, categorie, nom, descriptif, prix_unitaire_ht, taux_tva_100, stock_id) FROM stdin;
    public          postgres    false    211   B]       S          0    26153    stock 
   TABLE DATA           {   COPY public.stock (stock_id, categorie, nom_produit, nom_ingredient, fournisseur, quantite, point_de_vente_id) FROM stdin;
    public          postgres    false    210   m_       K          0    26112    utilisateur 
   TABLE DATA           X   COPY public.utilisateur (utilisateur_id, nom, prenom, pseudo, mot_de_passe) FROM stdin;
    public          postgres    false    202   2b       ^           0    0    point_de_vente_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.point_de_vente_id_seq', 1, false);
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
       public          postgres    false    202    2730    213            Q   '  x�]S[n�0�^�BpAR�O�R���Rr� Vf\�TPf�)��ź��46�3�ٙ%���"+r	鴗����j�C��	Y���u��K�?��}�n!��3=���G����rQ�E�N|�V�i
�),��We�A{����ǜT7)�W%|���JT&�����o���U�W+k�� J)�`�T�@@B�վnD	!�HJnD�ʝ�n��)\V2����䋦�K�CrQBW�[���Of�'g��Y�1�ͦ���@�D���Kc�� 1�$�Ȗ�ڗ��������&����<'�9��:�5���BJ�"v;�UNr���T�����̭Q<�1X	)��s!�@W���z�XJQ69�gF�Qʢj �o:�̵���!8v&V�%r�$��ˋ>!���)"���Vm�2�b���=��ǩ\~)�, X�����檤��;��$�g�AT-6y]�C���7{ԃ�Y,"�h���)�}�.�g�jo��tL�/��)��﨧V��
�H,��M�S-��F߾���������      L   V  x�U��j�0Eך�	3�F�]H�B
����Q%�R��B���K����ޫÐ@-�1l�>ޢ�n����յ�A�X������8Đ�o3��!54S�de�q���C
�����9�U#��!�|Y�Y`�e�F��S����W��m���9Ё�ZI1Z'�&�C?F�Um�`
�(�8gŃ����5A`���<�����Hp5����3^�g����8���_�) ���(�E닄H��Z�@�xUlItX
�1^�0�a��y�5�d����P<��=�y�q�l�ԟ/,ܾ����G5g���.ر��%�c��t?��4��r@�)9��sz�ס�V ��W��      P   �  x��W�n�H��b90���6I��&;j����=M���&���A���&�6��$R&���w�M#t|M�5'�����(�^J��m���y�����U�De{5�[y�-r�?1���G�Q窬�ɧJ�� ��a2O6!�"n1��b��c���*��s��2�;�oJ�m���D��8	�4FܭjWV�I����F�?&���Mr�F����c��7��8`n����zޠ?�ܪQ$+�$_UuPh����W�#W_�*W/��a�,�rW�Ȏ2�[�m��v	�ȱ��a-�b���,��MJ%w�c��?��Q,��K����'Z�ɬ���·j�J( �%�)��/>C��;#�A�%�:��#�7�:\�ͫ'�v�uV���P�i�,�I��+X�8
�^��X�-��&q2���'D}�	$�g�f~��n�:�$I4��m�1�a���~B�����O���%���?fžށ8ӎ�"ay�p��_,�~7�C�� ~�j���`L�$���|[|U���`���>Al�7����3�'a�Y�ײ<��m��v�^Jx8��A`����Y��������E�A�O�%�r�5&i0}�
p%��u�><��8�Q�b˓\��]�-3��¢�, l�0�,L�$�c#�z�Q_s� ke5-*�˶�q4�W�ju^F�oQf��`h-�]�J���+��\~��z��7p��UۃQ��s�+�F`h���Y8A�e/����ա��E��:�R`���U�)�M-���q�p/��,�O^��30�����1;�m]����� ��.*L�~n܂y��&}����mM#�/�LUuc�i̳]�Мv@��q:Q�F��.���M�uKƍ�N��|R�4Ln{P��I��5����@\g�ߣ�EK+� u��5t��VFH}з�N�[tl@
hU\��z�=��N.לұ���H@���LJ�=c�Q�'kXŮ��d�i����ͥ��Ln���W�Ys�Q���w����f;�]�9%0c8s漉�FJ�Φ5d�y��U�o�T�i��5�7��b��V��w�͖]���k�wצc@q�2���4�p�QJϩ_�z���P'>(0��˞\S�����xM#m�l`Q��މ݆F�3L�3|$`�Q��3���#�骸p?u���I��n
��zso>(����F*:p��Rv��V����!��1M�9�۲�� �I�.      M   �  x���Oo�@�ϻ��;��3����pRT�����ˊ8�U�#U�Oߵ��]h{�4�3�~��7�n8j����>ɓ�,�ɲ��4���߫�Y��U�60�� E�8�H�>�y29�f�i�ǅY��jtךz�V�[*�%A�=kT�!K�rv�xjZ��Ʃُ^�g��Vx��T8�\3���,[�⻶٘�j|�V�y��W?G���1�̶ގʶ��Wf����*=E -#�g�E�,NU��r�qY�fSo�� %�T�Z��!�'e���;�����숫���M@v+V4�$Pi�֟�|�sl�6��f��i���4�5B͙��6��Ji��y<`�D4�8h�d�.f���qu�T�$1�iԀ$Y.�i������`�,~����ޘL�<���h�w_v
�kDB�-Y䳬$5���cmvթ��=-�2M&���@��W�"p
.ߢ�s�={H��|>�-�_����6�0F(;���<P�UE2O�"-�p�9�w쁢��L�HK�_�x�\Vy��_��i��ICw�����X[�݌�����d^)W6徶y��aI<	K��*/Q!�3ё �$A�D��(�(9��2`�s+�rWQ䗊<����!��H���Y�?ӵLH�L)JO��bO�=���Su��q��ʅ��b{�&=Y�{��r)��R�J����>Wc�.���`��]�ڥ��-鏀R���s      U   �  x�}�Kn�0���)|�
���3h�l���ᨩP'�(r���t1���m���/0��/*ޜ?:�uW�QL����i$@�6�
����r��`J����_���v�x��hu�0���y����My��GZ�=]�2;c��������Xݮ����>��ć��}��^h�s���4�yŹ�d��t�N��j�d�@[���C�ѡ�*i���-W3|L�*m�o�t;�"sԯ_����l�˂�-��a�H���"Nw��D#���H*�'�V����d���~��%�F:�$V�p��v�d����\��ᄳ҉4�[��!ۥ�2J�Չc��Vl����酄�d}X�'��Xx��F1Ɍ��a*5ӲAQ6L�Ňu��1O�7Ln�J��Y0� �J�gce�W*��_����r�      R   H  x���K��8���)x {�*R�m+nM�RC���`�@��� �Jd+@N4��MY~�E�܀Z}���"0�LAN���vC�aO�y�mҘ-Mnq�3Г��Ģ|������H����q��G��X��͟+��Qn�L�$�v]?�ۦ��"�(��?柦�&�Q�F�h\YD'�eZ���,�*3�u�<9���M���vbW���S��>��P������zT�tC�lF',�������Ų�WQ���ʺn �+�OY�4�ܱ` ��3���$,�6�ڤ̑lM����.�cWm�R�Z�e�"2������8?T�EɊ�g�Yg�<�����,ż����Ǻ��:�N]�rϢ�*|��$I�9)�0 b�~�h�Ql�oüP�߆����F�Ū��cG|���")5 JM>�[D�iRo�*_��r �)`i�4�����ˋYd�%�YS�����We%}�Ɛ��3�z���9�O2^���}���B���R��#"���m��w!=�4��5��HՃX�ۃEC�8(�F�;�mZ�9�@8
[��ׯ��Ĥ��b��0�^��W�&�s��҅a�]�:��Ñ~N��Yx����جa�o�[���	��Ҽ�ܛ����Z�Cע�{�y�
�DEAy��"��}�Z����"��a�>�P����7��o�`8��>��ba*�����B*����@p�/k�+���{�nU�]]nG�a��B�bI�޻��.�t���eSo���u���;j��=J��U�8��!�A��݁��r�o[Y�5Gǂ�`i�]Vt8�IS�^5t9z�������qo Iݽ뀓�MI��>�dj=N���?p��u��      V   �   x�]�Kj1��u�a��[��K6�B�#l�?Ay�C}��z��|^�A4�~�㿌��k��g�3ocCfYcCa�cCe�ƎƾƎ�c���u����eSD�ĩ�H�2U&�,T�H�*��nT�$�S�Ft��"�h�$2��t��|�h��I"3��H��jD      O   �  x�m��j�0��?]�. ْ�s6�q:�:7�M֊A��b��'��$e�C���Jt�!Hvخ�+����^p�I@���g �IR��ެ�|y�`�<Bmq��n_����	(��?���^��PR��y$���		��чn��Ƈ�kD�/~"
��D�ˋƕVF[���^�F�l~��/xhO]Sb�]O�Y��q��r�f����Y@=�%>	�_Esl�qxԓ>CH���yZFi��Ln��%I�z���;�b/:A#ߌ�n�'#�ƙ6j^킣��W/m�јq⎧M[�a%��
���VOJC�6���gRI7:���������OX̷���{ͪx<Jܐv�4p��w�y���0c����X��a� ���>tO�*����B�+ڽ�      T     x�USMo�0=K��`A��mzm�
�X��vad&%&K.%]�(�uғm��э����w�@��(:pS�B��Œc��{Of��.M�\,�ʮ��_t�`�z� ,E��xJpT�d�̈́���3�	K���D!CGpd�LʠONq���Y�Lk�93�K��H汊V=����+t2�DUw����(�.����@��K�N��^��R"����J�l�g��	(@�����ܛ�r��z&��U��{��jvB��_��@���lֳxk�gq�|�}�}?���E���}(hpIy�=l�ќ��<�GMX�>I}`�j=y�i�eD�tEu��igS�V+��6�W�����k���^��O�I[o/�m�w�[!�Rf�'AkS�$q<��H��H8�ASn��jVfUS>kJ�FB�z��@�Ӏ�3r6Mũ=�f�v�7*��	�e<�&�~����V��6���?���zb���z#����I��M;�a�Y�����Rq�RX�2�p����L����� N6@      S   �  x���Mn�0���)t�
&%�g�i��m�$�(&��H���7�9z�-YA2���	�#5�f���^5�=TP��ق�_�����m���;���.�y�f�#������̵�P�F�\\��Zbgj�!b�<��_*�eO7�����Z�k��Z9ߪ,hWokٜ��7-���CĲ'nP������Z��4�,]���p�ލ�׽xcr��1�Iټ�ނS.n�٫�Q�EJ�VJ�k�j�
W��N���������C��^9gtO��z�z�Jm��q6v`���^��[+�
b{�vS�!� _�~2:���hA�E�&@��96�@Km������5+Z�����ǆh�D{�9��d��?"|N�;�T�\���ߙ�^>K~�S�?��".~^�Or��v?��C��S�o�鐵�� A��u��)���b�`5TL}��Xe���OPKo+u�B�QV�����)�"�g���b������VΧ�(��N���fӃt�bB�f�t1)Hk��	Iڵc55HYW&]�� ��Y"��m���'Y���^�e��n�h�2�,BW�B���u`�_�Q�]��Y"A���(K�U��e�Q��4Fy��A��1�օ�
j�X�rq+A���U{5z,E�����>�E���
j�@����VAmHQ�8�QPG�S�5�1��f� ��H�      K   3  x�ET]o�8|>�1+ ����%%$(��T��!p��];a/��#�])`���13g����Z6ME����v<�Q�eãӭ3��U��$������|�C���R���,"�Y�9��Y��-����o��O��E����*3�NQ~����@[�M�Z]�s��R�q����X���_|g��3-���e�}R1jϨ�񉳆2$���g���~�-;됍b��;��Xs�������zS�˜��x�OZ!��O�J�j_�yVS��B��vviǓi�ۋ�:�tlZ���N(�/�UIo�M7�&��Φ������U�w�m:���~+s�O�Q��Їrƿ�����h�����y%�3��d�t�W�Ua�*�\���T����G׳�4����d���+����_�����<�b#A!p�U�;,�b�$�5b:'ܓuh��q+�|dzW�h�S���>S�g;��J�ڎ�cm��9�L���4��r��y��;�;,�R�P`S��
�T�8�� <l۱?0��'P��Q+�����+%U]T���_�L�u�����s�_&b6!���%��wU��;������Z�� wE���JT8����a��i**,�	�2�5�\�$�.�� =��Xt�:h[1��ws��� �O���h��o���N��K!���m����m!Z�\4��ٜ�d� �7eO'go�����������	���F�=��v�#�bN?�bz*�S䈉/xuS�<_���,�ȫ��T���SydiC�f;��+��ov@"ՠ�Q��.^Q;����hVw�:��y��{0o�#dtD��h4E�E��*l�8A*r6(*��M������5���zO�.� ��@pV�p?��E���x�O��O�W�!z"��ʴ�(�i�r�\�:Q$wќ`z50�(�}�t����ڐy<*E��)��Qc��ar�#Lc�bA�� �������Q��k@��[ikn���4����1�e�Q��0�=���F��ȃſ��o�9��p��m�X���a` M{E�ΚN�x�P#��i���2���w@9�6���!Ŀ*��     