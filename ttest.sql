--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    albumid integer NOT NULL,
    title character varying(100),
    mainartist integer
);


ALTER TABLE public.album OWNER TO postgres;

--
-- Name: albumtrack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albumtrack (
    albumid integer NOT NULL,
    songid integer
);


ALTER TABLE public.albumtrack OWNER TO postgres;

--
-- Name: COLUMN albumtrack.songid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.albumtrack.songid IS 'List is Short due to the test challange';


--
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    artistid integer NOT NULL,
    name character varying(100),
    accountid integer
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- Name: rhcompaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rhcompaccount (
    accountid integer NOT NULL,
    name character varying
);


ALTER TABLE public.rhcompaccount OWNER TO postgres;

--
-- Name: rhorg_auth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rhorg_auth (
    accountid integer NOT NULL,
    rhartistid integer NOT NULL,
    rhsongid integer NOT NULL,
    rhalbumid integer NOT NULL
);


ALTER TABLE public.rhorg_auth OWNER TO postgres;

--
-- Name: song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song (
    songid integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.song OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    companyemployee character varying(100),
    accountid integer,
    privs integer NOT NULL,
    privs_desc character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.privs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.privs IS '3: ReadOnly';


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (albumid, title, mainartist) FROM stdin;
1	Muse Sick-N-Hour Mess Age	1
2	B-Day	8
3	Miss E… So Addictive	2
4	Big Willie Style	5
5	Chocolate Factory	4
6	Brain Salad Surgery	9
7	The Spaghetti Incident?	9
8	Steptacular	7
9	Standing On The Shoulder Of Giants	2
10	Supposed Former Infatuation Junkie	2
11	Listen Without Prejudice Vol. 1	1
12	Untitled	7
\.


--
-- Data for Name: albumtrack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albumtrack (albumid, songid) FROM stdin;
1	1
1	8
3	2
3	5
8	4
9	9
7	3
5	6
\.


--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (artistid, name, accountid) FROM stdin;
1	Early Paragon	1
2	Violin Of The Vegas	2
3	Heavy Turtle	3
4	Southern Carousel	4
5	Blitz Angel	5
6	Smurf Of Magazine	6
7	Guided Verbose	7
8	Above Morale	8
9	Wily Hallucination	9
\.


--
-- Data for Name: rhcompaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rhcompaccount (accountid, name) FROM stdin;
1	High Music
2	Best Rock Co
3	HiHat  Limited
4	Vivi Studios
5	Sony Corp
6	US Rec
7	Japan Records
8	Z tech
9	Fly Inc
\.


--
-- Data for Name: rhorg_auth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rhorg_auth (accountid, rhartistid, rhsongid, rhalbumid) FROM stdin;
1	1	1	2
1	1	2	3
1	2	3	3
1	2	4	4
1	2	5	2
1	2	6	1
1	2	7	3
2	5	1	1
3	3	3	4
4	4	1	5
5	6	1	4
5	6	1	6
5	6	2	7
5	6	3	8
5	6	4	9
5	6	1	1
5	6	1	2
6	5	2	2
6	5	3	2
6	5	4	3
6	5	5	4
6	5	1	5
6	5	4	6
6	5	1	7
7	8	4	3
7	8	5	3
7	8	3	2
7	8	4	2
7	8	5	2
9	9	1	4
9	9	1	5
9	9	1	1
9	9	2	1
\.


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.song (songid, name) FROM stdin;
1	Glittering Dynamite
2	Pacific Creativity
3	Mystic Ignorance
4	Nothing But A Sale
5	Reckless Look
6	Eternal Rocket
7	Deadly Tobacco
8	Deadly Twister
9	Green Doubt
10	Impossible Psycho
11	Real Dynamite
12	Unconditional Realism
13	Day Of The Tsunami
14	My Battle
15	Repeating Beauty
16	Foxy Woman
17	Loose Showcase
18	False Mother
19	Glittering Sucker
20	Freezing Gun
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, companyemployee, accountid, privs, privs_desc) FROM stdin;
1	Keith Ryan	1	1	Superuser
3	Helen Hudson	3	1	Superuser
5	Sharon Knight	5	1	Superuser
2	Julie Brown	2	2	ReadWrite
4	Anne Sanchez	4	2	ReadWrite
6	Jesse Fowler	6	2	ReadWrite
7	Kathy Woods	7	3	ReadOnly
8	Denise Sims	8	3	ReadOnly
9	Victor Boyd	9	3	ReadOnly
\.


--
-- Name: rhcompaccount account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rhcompaccount
    ADD CONSTRAINT account_pkey PRIMARY KEY (accountid);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (albumid);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (artistid);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (songid);


--
-- Name: rhorg_auth uniq_cons2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rhorg_auth
    ADD CONSTRAINT uniq_cons2 UNIQUE (accountid, rhartistid, rhsongid, rhalbumid);


--
-- Name: albumtrack uq_altrac; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumtrack
    ADD CONSTRAINT uq_altrac UNIQUE (songid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: album album_mainartist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_mainartist_fkey FOREIGN KEY (mainartist) REFERENCES public.artist(artistid);


--
-- Name: albumtrack albumtrack_albumid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumtrack
    ADD CONSTRAINT albumtrack_albumid_fkey FOREIGN KEY (albumid) REFERENCES public.album(albumid);


--
-- Name: albumtrack albumtrack_songid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumtrack
    ADD CONSTRAINT albumtrack_songid_fkey FOREIGN KEY (songid) REFERENCES public.song(songid);


--
-- Name: artist artist_accountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_accountid_fkey FOREIGN KEY (accountid) REFERENCES public.rhcompaccount(accountid);


--
-- Name: rhorg_auth rhorg_auth_rhalbumid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rhorg_auth
    ADD CONSTRAINT rhorg_auth_rhalbumid_fkey FOREIGN KEY (rhalbumid) REFERENCES public.album(albumid);


--
-- Name: rhorg_auth rhorg_auth_rhartistid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rhorg_auth
    ADD CONSTRAINT rhorg_auth_rhartistid_fkey FOREIGN KEY (rhartistid) REFERENCES public.artist(artistid);


--
-- Name: rhorg_auth rhorg_auth_rhsongid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rhorg_auth
    ADD CONSTRAINT rhorg_auth_rhsongid_fkey FOREIGN KEY (rhsongid) REFERENCES public.song(songid);


--
-- Name: users users_accountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_accountid_fkey FOREIGN KEY (accountid) REFERENCES public.rhcompaccount(accountid);


--
-- PostgreSQL database dump complete
--

