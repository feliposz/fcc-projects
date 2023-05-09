--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (107, 2018, 'Final', 107, 104, 4, 2);
INSERT INTO public.games VALUES (108, 2018, 'Third Place', 99, 106, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Semi-Final', 104, 106, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Semi-Final', 107, 99, 1, 0);
INSERT INTO public.games VALUES (111, 2018, 'Quarter-Final', 104, 115, 3, 2);
INSERT INTO public.games VALUES (112, 2018, 'Quarter-Final', 106, 117, 2, 0);
INSERT INTO public.games VALUES (113, 2018, 'Quarter-Final', 99, 100, 2, 1);
INSERT INTO public.games VALUES (114, 2018, 'Quarter-Final', 107, 120, 2, 0);
INSERT INTO public.games VALUES (115, 2018, 'Eighth-Final', 106, 102, 2, 1);
INSERT INTO public.games VALUES (116, 2018, 'Eighth-Final', 117, 118, 1, 0);
INSERT INTO public.games VALUES (117, 2018, 'Eighth-Final', 99, 110, 3, 2);
INSERT INTO public.games VALUES (118, 2018, 'Eighth-Final', 100, 111, 2, 0);
INSERT INTO public.games VALUES (119, 2018, 'Eighth-Final', 104, 105, 2, 1);
INSERT INTO public.games VALUES (120, 2018, 'Eighth-Final', 115, 116, 2, 1);
INSERT INTO public.games VALUES (121, 2018, 'Eighth-Final', 120, 114, 2, 1);
INSERT INTO public.games VALUES (122, 2018, 'Eighth-Final', 107, 98, 4, 3);
INSERT INTO public.games VALUES (123, 2014, 'Final', 108, 98, 1, 0);
INSERT INTO public.games VALUES (124, 2014, 'Third Place', 112, 100, 3, 0);
INSERT INTO public.games VALUES (125, 2014, 'Semi-Final', 98, 112, 1, 0);
INSERT INTO public.games VALUES (126, 2014, 'Semi-Final', 108, 100, 7, 1);
INSERT INTO public.games VALUES (127, 2014, 'Quarter-Final', 112, 103, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Quarter-Final', 98, 99, 1, 0);
INSERT INTO public.games VALUES (129, 2014, 'Quarter-Final', 100, 102, 2, 1);
INSERT INTO public.games VALUES (130, 2014, 'Quarter-Final', 108, 107, 1, 0);
INSERT INTO public.games VALUES (131, 2014, 'Eighth-Final', 100, 101, 2, 1);
INSERT INTO public.games VALUES (132, 2014, 'Eighth-Final', 102, 120, 2, 0);
INSERT INTO public.games VALUES (133, 2014, 'Eighth-Final', 107, 113, 2, 0);
INSERT INTO public.games VALUES (134, 2014, 'Eighth-Final', 108, 97, 2, 1);
INSERT INTO public.games VALUES (135, 2014, 'Eighth-Final', 112, 111, 2, 1);
INSERT INTO public.games VALUES (136, 2014, 'Eighth-Final', 103, 109, 2, 1);
INSERT INTO public.games VALUES (137, 2014, 'Eighth-Final', 98, 118, 1, 0);
INSERT INTO public.games VALUES (138, 2014, 'Eighth-Final', 99, 119, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (97, 'Algeria');
INSERT INTO public.teams VALUES (98, 'Argentina');
INSERT INTO public.teams VALUES (99, 'Belgium');
INSERT INTO public.teams VALUES (100, 'Brazil');
INSERT INTO public.teams VALUES (101, 'Chile');
INSERT INTO public.teams VALUES (102, 'Colombia');
INSERT INTO public.teams VALUES (103, 'Costa Rica');
INSERT INTO public.teams VALUES (104, 'Croatia');
INSERT INTO public.teams VALUES (105, 'Denmark');
INSERT INTO public.teams VALUES (106, 'England');
INSERT INTO public.teams VALUES (107, 'France');
INSERT INTO public.teams VALUES (108, 'Germany');
INSERT INTO public.teams VALUES (109, 'Greece');
INSERT INTO public.teams VALUES (110, 'Japan');
INSERT INTO public.teams VALUES (111, 'Mexico');
INSERT INTO public.teams VALUES (112, 'Netherlands');
INSERT INTO public.teams VALUES (113, 'Nigeria');
INSERT INTO public.teams VALUES (114, 'Portugal');
INSERT INTO public.teams VALUES (115, 'Russia');
INSERT INTO public.teams VALUES (116, 'Spain');
INSERT INTO public.teams VALUES (117, 'Sweden');
INSERT INTO public.teams VALUES (118, 'Switzerland');
INSERT INTO public.teams VALUES (119, 'United States');
INSERT INTO public.teams VALUES (120, 'Uruguay');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 138, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 120, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

