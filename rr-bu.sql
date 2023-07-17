--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Homebrew)
-- Dumped by pg_dump version 14.6 (Homebrew)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version;

--
-- Name: eyeshadows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eyeshadows (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    brand character varying(50),
    finish character varying(50),
    form character varying(50),
    color character varying(7),
    palette_id integer,
    single boolean
);


ALTER TABLE public.eyeshadows;

--
-- Name: eyeshadows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eyeshadows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eyeshadows_id_seq;

--
-- Name: eyeshadows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eyeshadows_id_seq OWNED BY public.eyeshadows.id;


--
-- Name: palette; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.palette (
    id integer NOT NULL,
    name character varying,
    brand character varying
);


ALTER TABLE public.palette OWNER TO postgres;

--
-- Name: palette_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.palette_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.palette_id_seq OWNER TO postgres;

--
-- Name: palette_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.palette_id_seq OWNED BY public.palette.id;


--
-- Name: eyeshadows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eyeshadows ALTER COLUMN id SET DEFAULT nextval('public.eyeshadows_id_seq'::regclass);


--
-- Name: palette id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palette ALTER COLUMN id SET DEFAULT nextval('public.palette_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
5586623b27c3
\.


--
-- Data for Name: eyeshadows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eyeshadows (id, name, brand, finish, form, color, palette_id, single) FROM stdin;
445	Tempera	Anastasia Beverly Hills	Matte	Powder	#fbd6c2	1	f
446	Golden Ochre	Anastasia Beverly Hills	Matte	Powder	#D8C099	1	f
447	Vermeer	Anastasia Beverly Hills	Metallic	Powder	#F0DEDD	1	f
448	Buon Fresco	Anastasia Beverly Hills	Matte	Powder	#C6A7A6	1	f
449	Antique Bronze	Anastasia Beverly Hills	Metallic	Powder	#5B3D35	1	f
450	Love Letter	Anastasia Beverly Hills	Matte	Powder	#AB505F	1	f
451	Cyprus Umber	Anastasia Beverly Hills	Matte	Powder	#4A3733	1	f
452	Raw Sienna	Anastasia Beverly Hills	Matte	Powder	#A75E3A	1	f
453	Burnt Orange	Anastasia Beverly Hills	Matte	Powder	#A35325	1	f
454	Primavera	Anastasia Beverly Hills	Metallic	Powder	#F6DFCF	1	f
455	Red Ochre	Anastasia Beverly Hills	Matte	Powder	#8E3932	1	f
456	Venetian Red	Anastasia Beverly Hills	Matte	Powder	#8A3833	1	f
457	Warm Taupe	Anastasia Beverly Hills	Matte	Powder	#90796E	1	f
458	Realgar	Anastasia Beverly Hills	Matte	Powder	#AD392F	1	f
459	Tempera	Anastasia Beverly Hills	Matte	Powder	#fbd6c2	2	f
460	Glistening	Anastasia Beverly Hills	Metallic	Powder	#e5bb98	2	f
461	Orange Soda	Anastasia Beverly Hills	Matte	Powder	#feb57f	2	f
462	Rose Pink	Anastasia Beverly Hills	Matte	Powder	#d4999a	2	f
463	Sultry	Anastasia Beverly Hills	Metallic	Powder	#F3D8D1	2	f
464	Bronze	Anastasia Beverly Hills	Metallic	Powder	#fceba9	2	f
465	Mulberry	Anastasia Beverly Hills	Matte	Powder	#783d3f	2	f
466	Dusty Rose	Anastasia Beverly Hills	Matte	Powder	#8e666d	2	f
467	Fairy	Anastasia Beverly Hills	Metallic	Powder	#d8c08e	2	f
468	Burnt Orange	Anastasia Beverly Hills	Matte	Powder	#bf8063	2	f
469	Sienna	Anastasia Beverly Hills	Matte	Powder	#92554a	2	f
470	Rustic	Anastasia Beverly Hills	Matte	Powder	#97654d	2	f
471	Cyprus Umber	Anastasia Beverly Hills	Matte	Powder	#66473e	2	f
472	Noir	Anastasia Beverly Hills	Matte	Powder	#312d2c	2	f
473	Quartz	Huda Beauty	Metallic	Powder	#e6ccdf	3	f
474	Aura	Huda Beauty	Matte	Powder	#b8908e	3	f
475	Gratitude	Huda Beauty	Matte	Powder	#d3c0dd	3	f
476	Cosmic Love	Huda Beauty	Metallic	Powder	#9e817f	3	f
477	Empowered	Huda Beauty	Metallic	Powder	#c4949b	3	f
478	Joy	Huda Beauty	Metallic	Powder	#5b464a	3	f
479	Precious	Huda Beauty	Matte	Powder	#d394a3	3	f
480	Energized	Huda Beauty	Metallic	Powder	#c0b099	3	f
481	Love Stone	Huda Beauty	Metallic	Cream	#eabbc5	3	f
482	Cherished	Huda Beauty	Matte	Powder	#c7bbbf	3	f
483	Blissful	Huda Beauty	Metallic	Powder	#e0bfaa	3	f
484	Happiness	Huda Beauty	Matte	Powder	#8d6c6c	3	f
485	Mantra	Huda Beauty	Matte	Powder	#e99ea9	3	f
486	Serenity	Huda Beauty	Matte	Powder	#4f3e51	3	f
487	Abundance	Huda Beauty	Metallic	Powder	#c9d2eb	3	f
488	Moon Magic	Huda Beauty	Metallic	Powder	#b97d7a	3	f
489	Radiate	Huda Beauty	Matte	Powder	#875957	3	f
490	Self Love	Huda Beauty	Metallic	Powder	#e9ad9c	3	f
491	Desert Sand	Huda Beauty	Matte	Powder	#febd9b	4	f
492	Musk	Huda Beauty	Matte	Powder	#b88067	4	f
493	Eden	Huda Beauty	Matte	Powder	#ea826d	4	f
494	Amber	Huda Beauty	Matte	Powder	#a54533	4	f
495	Blood Moon	Huda Beauty	Metallic	Powder	#ca7470	4	f
496	Oud	Huda Beauty	Matte	Powder	#ef9b9f	4	f
497	Celestial	Huda Beauty	Metallic	Powder	#996a64	4	f
498	Nefertiti	Huda Beauty	Metallic	Powder	#d89da6	4	f
499	Twilight	Huda Beauty	Metallic	Powder	#854960	4	f
500	Amethyst	Huda Beauty	Matte	Powder	#9c4489	4	f
501	Royal	Huda Beauty	Metallic	Powder	#9f6e92	4	f
502	Retrograde	Huda Beauty	Metallic	Powder	#e9af8f	4	f
503	Cashmere	Huda Beauty	Metallic	Powder	#b76e50	4	f
504	Angelic	Huda Beauty	Metallic	Powder	#6a312d	4	f
505	Cosmo	Huda Beauty	Metallic	Powder	#cb5a3b	4	f
506	Turkish Delight	Huda Beauty	Metallic	Powder	#9c3d43	4	f
507	Saffron	Huda Beauty	Matte	Powder	#cf5264	4	f
508	Blazing	Huda Beauty	Matte	Powder	#753935	4	f
509	Soleil	Anastasia Beverly Hills	Metallic	Powder	#b97f5f	5	f
510	Supreme	Anastasia Beverly Hills	Matte	Powder	#646659	5	f
511	Pinker	Anastasia Beverly Hills	Matte	Powder	#a05041	5	f
512	Big Wig	Anastasia Beverly Hills	Matte	Powder	#bfb9a8	5	f
513	Dwollahs	Anastasia Beverly Hills	Metallic	Powder	#523463	5	f
514	Credit	Anastasia Beverly Hills	Matte	Powder	#722122	5	f
515	Lituation	Anastasia Beverly Hills	Metallic	Powder	#b97f5f	5	f
516	Zamn	Anastasia Beverly Hills	Metallic	Powder	#646659	5	f
517	Wiggalese	Anastasia Beverly Hills	Metallic	Powder	#a05041	5	f
518	Shookington	Anastasia Beverly Hills	Metallic	Powder	#bfb9a8	5	f
519	Trust Issues	Anastasia Beverly Hills	Metallic	Powder	#523463	5	f
520	Edges	Anastasia Beverly Hills	Matte	Powder	#722122	5	f
521	Sponsored	Anastasia Beverly Hills	Metallic	Powder	#9d6b5a	5	f
522	Ginger	Anastasia Beverly Hills	Matte	Powder	#936f6d	5	f
523	Sails	Anastasia Beverly Hills	Matte	Powder	#6d4035	6	f
524	Yacht	Anastasia Beverly Hills	Metallic	Powder	#a07057	6	f
525	Seychelles	Anastasia Beverly Hills	Metallic	Powder	#77317a	6	f
526	Palermo	Anastasia Beverly Hills	Metallic	Powder	#cb5467	6	f
527	Seaside	Anastasia Beverly Hills	Metallic	Powder	#e02e66	6	f
528	Inheritance	Anastasia Beverly Hills	Metallic	Powder	#d57461	6	f
529	Mediterranean	Anastasia Beverly Hills	Metallic	Powder	#c28b53	6	f
530	Estate	Anastasia Beverly Hills	Matte	Powder	#e6a083	6	f
531	Cabana	Anastasia Beverly Hills	Matte	Powder	#6c7189	6	f
532	Coastline	Anastasia Beverly Hills	Matte	Powder	#d9a051	6	f
533	Bahamas	Anastasia Beverly Hills	Matte	Powder	#6b575e	6	f
534	Monte Carlo	Anastasia Beverly Hills	Matte	Powder	#a23f46	6	f
535	Cannes	Anastasia Beverly Hills	Matte	Powder	#367181	6	f
536	Palm	Anastasia Beverly Hills	Matte	Powder	#e9ebda	6	f
537	Cube	Anastasia Beverly Hills	Matte	Powder	#4a302e	7	f
538	Dawn	Anastasia Beverly Hills	Matte	Powder	#e4a943	7	f
539	Destiny	Anastasia Beverly Hills	Metallic	Powder	#5e6a5d	7	f
540	Adorn	Anastasia Beverly Hills	Metallic	Powder	#f2a04a	7	f
541	All Star	Anastasia Beverly Hills	Matte	Powder	#9b492f	7	f
542	Mercury	Anastasia Beverly Hills	Matte	Powder	#d8c08d	7	f
543	Axis	Anastasia Beverly Hills	Matte	Powder	#f6a384	7	f
544	Roxy	Anastasia Beverly Hills	Matte	Powder	#113647	7	f
545	Electric	Anastasia Beverly Hills	Metallic	Powder	#9a6e5b	7	f
546	Fudge	Anastasia Beverly Hills	Matte	Powder	#8f4344	7	f
547	New Wave	Anastasia Beverly Hills	Matte	Powder	#c38657	7	f
548	Untamed	Anastasia Beverly Hills	Matte	Powder	#997f5d	7	f
549	Edge	Anastasia Beverly Hills	Matte	Powder	#ecc7a2	7	f
550	Rowdy	Anastasia Beverly Hills	Matte	Powder	#f7f2f0	7	f
551	A1	Anastasia Beverly Hills	Metallic	Powder	#7a3437	8	f
552	A2	Anastasia Beverly Hills	Matte	Powder	#f03939	8	f
553	A3	Anastasia Beverly Hills	Matte	Powder	#cb8844	8	f
554	A4	Anastasia Beverly Hills	Metallic	Powder	#eb4f30	8	f
555	A5	Anastasia Beverly Hills	Matte	Powder	#d96655	8	f
556	B1	Anastasia Beverly Hills	Matte	Powder	#28272f	8	f
557	B2	Anastasia Beverly Hills	Metallic	Powder	#093a8a	8	f
558	B3	Anastasia Beverly Hills	Metallic	Powder	#d21936	8	f
559	B4	Anastasia Beverly Hills	Matte	Powder	#475394	8	f
560	B5	Anastasia Beverly Hills	Matte	Powder	#dba73a	8	f
561	C1	Anastasia Beverly Hills	Matte	Powder	#8e3b3a	8	f
562	C2	Anastasia Beverly Hills	Metallic	Powder	#9a3660	8	f
563	C3	Anastasia Beverly Hills	Metallic	Powder	#903d3a	8	f
564	C4	Anastasia Beverly Hills	Matte	Powder	#d2ae70	8	f
565	C5	Anastasia Beverly Hills	Matte	Powder	#e8e7ef	8	f
566	D1	Anastasia Beverly Hills	Matte	Powder	#743a69	8	f
567	D2	Anastasia Beverly Hills	Metallic	Powder	#623476	8	f
568	D3	Anastasia Beverly Hills	Matte	Powder	#d35b7f	8	f
569	D4	Anastasia Beverly Hills	Matte	Powder	#8f574f	8	f
570	D5	Anastasia Beverly Hills	Matte	Powder	#b83b89	8	f
571	E1	Anastasia Beverly Hills	Metallic	Powder	#ef235a	8	f
572	E2	Anastasia Beverly Hills	Matte	Powder	#915f40	8	f
573	E3	Anastasia Beverly Hills	Matte	Powder	#761e58	8	f
574	E4	Anastasia Beverly Hills	Matte	Powder	#8a258f	8	f
575	E5	Anastasia Beverly Hills	Matte	Powder	#c99cb9	8	f
576	A1	Anastasia Beverly Hills	Metallic	Powder	#131313	9	f
577	A2	Anastasia Beverly Hills	Matte	Powder	#4e2829	9	f
578	A3	Anastasia Beverly Hills	Metallic	Powder	#016f5e	9	f
579	A4	Anastasia Beverly Hills	Metallic	Powder	#845855	9	f
580	A5	Anastasia Beverly Hills	Metallic	Powder	#2c976d	9	f
581	B1	Anastasia Beverly Hills	Metallic	Powder	#182138	9	f
582	B2	Anastasia Beverly Hills	Matte	Powder	#e3a01a	9	f
583	B3	Anastasia Beverly Hills	Matte	Powder	#dd2268	9	f
584	B4	Anastasia Beverly Hills	Matte	Powder	#e85729	9	f
585	B5	Anastasia Beverly Hills	Matte	Powder	#646f77	9	f
586	C1	Anastasia Beverly Hills	Metallic	Powder	#5d2224	9	f
587	C2	Anastasia Beverly Hills	Metallic	Powder	#043f57	9	f
588	C3	Anastasia Beverly Hills	Matte	Powder	#1a3167	9	f
589	C4	Anastasia Beverly Hills	Matte	Powder	#027bd3	9	f
590	C5	Anastasia Beverly Hills	Matte	Powder	#dfbb8e	9	f
591	D1	Anastasia Beverly Hills	Metallic	Powder	#005ea8	9	f
592	D2	Anastasia Beverly Hills	Matte	Powder	#0454c8	9	f
593	D3	Anastasia Beverly Hills	Matte	Powder	#509350	9	f
594	D4	Anastasia Beverly Hills	Matte	Powder	#4b52b4	9	f
595	D5	Anastasia Beverly Hills	Matte	Powder	#6aa04a	9	f
596	E1	Anastasia Beverly Hills	Metallic	Powder	#0f7375	9	f
597	E2	Anastasia Beverly Hills	Metallic	Powder	#a28886	9	f
598	E3	Anastasia Beverly Hills	Matte	Powder	#c4bb56	9	f
599	E4	Anastasia Beverly Hills	Matte	Powder	#d0b714	9	f
600	E5	Anastasia Beverly Hills	Matte	Powder	#d64c81	9	f
601	A1	Anastasia Beverly Hills	Matte	Powder	#782d53	10	f
602	A2	Anastasia Beverly Hills	Matte	Powder	#dfa01b	10	f
603	A3	Anastasia Beverly Hills	Matte	Powder	#ec4926	10	f
604	A4	Anastasia Beverly Hills	Metallic	Powder	#6b2b2d	10	f
605	A5	Anastasia Beverly Hills	Matte	Powder	#2b8759	10	f
606	B1	Anastasia Beverly Hills	Metallic	Powder	#ba553e	10	f
607	B2	Anastasia Beverly Hills	Metallic	Powder	#ae3d26	10	f
608	B3	Anastasia Beverly Hills	Matte	Powder	#4f8a40	10	f
609	B4	Anastasia Beverly Hills	Matte	Powder	#c77148	10	f
610	B5	Anastasia Beverly Hills	Matte	Powder	#a35531	10	f
611	C1	Anastasia Beverly Hills	Metallic	Powder	#3c5346	10	f
612	C2	Anastasia Beverly Hills	Matte	Powder	#592126	10	f
613	C3	Anastasia Beverly Hills	Matte	Powder	#a04836	10	f
614	C4	Anastasia Beverly Hills	Matte	Powder	#d1260b	10	f
615	C5	Anastasia Beverly Hills	Metallic	Powder	#bf9464	10	f
616	D1	Anastasia Beverly Hills	Matte	Powder	#aa6042	10	f
617	D2	Anastasia Beverly Hills	Metallic	Powder	#872540	10	f
618	D3	Anastasia Beverly Hills	Matte	Powder	#dd3048	10	f
619	D4	Anastasia Beverly Hills	Metallic	Powder	#2c8962	10	f
620	D5	Anastasia Beverly Hills	Metallic	Powder	#335c65	10	f
621	E1	Anastasia Beverly Hills	Matte	Powder	#c5310a	10	f
622	E2	Anastasia Beverly Hills	Matte	Powder	#69883f	10	f
623	E3	Anastasia Beverly Hills	Matte	Powder	#b76620	10	f
624	E4	Anastasia Beverly Hills	Matte	Powder	#fd5500	10	f
625	E5	Anastasia Beverly Hills	Metallic	Powder	#c4b412	10	f
626	White Peach	Too Faced	Matte	Powder	#361b20	11	f
627	Luscious	Too Faced	Metallic	Powder	#844233	11	f
628	Just Peachy	Too Faced	Metallic	Powder	#90513e	11	f
629	Bless Her Heart	Too Faced	Metallic	Powder	#814b3e	11	f
630	Tempting	Too Faced	Metallic	Powder	#e38f81	11	f
631	Charmed, I'm Sure	Too Faced	Matte	Powder	#f1b193	11	f
632	Nectar	Too Faced	Metallic	Powder	#40252d	11	f
633	Cobbler	Too Faced	Metallic	Powder	#4f2a28	11	f
634	Candied Peach	Too Faced	Matte	Powder	#c77264	11	f
635	Bellini	Too Faced	Metallic	Powder	#f67e6e	11	f
636	Peach Pit	Too Faced	Metallic	Powder	#824c3d	11	f
637	Delectable	Too Faced	Matte	Powder	#f9b092	11	f
638	Peaches N' Cream	Too Faced	Matte	Powder	#6c453a	11	f
639	Georgia	Too Faced	Matte	Powder	#2c211c	11	f
640	Caramelized	Too Faced	Metallic	Powder	#7e7359	11	f
641	Puree	Too Faced	Metallic	Powder	#ef7f7a	11	f
642	Summer Yum	Too Faced	Matte	Powder	#d29785	11	f
643	Talk Derby To Me	Too Faced	Metallic	Powder	#f5d5c1	11	f
\.


--
-- Data for Name: palette; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.palette (id, name, brand) FROM stdin;
1	Modern Rennaisance	Anastasia Beverly Hills
2	Soft Glam	Anastasia Beverly Hills
3	Rose Quartz	Huda Beauty
4	Desert Dusk	Huda Beauty
5	Jackie Aina	Anastasia Beverly Hills
6	Riviera	Anastasia Beverly Hills
7	Subculture	Anastasia Beverly Hills
8	Norvina Pro Pigment Palette Vol. 1	Anastasia Beverly Hills
9	Norvina Pro Pigment Palette Vol. 2	Anastasia Beverly Hills
10	Norvina Pro Pigment Palette Vol. 3	Anastasia Beverly Hills
11	Sweet Peach	Too Faced
\.


--
-- Name: eyeshadows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eyeshadows_id_seq', 643, true);


--
-- Name: palette_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.palette_id_seq', 11, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: eyeshadows eyeshadows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eyeshadows
    ADD CONSTRAINT eyeshadows_pkey PRIMARY KEY (id);


--
-- Name: palette palette_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.palette
    ADD CONSTRAINT palette_pkey PRIMARY KEY (id);


--
-- Name: eyeshadows eyeshadows_palette_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eyeshadows
    ADD CONSTRAINT eyeshadows_palette_id_fkey FOREIGN KEY (palette_id) REFERENCES public.palette(id);


--
-- PostgreSQL database dump complete
--

