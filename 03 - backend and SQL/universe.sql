--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_au numeric,
    brightness_lu numeric,
    visible_naked_eye boolean NOT NULL,
    visible_year_round boolean,
    number_of_child_bodies integer,
    parent_body character varying(30),
    parent_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_au numeric,
    brightness_lu numeric,
    visible_naked_eye boolean NOT NULL,
    visible_year_round boolean,
    number_of_child_bodies integer,
    parent_body character varying(30),
    planet_id integer,
    type_of_cheese text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: other; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other (
    other_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_au numeric,
    brightness_lu numeric,
    visible_naked_eye boolean NOT NULL,
    visible_year_round boolean,
    number_of_child_bodies integer,
    parent_body character varying(30)
);


ALTER TABLE public.other OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_other_id_seq OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_other_id_seq OWNED BY public.other.other_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_au numeric,
    brightness_lu numeric,
    visible_naked_eye boolean NOT NULL,
    visible_year_round boolean,
    number_of_child_bodies integer,
    parent_body character varying(30),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_au numeric,
    brightness_lu numeric,
    visible_naked_eye boolean NOT NULL,
    visible_year_round boolean,
    number_of_child_bodies integer,
    parent_body character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other other_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other ALTER COLUMN other_id SET DEFAULT nextval('public.other_other_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 1.0, true, true, 1, 'Local Group', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1200, 1.5, true, false, 0, 'Local Group', 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 200, 0.5, true, false, 0, 'Local Group', 1);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 800, 0.7, true, false, 0, 'Virgo Cluster', 2);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 400, 0.9, true, false, 0, 'Canes Venatici', 3);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 5000, 0.1, true, false, 0, 'Virgo Cluster', 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.0123, 0.0037, true, true, 0, 'Earth', 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.00022, 0.0001, true, false, 0, 'Mars', 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.00012, 0.00005, false, false, 0, 'Mars', 4, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 0.0189, 0.022, true, false, 0, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 0.008, 0.003, true, false, 0, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 0.025, 0.0007, true, false, 0, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 0.019, 0.0001, false, false, 0, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 0.022, 0.022, true, true, 0, 'Saturn', 6, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.007, 0.0009, true, false, 0, 'Saturn', 6, NULL);
INSERT INTO public.moon VALUES (10, 'Iapetus', 0.008, 0.0002, false, false, 0, 'Saturn', 6, NULL);
INSERT INTO public.moon VALUES (11, 'Enceladus', 0.002, 0.0005, true, false, 0, 'Saturn', 6, NULL);
INSERT INTO public.moon VALUES (12, 'Triton', 0.021, 0.0001, false, false, 0, 'Neptune', 7, NULL);
INSERT INTO public.moon VALUES (13, 'Charon', 0.0005, 0.0003, true, false, 0, 'Pluto', 8, NULL);
INSERT INTO public.moon VALUES (14, 'Mimas', 0.002, 0.0002, true, false, 0, 'Saturn', 6, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 0.0006, 0.0004, true, false, 0, 'Uranus', 9, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 0.0013, 0.0003, true, false, 0, 'Uranus', 9, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 0.001, 0.0002, true, false, 0, 'Uranus', 9, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 0.002, 0.0001, true, false, 0, 'Uranus', 9, NULL);
INSERT INTO public.moon VALUES (19, 'Oberon', 0.001, 0.0001, true, false, 0, 'Uranus', 9, NULL);
INSERT INTO public.moon VALUES (20, 'Puck', 0.0002, 0.00005, false, false, 0, 'Uranus', 9, NULL);


--
-- Data for Name: other; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other VALUES (1, 'Quasar 3C273', 10000000000, 1000, false, false, 0, 'Universe');
INSERT INTO public.other VALUES (2, 'Hercules A', 5000000000, 100, false, false, 0, 'Universe');
INSERT INTO public.other VALUES (3, 'NGC 1275', 1000000000, 500, false, false, 0, 'Perseus Cluster');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 0.055, true, false, 0, 'Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.815, 0.92, true, false, 0, 'Sun', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, true, 1, 'Sun', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.107, 0.107, true, false, 2, 'Sun', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 318, 0.022, true, false, 79, 'Sun', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.2, 0.03, true, false, 82, 'Sun', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.5, 0.0035, true, false, 27, 'Sun', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.1, 0.0044, true, false, 14, 'Sun', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.002, 0.0001, false, false, 5, 'Sun', 1);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri b', 1.1, 0.93, false, true, 0, 'Alpha Centauri', 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 1.3, 0.48, false, true, 0, 'Proxima Centauri', 3);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 2.4, 0.25, false, true, 0, 'Kepler', 4);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', 0.69, 0.53, false, true, 0, 'HD 209458', 5);
INSERT INTO public.planet VALUES (14, 'Trappist-1e', 0.62, 0.41, false, true, 0, 'Trappist', 6);
INSERT INTO public.planet VALUES (15, 'LHS 1140 b', 1.5, 0.18, false, true, 0, 'LHS 1140', 5);
INSERT INTO public.planet VALUES (16, 'Kepler-186f', 1.1, 0.5, false, true, 0, 'Kepler', 5);
INSERT INTO public.planet VALUES (17, '55 Cancri e', 8.0, 0.13, false, true, 0, '55 Cancri', 5);
INSERT INTO public.planet VALUES (18, 'GJ 667 Cc', 4.0, 0.01, false, true, 0, 'GJ 667', 5);
INSERT INTO public.planet VALUES (19, 'HD 40307 g', 7.1, 0.07, false, true, 0, 'HD 40307', 5);
INSERT INTO public.planet VALUES (20, 'Ross 128 b', 1.4, 0.2, false, true, 0, 'Ross 128', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, true, true, 8, 'Milky Way', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1.1, 1.519, true, true, 2, 'Alpha Centauri', 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 0.9, 0.5, true, true, 0, 'Alpha Centauri', 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 20, 100, true, false, 0, 'Orion', 3);
INSERT INTO public.star VALUES (5, 'Sirius A', 2.02, 25.4, true, true, 0, 'Canis Major', 1);
INSERT INTO public.star VALUES (6, 'Sirius B', 1.02, 0.06, true, true, 0, 'Canis Major', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_other_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other other_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_name_key UNIQUE (name);


--
-- Name: other other_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_pkey PRIMARY KEY (other_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_parent_body_moons; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_parent_body_moons FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet fk_parent_body_planets; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_parent_body_planets FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star fk_parent_body_stars; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_parent_body_stars FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

