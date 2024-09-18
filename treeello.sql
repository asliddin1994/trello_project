--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 16.3

-- Started on 2024-09-18 22:36:28 +05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: asliddin
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO asliddin;

--
-- TOC entry 3755 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: asliddin
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 17198)
-- Name: board_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.board_members (
    id integer NOT NULL,
    board_id integer,
    user_id integer,
    role character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.board_members OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17197)
-- Name: board_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.board_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.board_members_id_seq OWNER TO postgres;

--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 223
-- Name: board_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.board_members_id_seq OWNED BY public.board_members.id;


--
-- TOC entry 212 (class 1259 OID 17102)
-- Name: boards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards (
    id integer NOT NULL,
    workspace_id integer,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.boards OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17101)
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.boards_id_seq OWNER TO postgres;

--
-- TOC entry 3758 (class 0 OID 0)
-- Dependencies: 211
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- TOC entry 222 (class 1259 OID 17177)
-- Name: card_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_comments (
    id integer NOT NULL,
    card_id integer,
    user_id integer,
    comment text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.card_comments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17176)
-- Name: card_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.card_comments_id_seq OWNER TO postgres;

--
-- TOC entry 3759 (class 0 OID 0)
-- Dependencies: 221
-- Name: card_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_comments_id_seq OWNED BY public.card_comments.id;


--
-- TOC entry 216 (class 1259 OID 17132)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    list_id integer,
    title character varying(255) NOT NULL,
    description text,
    due_date timestamp without time zone,
    "position" integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17131)
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_id_seq OWNER TO postgres;

--
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 215
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- TOC entry 214 (class 1259 OID 17118)
-- Name: lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lists (
    id integer NOT NULL,
    board_id integer,
    name character varying(255) NOT NULL,
    "position" integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lists OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17117)
-- Name: lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lists_id_seq OWNER TO postgres;

--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 213
-- Name: lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lists_id_seq OWNED BY public.lists.id;


--
-- TOC entry 226 (class 1259 OID 17216)
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id integer NOT NULL,
    workspace_id integer,
    user_id integer,
    role character varying(50),
    joined_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.members OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17215)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO postgres;

--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 225
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- TOC entry 218 (class 1259 OID 17148)
-- Name: templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.templates (
    id integer NOT NULL,
    workspace_id integer,
    name character varying(255) NOT NULL,
    description text,
    template_type character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.templates OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17147)
-- Name: templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.templates_id_seq OWNER TO postgres;

--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 217
-- Name: templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.templates_id_seq OWNED BY public.templates.id;


--
-- TOC entry 220 (class 1259 OID 17164)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17163)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 210 (class 1259 OID 17091)
-- Name: workspaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workspaces (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.workspaces OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17090)
-- Name: workspaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workspaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.workspaces_id_seq OWNER TO postgres;

--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 209
-- Name: workspaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workspaces_id_seq OWNED BY public.workspaces.id;


--
-- TOC entry 3559 (class 2604 OID 17201)
-- Name: board_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.board_members ALTER COLUMN id SET DEFAULT nextval('public.board_members_id_seq'::regclass);


--
-- TOC entry 3541 (class 2604 OID 17105)
-- Name: boards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- TOC entry 3556 (class 2604 OID 17180)
-- Name: card_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_comments ALTER COLUMN id SET DEFAULT nextval('public.card_comments_id_seq'::regclass);


--
-- TOC entry 3547 (class 2604 OID 17135)
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- TOC entry 3544 (class 2604 OID 17121)
-- Name: lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lists ALTER COLUMN id SET DEFAULT nextval('public.lists_id_seq'::regclass);


--
-- TOC entry 3561 (class 2604 OID 17219)
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- TOC entry 3550 (class 2604 OID 17151)
-- Name: templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates ALTER COLUMN id SET DEFAULT nextval('public.templates_id_seq'::regclass);


--
-- TOC entry 3553 (class 2604 OID 17167)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3538 (class 2604 OID 17094)
-- Name: workspaces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workspaces ALTER COLUMN id SET DEFAULT nextval('public.workspaces_id_seq'::regclass);


