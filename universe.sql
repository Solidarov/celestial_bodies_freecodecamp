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
-- Name: exoplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet (
    exoplanet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    has_habitable_zone boolean NOT NULL
);


ALTER TABLE public.exoplanet OWNER TO freecodecamp;

--
-- Name: exoplanet_system_exoplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exoplanet_system_exoplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exoplanet_system_exoplanet_id_seq OWNER TO freecodecamp;

--
-- Name: exoplanet_system_exoplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exoplanet_system_exoplanet_id_seq OWNED BY public.exoplanet.exoplanet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovery_year integer NOT NULL,
    description text,
    mass_mo double precision
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
    name character varying(50) NOT NULL,
    discovery_year integer NOT NULL,
    planet_id integer,
    diameter_km double precision
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_moons boolean NOT NULL,
    star_id integer,
    distance_from_star_au double precision
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    age_gyr numeric(6,2) NOT NULL,
    radius_ro double precision
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
-- Name: exoplanet exoplanet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet ALTER COLUMN exoplanet_id SET DEFAULT nextval('public.exoplanet_system_exoplanet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: exoplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet VALUES (4, 'Kepler-22b', 6, 2, 11, true);
INSERT INTO public.exoplanet VALUES (5, 'Proxima Centauri b', 2, 4, 9, false);
INSERT INTO public.exoplanet VALUES (6, 'HD 209458 b', 6, 3, 12, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1610, 'Our home galaxy', 1.5);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 964, 'Nearest large galaxy to the Milky Way', 1.2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1764, 'Part of the Local Group', 5);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 1773, 'Famous for its spiral structure', 1.6);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 1912, 'Known for its bright nucleus', 8);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 1781, 'Large face-on spiral galaxy', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', -1, 3, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 4, 22.4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 4, 12.4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 5, 3630);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 5, 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 5, 5262);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 5, 4821);
INSERT INTO public.moon VALUES (8, 'Titan', 1655, 6, 5150);
INSERT INTO public.moon VALUES (9, 'Rhea', 1672, 6, 1528);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1671, 6, 1469);
INSERT INTO public.moon VALUES (11, 'Enceladus', 1789, 6, 504.2);
INSERT INTO public.moon VALUES (12, 'Miranda', 1948, 7, 471.6);
INSERT INTO public.moon VALUES (13, 'Ariel', 1851, 7, 1164);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1851, 7, 1169);
INSERT INTO public.moon VALUES (15, 'Titania', 1787, 7, 1578);
INSERT INTO public.moon VALUES (16, 'Oberon', 1787, 7, 1523);
INSERT INTO public.moon VALUES (17, 'Triton', 1846, 8, 2706);
INSERT INTO public.moon VALUES (18, 'Nereid', 1989, 8, 340);
INSERT INTO public.moon VALUES (19, 'Charon', 1978, 3, 1212);
INSERT INTO public.moon VALUES (20, 'Hydra', 2005, 3, 55);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 1, 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', false, 1, 0.72);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 1, 1.52);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 1, 5.2);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 1, 9.58);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 1, 19.22);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 1, 30.05);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, 2, 0.048);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', false, 5, 0.042);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', false, 6, 0.85);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', false, 6, 0.05);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.60, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 10.00, 887);
INSERT INTO public.star VALUES (3, 'Sirius A', 3, 0.20, 1.71);
INSERT INTO public.star VALUES (4, 'Vega', 4, 0.40, 2.36);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 5, 5.00, 1.22);
INSERT INTO public.star VALUES (6, 'Arcturus', 1, 7.00, 1.52);


--
-- Name: exoplanet_system_exoplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exoplanet_system_exoplanet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: exoplanet exoplanet_exoplanet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_exoplanet_id_key UNIQUE (exoplanet_id);


--
-- Name: exoplanet exoplanet_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_system_pkey PRIMARY KEY (exoplanet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: exoplanet exoplanet_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: exoplanet exoplanet_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: exoplanet exoplanet_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

