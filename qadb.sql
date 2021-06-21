--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

-- Started on 2020-05-27 22:06:43

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 16715)
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    users_id integer NOT NULL,
    questions_id integer NOT NULL,
    answer_text text NOT NULL,
    answer_date date NOT NULL
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16711)
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16695)
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_versions (
    version character varying(14) NOT NULL,
    executed_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO postgres;

--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN migration_versions.executed_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.migration_versions.executed_at IS '(DC2Type:datetime_immutable)';


--
-- TOC entry 202 (class 1259 OID 16725)
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    users_id integer NOT NULL,
    title character varying(255) NOT NULL,
    text text NOT NULL,
    category character varying(255) NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16713)
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16702)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16700)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 2830 (class 0 OID 16715)
-- Dependencies: 201
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answers (id, users_id, questions_id, answer_text, answer_date) FROM stdin;
2	1	1	Some text for answer	2020-05-26
1	1	1	WWWWWWWWWWWW	2020-05-26
3	1	78	wegwgwe	2020-05-26
4	1	78	wegwgwe	2020-05-26
5	1	78	wegwgwe	2020-05-26
6	1	78	wegwgwe	2020-05-26
7	1	78	wegwgwe	2020-05-26
8	1	78	wegwgwe	2020-05-26
9	1	78	wegwgwe	2020-05-26
14	1	9	wefwegwe	2020-05-26
15	1	9	gwgklukyujt	2020-05-26
16	1	9	wegweg	2020-05-26
17	1	9	HelloQuestions9	2020-05-26
18	1	12	wegweweg	2020-05-26
19	1	12	gwgwwg	2020-05-26
20	1	12	we	2020-05-26
21	1	12	1	2020-05-26
22	1	9	wgwg	2020-05-26
23	1	9	124	2020-05-26
24	1	9	wegwg	2020-05-26
25	1	7	e	2020-05-26
26	1	7	4	2020-05-27
27	1	78	555	2020-05-26
28	1	78	пп2	2020-05-26
29	1	81	Blwe	2020-05-26
30	1	81	jythgf	2020-05-26
31	1	81	we	2020-05-26
32	1	82	прпрпр	2020-05-26
33	1	82	ацуп	2020-05-26
34	1	82	пцкпцуп	2020-05-26
35	1	1	we	2020-05-27
36	1	1	fg	2020-05-27
37	1	84	weg	2020-05-27
38	1	84	ggg	2020-05-27
39	1	84	112	2020-05-27
40	1	85	ee	2020-05-27
41	1	87	ggg	2020-05-27
42	1	88	ewg	2020-05-27
44	1	89	gg	2020-05-27
45	1	9	Hello!	2020-05-27
\.


--
-- TOC entry 2825 (class 0 OID 16695)
-- Dependencies: 196
-- Data for Name: migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_versions (version, executed_at) FROM stdin;
20200429130357	2020-05-22 17:44:36
20200522172916	2020-05-22 17:44:36
\.


--
-- TOC entry 2831 (class 0 OID 16725)
-- Dependencies: 202
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, users_id, title, text, category, date) FROM stdin;
1	1	tititlltlt	wegwe we gweg weg weg weg we we gwe gwe  wegwegwegwe wge gwegweg bgntyju htg egw	categggoooory	2015-01-01
2	1	tititlltlt	wegwe we gweg weg weg weg we we gwe gwe  wegwegwegwe wge gwegweg bgntyju htg egw	fweweg ggw	2020-05-24
3	1	tititlltlt	wegwe we gweg weg weg weg we we gwe gwe  wegwegwegwe wge gwegweg bgntyju htg egw	fweweg ggw	2020-05-24
4	1	tititlltlt	wegwe we gweg weg weg weg we we gwe gwe  wegwegwegwe wge gwegweg bgntyju htg egw	fweweg ggw	2020-05-24
5	1	tititlltlt	wegwe we gweg weg weg weg we we gwe gwe  wegwegwegwe wge gwegweg bgntyju htg egw	fweweg ggw	2020-05-24
6	1	tititlltlt	wegwe we gweg weg weg weg we we gwe gwe  wegwegwegwe wge gwegweg bgntyju htg egw	fweweg ggw	2020-05-24
14	1	ewf	weg	gwe	2020-05-25
20	1	ewfwe	fwef	wef	2020-05-25
26	1	77777	we	eee	2020-05-25
27	1	weg232	egw	gwe	2020-05-25
28	1	wegw	ewg	ggew	2020-05-25
29	1	weg	wgeg	weg	2020-05-25
30	1	gwg	wegweg	gweg	2020-05-25
31	1	gwge	gwe	ew	2020-05-25
55	1	wegw	gweg	wegwe	2020-05-25
56	1	666666666666666666666666666666666	gggg	ggg	2020-05-25
57	1	wegweg	gweg	g2g	2020-05-25
58	1	weg	weg	weg	2020-05-25
72	1	цупцу	пцуп	цупцу	2020-05-26
74	1	wegwe	gwegweg	wegg	2020-05-26
78	1	555	wegweg	weg5525	2020-05-26
79	2	wegwe	weg	22223	2020-05-26
80	1	wegwgw	wgwegwg	22232	2020-05-26
7	1	tititlltlt	wegwe we gweg weg weg weg we we gwe gwe  wegwegwegwe wge gwegweg bgntyju htg egw	fweweg ggw	2020-05-25
9	1	tititit	teexte tewxtext text	catr category	2020-05-25
12	1	weg	ggg	1213	2020-05-25
81	1	Заголовок этого вопроса	Текст этого вопроса	Жизнь	2020-05-26
82	1	лнглнггн	авывяв	мммими	2020-05-26
83	1	ffffff	hhhhh	bbbb	2020-05-27
84	1	11111	22222	3333333	2020-05-27
85	1	weg	gggg	w2324	2020-05-27
86	1	gwgw	gwg	Hello	2020-05-27
87	1	wegweg	wegweg	gweg	2020-05-27
88	1	wrgwg	weweg	weggg	2020-05-27
89	1	3333333	fgg	gbb	2020-05-27
\.


