--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-03-26 09:17:46

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
-- TOC entry 216 (class 1259 OID 16402)
-- Name: friendships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendships (
    id1 bigint NOT NULL,
    id2 bigint NOT NULL,
    date timestamp without time zone,
    status character varying
);


ALTER TABLE public.friendships OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    message character varying,
    "from" bigint,
    "to" bigint[],
    date timestamp without time zone,
    reply bigint
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16432)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16395)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16414)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4849 (class 0 OID 16402)
-- Dependencies: 216
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendships (id1, id2, date, status) FROM stdin;
14	15	2024-01-08 13:38:32.268315	accepted
\.


--
-- TOC entry 4850 (class 0 OID 16407)
-- Dependencies: 217
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, message, "from", "to", date, reply) FROM stdin;
18	salut vere	15	{14}	2024-01-08 13:41:28.704524	0
19	ceau vericu	14	{15}	2024-01-09 09:56:05.123586	0
\.


--
-- TOC entry 4848 (class 0 OID 16395)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, password) FROM stdin;
13	Marinica	Porumbel	marinicaporumbel@gmail.com	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
14	Ionut	Manea	ionutmanea@gmail.com	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
15	Octavian	Oltyan	oltyanoctavian@gmail.com	99f99dee2048d48f1079ac4097d89e42061fe3fa787ee37acfe0d3b613bf418b
16	Marius	Oltyan	mariusoltyan@yahoo.com	5b39bfccb1447d4aae30e7a4fb0f4ba37e79ea96ec54b5ba7223979a15e4d0ae
17	Carol	Balan	carolbalan@gmail.com	4854e4568f14b794db51dbc3931bf15600a4679161de7e6893dd30814aa2fa56
18	Marius	Virgilius	virgiliusmarius@outlook.com	8947700978fa983e8aa71e5daae9e54c0b65ae0417291c14e369c44e4695abf9
19	Marian	Popescu	popescumarian@yahoo.com	fa431853b9e47f626efbf8e52daf21103900a655f732604d78db2f990f4a3d12
20	Claudiu	Marian	claudiumarian@yahoo.com	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92
22	Marius	Marius	marius23@gmail.com	65e84be33532fb784c48129675f9eff3a682b27168c0ea744b2cf58ee02337c5
\.


--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 219
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 19, true);


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- TOC entry 4700 (class 2606 OID 16406)
-- Name: friendships friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id1, id2);


--
-- TOC entry 4702 (class 2606 OID 16413)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4698 (class 2606 OID 16401)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4703 (class 2606 OID 16427)
-- Name: friendships fk1_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT fk1_constraint FOREIGN KEY (id1) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4704 (class 2606 OID 16422)
-- Name: friendships fk2_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT fk2_constraint FOREIGN KEY (id2) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2024-03-26 09:17:47

--
-- PostgreSQL database dump complete
--