--
-- TOC entry 3747 (class 0 OID 17198)
-- Dependencies: 224
-- Data for Name: board_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.board_members (id, board_id, user_id, role, created_at) FROM stdin;
1	1	1	admin	2024-09-18 16:40:05.553194
2	1	2	member	2024-09-18 16:40:05.553194
3	2	3	member	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3735 (class 0 OID 17102)
-- Dependencies: 212
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards (id, workspace_id, name, description, created_at, updated_at) FROM stdin;
1	1	Board 1	Description for Board 1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
2	1	Board 2	Description for Board 2	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
3	2	Board 3	Description for Board 3	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3745 (class 0 OID 17177)
-- Dependencies: 222
-- Data for Name: card_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_comments (id, card_id, user_id, comment, created_at, updated_at) FROM stdin;
1	1	1	This is a comment on Card 1 by Alice	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
2	2	2	This is a comment on Card 2 by Bob	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
3	3	3	This is a comment on Card 3 by Charlie	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3739 (class 0 OID 17132)
-- Dependencies: 216
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, list_id, title, description, due_date, "position", created_at, updated_at) FROM stdin;
1	1	Card 1	Description for Card 1	2024-09-30 00:00:00	1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
2	1	Card 2	Description for Card 2	2024-09-25 00:00:00	2	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
3	2	Card 3	Description for Card 3	\N	1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
4	3	Card 4	Description for Card 4	2024-10-05 00:00:00	1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3737 (class 0 OID 17118)
-- Dependencies: 214
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lists (id, board_id, name, "position", created_at, updated_at) FROM stdin;
1	1	List 1	1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
2	1	List 2	2	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
3	2	List 3	1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
4	3	List 4	1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3749 (class 0 OID 17216)
-- Dependencies: 226
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, workspace_id, user_id, role, joined_at) FROM stdin;
1	1	1	admin	2024-09-18 16:40:05.553194
2	1	2	member	2024-09-18 16:40:05.553194
3	2	3	member	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3741 (class 0 OID 17148)
-- Dependencies: 218
-- Data for Name: templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.templates (id, workspace_id, name, description, template_type, created_at, updated_at) FROM stdin;
1	1	Template 1	Template for Board	board	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
2	1	Template 2	Template for Card	card	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
3	2	Template 3	Template for Project	project	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3743 (class 0 OID 17164)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, created_at, updated_at) FROM stdin;
1	Alice	alice@example.com	password123	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
2	Bob	bob@example.com	password456	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
3	Charlie	charlie@example.com	password789	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3733 (class 0 OID 17091)
-- Dependencies: 210
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workspaces (id, name, description, created_at, updated_at) FROM stdin;
1	Workspace 1	Description for Workspace 1	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
2	Workspace 2	Description for Workspace 2	2024-09-18 16:40:05.553194	2024-09-18 16:40:05.553194
\.


--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 223
-- Name: board_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.board_members_id_seq', 3, true);


--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 211
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_id_seq', 3, true);


--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 221
-- Name: card_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_comments_id_seq', 3, true);


--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 215
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 4, true);


--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 213
-- Name: lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lists_id_seq', 4, true);


--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 225
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 3, true);


--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 217
-- Name: templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.templates_id_seq', 3, true);


--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 209
-- Name: workspaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workspaces_id_seq', 2, true);


--
-- TOC entry 3580 (class 2606 OID 17204)
-- Name: board_members board_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3566 (class 2606 OID 17111)
-- Name: boards boards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- TOC entry 3578 (class 2606 OID 17186)
-- Name: card_comments card_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_comments
    ADD CONSTRAINT card_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3570 (class 2606 OID 17141)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 3568 (class 2606 OID 17125)
-- Name: lists lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- TOC entry 3582 (class 2606 OID 17222)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 3572 (class 2606 OID 17157)
-- Name: templates templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);


--
-- TOC entry 3574 (class 2606 OID 17175)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3576 (class 2606 OID 17173)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3564 (class 2606 OID 17100)
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- TOC entry 3589 (class 2606 OID 17205)
-- Name: board_members board_members_board_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_board_id_fkey FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;


--
-- TOC entry 3590 (class 2606 OID 17210)
-- Name: board_members board_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.board_members
    ADD CONSTRAINT board_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3583 (class 2606 OID 17112)
-- Name: boards boards_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- TOC entry 3587 (class 2606 OID 17187)
-- Name: card_comments card_comments_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_comments
    ADD CONSTRAINT card_comments_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id) ON DELETE CASCADE;


--
-- TOC entry 3588 (class 2606 OID 17192)
-- Name: card_comments card_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_comments
    ADD CONSTRAINT card_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3585 (class 2606 OID 17142)
-- Name: cards cards_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_list_id_fkey FOREIGN KEY (list_id) REFERENCES public.lists(id) ON DELETE CASCADE;


--
-- TOC entry 3584 (class 2606 OID 17126)
-- Name: lists lists_board_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_board_id_fkey FOREIGN KEY (board_id) REFERENCES public.boards(id) ON DELETE CASCADE;


--
-- TOC entry 3591 (class 2606 OID 17228)
-- Name: members members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3592 (class 2606 OID 17223)
-- Name: members members_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- TOC entry 3586 (class 2606 OID 17158)
-- Name: templates templates_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: asliddin
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-09-18 22:36:28 +05

--
-- PostgreSQL database dump complete
--