--
-- TOC entry 2827 (class 0 OID 16702)
-- Dependencies: 198
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, name) FROM stdin;
1	garshin55@mail.ru	["ROLE_ADMIN"]	$argon2id$v=19$m=65536,t=4,p=1$/5pwg/3ueK9bjUUwO0DHSg$VgrbBM9F6rALF81WM04FitPbsrQUvHRCz6N10wU9Lwc	Vitaly
3	wegweg@mail.ru	[]	$argon2id$v=19$m=65536,t=4,p=1$bb9speZ6DlKs6npqxGcsxg$Bb+Lbrvm0nnBMWlp7H3vucn2ltgjnpf7gnP2VHsejfM	muukk
4	ewgew@mail.ru	[]	$argon2id$v=19$m=65536,t=4,p=1$Gh6MKDT1eUYYXiBDatwExQ$vjlesv0x6OtMdGIWgYSTULn0o2XCgRX8pravHT+gmCw	wegwegw
5	weggwegwe@mail.ru	[]	$argon2id$v=19$m=65536,t=4,p=1$ZxOKlCTdKM7ULt47zmaRiA$tCE80ZeR7HIq/z3/Vsa89GDDq9mTUm+ke4vmDzmpTT8	gewgwe
6	wegweg	[]	$argon2id$v=19$m=65536,t=4,p=1$sSyiLurTXxaV+K9+5IxzSA$2kbylRPJeBdDsyWqiKXe1kzAs2juZ7Vb/xijk1et4vE	gwegwg
7	wegwegwegwegw@mail.ru	[]	$argon2id$v=19$m=65536,t=4,p=1$Q1kjBoV6zu94+DgZUm03uw$P4OwEDxsfd9d30zoFNDsbUI86OtqXImoh+Gy0wVdGDM	gwegweg
8	wegwe22g@mail.ru	[]	$argon2id$v=19$m=65536,t=4,p=1$3MGqsNe/6lqYUAg4TGBuHQ$MDh/47T/1eSMO8oiP4Gku3oFjEqi/ocy6KkqVudpzjc	ewgwegw
9	gg@mail.ru	[]	$argon2id$v=19$m=65536,t=4,p=1$gn/UQwbQ9cehgJbTtGPqJw$KS1eGLZOYH0V411hPa8dtp7lb6/UJzOQT3T38ZsUZKI	gweg
2	papaf@mail.ru	[]	$argon2id$v=19$m=65536,t=4,p=1$Y5QUIEgWZI9DOLe4ahFdXQ$yL89SrCSrXg7jKtRN9I0yxjVdatX073wdWYkSBJYiBU	SomeName
\.


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 199
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answers_id_seq', 45, true);


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 200
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 89, true);


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 9, true);


--
-- TOC entry 2695 (class 2606 OID 16722)
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 16699)
-- Name: migration_versions migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration_versions
    ADD CONSTRAINT migration_versions_pkey PRIMARY KEY (version);


--
-- TOC entry 2700 (class 2606 OID 16732)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 16709)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 1259 OID 16723)
-- Name: idx_50d0c60667b3b43d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_50d0c60667b3b43d ON public.answers USING btree (users_id);


--
-- TOC entry 2697 (class 1259 OID 16724)
-- Name: idx_50d0c606bcb134ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_50d0c606bcb134ce ON public.answers USING btree (questions_id);


--
-- TOC entry 2698 (class 1259 OID 16733)
-- Name: idx_8adc54d567b3b43d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8adc54d567b3b43d ON public.questions USING btree (users_id);


--
-- TOC entry 2691 (class 1259 OID 16710)
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- TOC entry 2701 (class 2606 OID 16734)
-- Name: answers fk_50d0c60667b3b43d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_50d0c60667b3b43d FOREIGN KEY (users_id) REFERENCES public."user"(id);


--
-- TOC entry 2702 (class 2606 OID 16739)
-- Name: answers fk_50d0c606bcb134ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_50d0c606bcb134ce FOREIGN KEY (questions_id) REFERENCES public.questions(id);


--
-- TOC entry 2703 (class 2606 OID 16744)
-- Name: questions fk_8adc54d567b3b43d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_8adc54d567b3b43d FOREIGN KEY (users_id) REFERENCES public."user"(id);


-- Completed on 2020-05-27 22:06:44

--
-- PostgreSQL database dump complete
--

