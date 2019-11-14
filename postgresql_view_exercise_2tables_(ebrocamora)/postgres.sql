PGDMP     ,    (            
    w            Eunace Rocamora    12.0    12.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24725    Eunace Rocamora    DATABASE     �   CREATE DATABASE "Eunace Rocamora" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 !   DROP DATABASE "Eunace Rocamora";
                postgres    false            �            1259    24731    food    TABLE     {   CREATE TABLE public.food (
    id integer NOT NULL,
    food_type character varying(10) NOT NULL,
    porter_id integer
);
    DROP TABLE public.food;
       public         heap    postgres    false            �            1259    24741    food_porter    VIEW     �  CREATE VIEW public.food_porter WITH (security_barrier='true') AS
 SELECT pg_class.oid,
    pg_class.relname,
    pg_class.relnamespace,
    pg_class.reltype,
    pg_class.reloftype,
    pg_class.relowner,
    pg_class.relam,
    pg_class.relfilenode,
    pg_class.reltablespace,
    pg_class.relpages,
    pg_class.reltuples,
    pg_class.relallvisible,
    pg_class.reltoastrelid,
    pg_class.relhasindex,
    pg_class.relisshared,
    pg_class.relpersistence,
    pg_class.relkind,
    pg_class.relnatts,
    pg_class.relchecks,
    pg_class.relhasrules,
    pg_class.relhastriggers,
    pg_class.relhassubclass,
    pg_class.relrowsecurity,
    pg_class.relforcerowsecurity,
    pg_class.relispopulated,
    pg_class.relreplident,
    pg_class.relispartition,
    pg_class.relrewrite,
    pg_class.relfrozenxid,
    pg_class.relminmxid,
    pg_class.relacl,
    pg_class.reloptions,
    pg_class.relpartbound
   FROM pg_class;
    DROP VIEW public.food_porter;
       public          postgres    false            �            1259    24726    porter    TABLE     �   CREATE TABLE public.porter (
    id integer NOT NULL,
    porter_lastname character varying(10) NOT NULL,
    porter_firstname character varying(10) NOT NULL,
    porter_age integer NOT NULL
);
    DROP TABLE public.porter;
       public         heap    postgres    false            �            1259    24755    foods    VIEW     �   CREATE VIEW public.foods AS
 SELECT food.id,
    food.food_type,
    porter.porter_lastname,
    porter.porter_firstname,
    porter.porter_age
   FROM (public.food
     JOIN public.porter ON ((food.porter_id = porter.id)));
    DROP VIEW public.foods;
       public          postgres    false    203    202    202    202    203    203    202            �            1259    24751    porter_food    VIEW     �   CREATE VIEW public.porter_food AS
 SELECT food.id,
    food.food_type,
    porter.porter_lastname,
    porter.porter_firstname,
    porter.porter_age
   FROM (public.food
     JOIN public.porter ON ((food.id = porter.id)));
    DROP VIEW public.porter_food;
       public          postgres    false    202    202    202    202    203    203                      0    24731    food 
   TABLE DATA           8   COPY public.food (id, food_type, porter_id) FROM stdin;
    public          postgres    false    203   �                 0    24726    porter 
   TABLE DATA           S   COPY public.porter (id, porter_lastname, porter_firstname, porter_age) FROM stdin;
    public          postgres    false    202   +       �
           2606    24735    food food_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.food DROP CONSTRAINT food_pkey;
       public            postgres    false    203            �
           2606    24730    porter porter_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.porter
    ADD CONSTRAINT porter_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.porter DROP CONSTRAINT porter_pkey;
       public            postgres    false    202            �
           2606    24746    food porter_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.food
    ADD CONSTRAINT porter_id FOREIGN KEY (porter_id) REFERENCES public.porter(id) NOT VALID;
 8   ALTER TABLE ONLY public.food DROP CONSTRAINT porter_id;
       public          postgres    false    202    203    2702               N   x�=�=
�P�9�����xA�g�������*���+ll�I�m9�J�����d����z�cL�]00 >�,u         y   x��;1E��y1�ę�!!
�iLH1��|(X=���:���9uE���șx�M�O2�KQ;vs��*�("D����������D�g�K�=�'�񆇖n7��?����@-%     