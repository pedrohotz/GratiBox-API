--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adress (
    id integer NOT NULL,
    user_id integer,
    endereco character varying(100),
    cep character varying(50),
    cidade character varying(50),
    estado character varying(10),
    name character varying(30)
);


ALTER TABLE public.adress OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adress_id_seq OWNER TO postgres;

--
-- Name: adress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adress_id_seq OWNED BY public.adress.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer,
    token character varying(100)
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: signature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.signature (
    id integer NOT NULL,
    user_id integer,
    plan_id integer,
    products character varying(100),
    sign_date character varying(30),
    delivery_day character varying(20)
);


ALTER TABLE public.signature OWNER TO postgres;

--
-- Name: signature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.signature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.signature_id_seq OWNER TO postgres;

--
-- Name: signature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.signature_id_seq OWNED BY public.signature.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50),
    email character varying(100),
    password character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: adress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adress ALTER COLUMN id SET DEFAULT nextval('public.adress_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: signature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signature ALTER COLUMN id SET DEFAULT nextval('public.signature_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adress (id, user_id, endereco, cep, cidade, estado, name) FROM stdin;
1	1	Rua padre café 401	36030120	Juiz de Fora	MG	Pedro Hotz
2	1	Rua padre café 401	36030120	Juiz de Fora	MG	Pedro Hotz
3	1	Rua padre café 401	36030120	Juiz de Fora	MG	Pedro Hotz
4	1	Rua padre café 401	36030120	Juiz de Fora	MG	Pedro Hotz
5	1	Rua padre café 401	36030120	Juiz de Fora	MG	Pedro Hotz
6	1	Rua padre café 401	36030120	Juiz de Fora	MG	Pedro Hotz
7	3	Rua Padre Frederico	36036150	Juiz de Fora	MG	Pedro Hotz
8	3	Rua Padre Frederico	36036150	Juiz de Fora	MG	Pedro Hotz Bronzato
9	5	Rua Padre Frederico	36036150	Juiz de Fora	MG	Pedro Hotz Bronzato
10	6	Rua Padre Frederico	36036150	Juiz de Fora	MG	Pedro Hotz Bronzato
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, token) FROM stdin;
1	1	0413d696-fb20-4fe0-96a5-53fb7ae4ee88
2	1	b79db4c3-5ae8-4c18-9256-59a248ff677d
3	1	2ca2cb6a-162e-4bd8-b383-c750ef54b3e5
4	1	1aa4fdef-d4ca-4c1d-b843-69cab3a4d33a
5	1	77e67197-8ad2-4d9a-8e10-9abfbc38cdee
6	1	4a70d30f-41d0-4f61-9de9-4ab3a4047e69
7	1	6ab8e2f1-fac1-4b7f-aee5-1de443671ad2
8	1	f6d63b9e-05a2-46cc-82b0-5b6c36977a08
9	3	572109ba-fb2c-496d-9465-9d5367eb2f2b
10	3	c8b742b1-2cca-4c50-8905-2ec8b48ed52f
11	3	e9db9d75-158f-4200-abf4-2e3e2a592111
12	3	0b371a4e-1274-4b2d-96a9-c981189ba100
13	3	fe0e316a-0c01-4cb7-ba24-d42029f05c96
14	3	eb6863ad-973f-4ffe-bdec-6c38bd2eb17b
15	3	f1bdc4c6-c641-4ca6-af6b-c928433192d9
16	3	2ce26a9b-099f-475d-b8da-3e27df6a8435
17	3	dba0d4cd-71c2-4299-9b9d-09e42e0dd192
18	3	5a359c04-5772-464e-beec-a704daea4f2d
19	3	59661f89-9af1-4def-8d2d-ae44bce56bf6
20	3	40703919-12f4-4662-80ec-997ffe5ebf9a
21	3	c9870d57-ce7c-454c-bcd1-11770a3e1f62
22	3	5cf71141-d910-4f9d-8e0b-42abc3277d90
23	3	83fe741c-9d89-4744-8588-6b304764a3db
24	3	b7099648-ab36-4448-aca7-a47fbdbf51c9
25	3	4b22d6be-fd33-4a01-841a-d0bd1cdb6f74
26	3	179b505b-48e6-499f-8a54-da47b2661b35
27	3	f8f07ca2-a38f-426f-9ffa-81b5235c1e2e
28	3	a6df9f01-b72b-4618-bd08-279420d2604d
29	3	ed5ad99b-56c2-4da4-988b-abf14db0d0e2
30	3	b73c5113-d0a3-468c-bcdf-005d3f9b1917
31	3	e1f599d3-2448-4e6a-b6f9-0fcf2fb810e9
32	3	30f84025-abda-4d16-a35a-f149abb46753
33	3	cffa558f-6913-4f5d-b86c-8abd704d3d99
34	3	4bfa33f5-59d5-4a7b-ac31-4aafc8001254
35	3	5d4529ab-d4e1-4ea6-8aa9-1651a44a3e89
36	3	bcd2511c-6e60-44d1-ac4f-fe0e58520e36
37	3	195364a8-27d7-44ed-af8e-db894f7d3e9d
38	3	d4363a0a-a3ff-45c0-b40a-7d750cb9a9c5
39	3	1c600ed8-7904-4bcf-9180-77caced75463
40	5	9878865f-b829-4b50-83ad-4ed1df08e6d2
41	6	60075e83-683b-40d1-8789-927edf3e7f22
\.


--
-- Data for Name: signature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.signature (id, user_id, plan_id, products, sign_date, delivery_day) FROM stdin;
9	3	1	Chás	22/11/21	Dia 01
10	5	2	Chás,Incensos	22/11/21	Segunda
11	6	1	Chás,Incensos,Produtos Orgânicos	22/11/21	Dia 10
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
1	pdr	pedro@email.com	$2b$12$6N2ioCQDb15jzDm4P2kWJeZNkHHzvyLcgpJN1cuZHCDxNCQgjS9sO
2	pdr	teste@email.com	884845
3	pedrin	pedrin@email.com	$2b$12$ZKHOvFDBaie41i7PpcvqGeNpedkA2otrfZq/Z7K4gEji8rjDyN6Im
4	pedrin	pedrin2@email.com	$2b$12$DaYifEWQv3LQymfJYawF/eqvf7DQQKA7re8KjCDKFOGvrSDbXWzsW
5	Pedro	pedroemail@email.com	$2b$12$LiVB/iK/EegZ0AcaKl48De/r8J9g2935oDRSAUycsHHXc4sgHZs/u
6	teste	teste2@email.com	$2b$12$KW8USatdJmYgPp8G1IgRkeWZ7ceq9n1cqN46b3knKxlbS6w6Ry5.W
\.


--
-- Name: adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adress_id_seq', 10, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 41, true);


--
-- Name: signature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.signature_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

