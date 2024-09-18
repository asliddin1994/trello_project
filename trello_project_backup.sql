PGDMP                      |            trello_project    14.13 (Homebrew)    16.3 P    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16987    trello_project    DATABASE     p   CREATE DATABASE trello_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE trello_project;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                asliddin    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   asliddin    false    4            �            1259    17198    board_members    TABLE     �   CREATE TABLE public.board_members (
    id integer NOT NULL,
    board_id integer,
    user_id integer,
    role character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.board_members;
       public         heap    postgres    false    4            �            1259    17197    board_members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.board_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.board_members_id_seq;
       public          postgres    false    224    4            �           0    0    board_members_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.board_members_id_seq OWNED BY public.board_members.id;
          public          postgres    false    223            �            1259    17102    boards    TABLE       CREATE TABLE public.boards (
    id integer NOT NULL,
    workspace_id integer,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.boards;
       public         heap    postgres    false    4            �            1259    17101    boards_id_seq    SEQUENCE     �   CREATE SEQUENCE public.boards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.boards_id_seq;
       public          postgres    false    212    4            �           0    0    boards_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;
          public          postgres    false    211            �            1259    17177    card_comments    TABLE       CREATE TABLE public.card_comments (
    id integer NOT NULL,
    card_id integer,
    user_id integer,
    comment text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.card_comments;
       public         heap    postgres    false    4            �            1259    17176    card_comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.card_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.card_comments_id_seq;
       public          postgres    false    4    222            �           0    0    card_comments_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.card_comments_id_seq OWNED BY public.card_comments.id;
          public          postgres    false    221            �            1259    17132    cards    TABLE     [  CREATE TABLE public.cards (
    id integer NOT NULL,
    list_id integer,
    title character varying(255) NOT NULL,
    description text,
    due_date timestamp without time zone,
    "position" integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.cards;
       public         heap    postgres    false    4            �            1259    17131    cards_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cards_id_seq;
       public          postgres    false    4    216            �           0    0    cards_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;
          public          postgres    false    215            �            1259    17118    lists    TABLE       CREATE TABLE public.lists (
    id integer NOT NULL,
    board_id integer,
    name character varying(255) NOT NULL,
    "position" integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.lists;
       public         heap    postgres    false    4            �            1259    17117    lists_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.lists_id_seq;
       public          postgres    false    4    214            �           0    0    lists_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.lists_id_seq OWNED BY public.lists.id;
          public          postgres    false    213            �            1259    17216    members    TABLE     �   CREATE TABLE public.members (
    id integer NOT NULL,
    workspace_id integer,
    user_id integer,
    role character varying(50),
    joined_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.members;
       public         heap    postgres    false    4            �            1259    17215    members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.members_id_seq;
       public          postgres    false    226    4            �           0    0    members_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;
          public          postgres    false    225            �            1259    17148 	   templates    TABLE     J  CREATE TABLE public.templates (
    id integer NOT NULL,
    workspace_id integer,
    name character varying(255) NOT NULL,
    description text,
    template_type character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.templates;
       public         heap    postgres    false    4            �            1259    17147    templates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.templates_id_seq;
       public          postgres    false    218    4            �           0    0    templates_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.templates_id_seq OWNED BY public.templates.id;
          public          postgres    false    217            �            1259    17164    users    TABLE     F  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    17163    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    4    220            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    219            �            1259    17091 
   workspaces    TABLE       CREATE TABLE public.workspaces (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.workspaces;
       public         heap    postgres    false    4            �            1259    17090    workspaces_id_seq    SEQUENCE     �   CREATE SEQUENCE public.workspaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.workspaces_id_seq;
       public          postgres    false    4    210            �           0    0    workspaces_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.workspaces_id_seq OWNED BY public.workspaces.id;
          public          postgres    false    209            �           2604    17201    board_members id    DEFAULT     t   ALTER TABLE ONLY public.board_members ALTER COLUMN id SET DEFAULT nextval('public.board_members_id_seq'::regclass);
 ?   ALTER TABLE public.board_members ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    17105 	   boards id    DEFAULT     f   ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);
 8   ALTER TABLE public.boards ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    17180    card_comments id    DEFAULT     t   ALTER TABLE ONLY public.card_comments ALTER COLUMN id SET DEFAULT nextval('public.card_comments_id_seq'::regclass);
 ?   ALTER TABLE public.card_comments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    17135    cards id    DEFAULT     d   ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);
 7   ALTER TABLE public.cards ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    17121    lists id    DEFAULT     d   ALTER TABLE ONLY public.lists ALTER COLUMN id SET DEFAULT nextval('public.lists_id_seq'::regclass);
 7   ALTER TABLE public.lists ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    17219 
   members id    DEFAULT     h   ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);
 9   ALTER TABLE public.members ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    17151    templates id    DEFAULT     l   ALTER TABLE ONLY public.templates ALTER COLUMN id SET DEFAULT nextval('public.templates_id_seq'::regclass);
 ;   ALTER TABLE public.templates ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    17167    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    17094    workspaces id    DEFAULT     n   ALTER TABLE ONLY public.workspaces ALTER COLUMN id SET DEFAULT nextval('public.workspaces_id_seq'::regclass);
 <   ALTER TABLE public.workspaces ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �          0    17198    board_members 
   TABLE DATA           P   COPY public.board_members (id, board_id, user_id, role, created_at) FROM stdin;
    public          postgres    false    224   �^       �          0    17102    boards 
   TABLE DATA           ]   COPY public.boards (id, workspace_id, name, description, created_at, updated_at) FROM stdin;
    public          postgres    false    212   �^       �          0    17177    card_comments 
   TABLE DATA           ^   COPY public.card_comments (id, card_id, user_id, comment, created_at, updated_at) FROM stdin;
    public          postgres    false    222   Q_       �          0    17132    cards 
   TABLE DATA           n   COPY public.cards (id, list_id, title, description, due_date, "position", created_at, updated_at) FROM stdin;
    public          postgres    false    216   �_       �          0    17118    lists 
   TABLE DATA           W   COPY public.lists (id, board_id, name, "position", created_at, updated_at) FROM stdin;
    public          postgres    false    214   e`       �          0    17216    members 
   TABLE DATA           M   COPY public.members (id, workspace_id, user_id, role, joined_at) FROM stdin;
    public          postgres    false    226   �`       �          0    17148 	   templates 
   TABLE DATA           o   COPY public.templates (id, workspace_id, name, description, template_type, created_at, updated_at) FROM stdin;
    public          postgres    false    218   a       �          0    17164    users 
   TABLE DATA           R   COPY public.users (id, name, email, password, created_at, updated_at) FROM stdin;
    public          postgres    false    220   �a       �          0    17091 
   workspaces 
   TABLE DATA           S   COPY public.workspaces (id, name, description, created_at, updated_at) FROM stdin;
    public          postgres    false    210   b       �           0    0    board_members_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.board_members_id_seq', 3, true);
          public          postgres    false    223            �           0    0    boards_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.boards_id_seq', 3, true);
          public          postgres    false    211            �           0    0    card_comments_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.card_comments_id_seq', 3, true);
          public          postgres    false    221            �           0    0    cards_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cards_id_seq', 4, true);
          public          postgres    false    215            �           0    0    lists_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.lists_id_seq', 4, true);
          public          postgres    false    213            �           0    0    members_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.members_id_seq', 3, true);
          public          postgres    false    225            �           0    0    templates_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.templates_id_seq', 3, true);
          public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    219            �           0    0    workspaces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.workspaces_id_seq', 2, true);
          public          postgres    false    209            �           2606    17204     board_members board_members_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.board_members DROP CONSTRAINT board_members_pkey;
       public            postgres    false    224            �           2606    17111    boards boards_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.boards DROP CONSTRAINT boards_pkey;
       public            postgres    false    212            �           2606    17186     card_comments card_comments_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.card_comments
    ADD CONSTRAINT card_comments_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.card_comments DROP CONSTRAINT card_comments_pkey;
       public            postgres    false    222            �           2606    17141    cards cards_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_pkey;
       public            postgres    false    216            �           2606    17125    lists lists_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.lists DROP CONSTRAINT lists_pkey;
       public            postgres    false    214            �           2606    17222    members members_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public            postgres    false    226            �           2606    17157    templates templates_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.templates DROP CONSTRAINT templates_pkey;
       public            postgres    false    218            �           2606    17175    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    220            �           2606    17173    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    17100    workspaces workspaces_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.workspaces DROP CONSTRAINT workspaces_pkey;
       public            postgres    false    210                       2606    17205 )   board_members board_members_board_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_board_id_fkey FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.board_members DROP CONSTRAINT board_members_board_id_fkey;
       public          postgres    false    212    224    3566                       2606    17210 (   board_members board_members_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.board_members DROP CONSTRAINT board_members_user_id_fkey;
       public          postgres    false    220    224    3576            �           2606    17112    boards boards_workspace_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.boards DROP CONSTRAINT boards_workspace_id_fkey;
       public          postgres    false    3564    212    210                       2606    17187 (   card_comments card_comments_card_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.card_comments
    ADD CONSTRAINT card_comments_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.card_comments DROP CONSTRAINT card_comments_card_id_fkey;
       public          postgres    false    222    216    3570                       2606    17192 (   card_comments card_comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.card_comments
    ADD CONSTRAINT card_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.card_comments DROP CONSTRAINT card_comments_user_id_fkey;
       public          postgres    false    3576    222    220                       2606    17142    cards cards_list_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_list_id_fkey FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_list_id_fkey;
       public          postgres    false    216    3568    214                        2606    17126    lists lists_board_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_board_id_fkey FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.lists DROP CONSTRAINT lists_board_id_fkey;
       public          postgres    false    3566    212    214                       2606    17228    members members_user_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.members DROP CONSTRAINT members_user_id_fkey;
       public          postgres    false    220    3576    226                       2606    17223 !   members members_workspace_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.members DROP CONSTRAINT members_workspace_id_fkey;
       public          postgres    false    210    3564    226                       2606    17158 %   templates templates_workspace_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.templates DROP CONSTRAINT templates_workspace_id_fkey;
       public          postgres    false    3564    218    210            �   F   x�3�4�Ĕ��<N##]K]CC3++S=SScCK.#�"#���ܤ�"|ꌁ���P���� NO      �   ^   x�3�4�t�O,JQ0�tI-N.�,(���SH�/R����X�Z(�Y�X�ꙚZ����2��l��d#2M6�4��l��dc2M����� j�@�      �   r   x�3�4��b JTH���M�+Q��SpN,JQ0TH�Tp��LN�4202�5��5�P04�21�20�3556�4�#�e�	��-0Y���D��Ɯ ��xc����E9��� F��� �F      �   �   x�3�4�tN,JQ0�tI-N.�,(���SH�/R�
��X�(X�'B��B����(j�gjjlhi�G��f�vی���L��i�1P'�Xc�s����Nc��&��j64�50�<�b���� �_I      �   P   x�3�4���,.Q02��Lt,u-ͬL�L�LM�-M�Hq��0�4"�c�N��d��b�	�F��qqq oe4�      �   F   x�3�4�Ĕ��<N##]K]CC3++S=SScCK.#�"#���ܤ�"|ꌁ���P���� NO      �   g   x�3�4�I�-�I,IU@b��)8�'�p&�I##]K]CC3++S=SScCK<R\FȦ���26�|��9�4F5;�(?+5��� J�gC� ��G      �   s   x�3�t��LN�L����9�z���������E)�FƜFF&����
�fV&V�z��Ɔ�&x���8��8�򓰚kbjF��Ɯ��E9��������d����� �F]      �   T   x�3��/�..HLNU0�tI-N.�,(���SH�/R@�3202�5��5�P04�21�20�3556�4�#�e�d���4?F��� ��2     