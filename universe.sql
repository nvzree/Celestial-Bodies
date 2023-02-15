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
    name character varying NOT NULL,
    type text NOT NULL,
    dimension_ly integer NOT NULL,
    year_of_discovery integer NOT NULL,
    distance_from_earth double precision,
    number_of_stars text NOT NULL,
    brightness double precision,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    info_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Name: info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.info_info_id_seq OWNER TO freecodecamp;

--
-- Name: info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.info_info_id_seq OWNED BY public.info.info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    radius numeric NOT NULL,
    density numeric NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    diameter text NOT NULL,
    has_life boolean NOT NULL,
    planet_types character varying NOT NULL,
    mass numeric,
    distance_from_sun numeric(5,1),
    number_of_moons integer,
    has_ring_system boolean,
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    mass real NOT NULL,
    radius real NOT NULL,
    temperature integer NOT NULL,
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: info info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info ALTER COLUMN info_id SET DEFAULT nextval('public.info_info_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 'Spiral Galaxy', 220000, 1912, 2.5, '1 trillion', 3.44, 1);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 'Spiral Galaxy', 50000, 1764, 3, '40 billion', 8.01, 2);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 'Lenticular', 50000, 1781, 28, '400 bilion', 8.98, 3);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 'Spiral Galaxy', 37000, 1773, 23, '100 billion', 8.68, 4);
INSERT INTO public.galaxy VALUES ('Cigar Galaxy', 'Irregular', 11000, 1779, 11, '10 billion', 9.08, 5);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 'Irregular', 14000, 1519, 160000, '10 billion', 0.9, 6);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 'Irregular', 7000, 1751, 210000, '50 billion', 1.9, 7);
INSERT INTO public.galaxy VALUES ('Milky Way', 'Spiral Galaxy', 100000, 1610, NULL, '400 billion', NULL, 8);
INSERT INTO public.galaxy VALUES ('Pinwheel Galaxy', 'Spiral Galaxy', 170000, 1781, 21, '160 billion', 8.24, 9);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 'Lenticular', 30000, 1779, 11, '50 billion', 9.25, 10);


--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES (1, 'x', 'xyz');
INSERT INTO public.info VALUES (2, 'y', 'yzx');
INSERT INTO public.info VALUES (3, 'z', 'zxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 11.1, 1.872, 4);
INSERT INTO public.moon VALUES (2, 'Moon', 1737.5, 3.344, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 1.471, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 1560.8, 3.013, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2631.2, 1.942, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410.3, 1.834, 5);
INSERT INTO public.moon VALUES (7, 'Amalthea', 83.45, 0.849, 5);
INSERT INTO public.moon VALUES (8, 'Himalia', 85, 2.6, 5);
INSERT INTO public.moon VALUES (9, 'Elara', 43, 2.6, 5);
INSERT INTO public.moon VALUES (10, 'Pasiphae', 30, 2.6, 5);
INSERT INTO public.moon VALUES (11, 'Sinope', 19, 2.6, 5);
INSERT INTO public.moon VALUES (12, 'Tarvos', 7.5, 2.3, 6);
INSERT INTO public.moon VALUES (13, 'Skathi', 4, 2.3, 6);
INSERT INTO public.moon VALUES (14, 'Thrymr', 3.5, 2.3, 6);
INSERT INTO public.moon VALUES (24, 'Psamathe', 20.0, 1.5, 8);
INSERT INTO public.moon VALUES (25, 'Nix', 23.0, 2.1, 9);
INSERT INTO public.moon VALUES (26, 'Charon', 603.6, 1.664, 9);
INSERT INTO public.moon VALUES (27, 'Triton', 1353.4, 2.059, 8);
INSERT INTO public.moon VALUES (28, 'Nereid', 170.0, 1.5, 8);
INSERT INTO public.moon VALUES (29, 'Desdemona', 35, 1.3, 7);
INSERT INTO public.moon VALUES (30, 'Miranda', 235.8, 1.214, 7);
INSERT INTO public.moon VALUES (31, 'Titania', 788.9, 1.662, 7);
INSERT INTO public.moon VALUES (32, 'Umbriel', 584.7, 1.459, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mecury', '4879', false, 'Rocky', 0.330, 57.9, 0, false, 1);
INSERT INTO public.planet VALUES ('Venus', '12104', false, 'Rocky Terrstrialo World', 4.87, 108.2, 0, false, 2);
INSERT INTO public.planet VALUES ('Earth', '12756', true, 'Rocky Terrestrial World', 5.97, 149.6, 1, false, 3);
INSERT INTO public.planet VALUES ('Mars', '6792', true, 'Rocky Terrestrial Worlds', 0.642, 227.9, 2, true, 4);
INSERT INTO public.planet VALUES ('Jupiter', '142984', false, 'Gas Giants', 1898, 778.6, 79, true, 5);
INSERT INTO public.planet VALUES ('Saturn', '120536', false, 'Gas Giants', 568, 1433.5, 62, true, 6);
INSERT INTO public.planet VALUES ('Uranus', '51118', false, 'Ice Giants', 86.8, 2872.5, 27, true, 7);
INSERT INTO public.planet VALUES ('Neptune', '49528', false, 'Giants', 102, 4495.1, 14, true, 8);
INSERT INTO public.planet VALUES ('Pluto', '2370', false, 'Giants', 0.0146, 5906.4, 5, false, 9);
INSERT INTO public.planet VALUES ('Nazz', '11234', true, 'Rocky', 3.22, 6124.1, 3, true, 10);
INSERT INTO public.planet VALUES ('Bible', '153254', true, 'Giants', 6.802, 6905.6, 0, false, 11);
INSERT INTO public.planet VALUES ('El', '45768', true, 'Rocky', 0.82, 7102.3, 2, true, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.989, 696000, 5778, 8);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.12, 0.15, 3042, 9);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1.1, 1.22, 5790, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 0.907, 0.87, 5490, 10);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 20, 1300, 3590, 2);
INSERT INTO public.star VALUES (6, 'Antares', 15, 604, 3600, 3);
INSERT INTO public.star VALUES (7, 'Pollux', 1.7, 10.9, 5080, 4);
INSERT INTO public.star VALUES (8, 'Aldebaran', 1.7, 44.2, 3940, 5);
INSERT INTO public.star VALUES (9, 'Vega', 2.1, 2.1, 9650, 6);
INSERT INTO public.star VALUES (10, 'Sirius A', 2.02, 1.71, 9940, 7);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 10, true);


--
-- Name: info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.info_info_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: info info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_name_key UNIQUE (name);


--
-- Name: info info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (info_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

