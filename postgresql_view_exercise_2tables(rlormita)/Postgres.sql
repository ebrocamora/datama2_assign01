PGDMP     *    )            
    w            postgres    12.0    12.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2835                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    24600    food_company_supplier    TABLE       CREATE TABLE public.food_company_supplier (
    id integer NOT NULL,
    company_name character varying(45) NOT NULL,
    company_insurance character varying(45),
    contact_no character varying(12) NOT NULL,
    company_address character varying(45) NOT NULL
);
 )   DROP TABLE public.food_company_supplier;
       public         heap    postgres    false            �            1259    24585    food_supplies    TABLE     �   CREATE TABLE public.food_supplies (
    stock_popcorn integer,
    stock_junkfoods integer,
    stock_burger integer,
    id integer NOT NULL,
    companyid integer NOT NULL
);
 !   DROP TABLE public.food_supplies;
       public         heap    postgres    false            �            1259    32786    foodsupplies_to_deliver    VIEW     �  CREATE VIEW public.foodsupplies_to_deliver AS
 SELECT food_company_supplier.id,
    food_company_supplier.company_name,
    food_company_supplier.company_address,
    food_company_supplier.contact_no,
    food_supplies.companyid,
    food_supplies.stock_burger,
    food_supplies.stock_popcorn
   FROM (public.food_company_supplier
     JOIN public.food_supplies ON ((food_company_supplier.id = food_supplies.companyid)));
 *   DROP VIEW public.foodsupplies_to_deliver;
       public          postgres    false    203    204    204    204    204    203    203                      0    24600    food_company_supplier 
   TABLE DATA           q   COPY public.food_company_supplier (id, company_name, company_insurance, contact_no, company_address) FROM stdin;
    public          postgres    false    204   �                 0    24585    food_supplies 
   TABLE DATA           d   COPY public.food_supplies (stock_popcorn, stock_junkfoods, stock_burger, id, companyid) FROM stdin;
    public          postgres    false    203   �       �
           2606    24604 1   food_company_supplier food_company_supplier_pkey1 
   CONSTRAINT     o   ALTER TABLE ONLY public.food_company_supplier
    ADD CONSTRAINT food_company_supplier_pkey1 PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.food_company_supplier DROP CONSTRAINT food_company_supplier_pkey1;
       public            postgres    false    204            �
           2606    24589     food_supplies food_supplier_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.food_supplies
    ADD CONSTRAINT food_supplier_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.food_supplies DROP CONSTRAINT food_supplier_pkey;
       public            postgres    false    203            �
           1259    24647    fki_food_supplies_fkey    INDEX     U   CREATE INDEX fki_food_supplies_fkey ON public.food_supplies USING btree (companyid);
 *   DROP INDEX public.fki_food_supplies_fkey;
       public            postgres    false    203            �
           2606    32781    food_supplies companyid    FK CONSTRAINT     �   ALTER TABLE ONLY public.food_supplies
    ADD CONSTRAINT companyid FOREIGN KEY (companyid) REFERENCES public.food_company_supplier(id);
 A   ALTER TABLE ONLY public.food_supplies DROP CONSTRAINT companyid;
       public          postgres    false    2699    204    203               �   x�e�A�0E��)z $��Z.�DMع��$uJ
5�[y/fegܿ��S�T�U���Y`�Z����ɲ�u!�!��#Q�4'�1�w��WZ嚵��G����HQ��b���R��A6̎�?�T%ۂ�!�o���t�%��|��D} H�Ɍ��r�?��>�         :   x���	  C�s2����-������kA_��h
����yٔտS�;H>Xz
a     