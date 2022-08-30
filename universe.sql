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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets integer,
    number_of_stars integer,
    dist_from_earth numeric(37,2),
    discovered_by text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planet_dist numeric(34,2),
    radius_km numeric(34,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_moons integer,
    has_life boolean,
    star_id integer NOT NULL,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type_id integer NOT NULL,
    aprox_age_my numeric(34,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'via lactea', NULL, NULL, NULL, 'Galileo Galilei');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Canis Majoris', NULL, NULL, 25000.00, '2Mass');
INSERT INTO public.galaxy VALUES (4, 'Eliptica de Sagitario', NULL, NULL, 70000.00, 'Rodrigo Ibata');
INSERT INTO public.galaxy VALUES (5, 'Gran nube de Magallanes', NULL, NULL, 163000.00, 'Abd Al-Rahman Al Sufi');
INSERT INTO public.galaxy VALUES (6, 'Galaxia del Triangulo', NULL, NULL, 2800000.00, 'Giovanni B Hodierna');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 365565.00, 1137.10);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 9380.00, 11267.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23460.00, 6.22);
INSERT INTO public.moon VALUES (4, 'Io', 5, 421800.00, 1821.00);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 671100.00, 1560.80);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1070400.00, 2634.30);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1882700.00, 2410.00);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1221870.00, 2576.00);
INSERT INTO public.moon VALUES (9, 'Rea', 6, 527070.00, 763.80);
INSERT INTO public.moon VALUES (10, 'Dione', 6, 377420.00, 3561.40);
INSERT INTO public.moon VALUES (11, 'Tetis', 6, 294670.00, 533.70);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 185540.00, 198.60);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 238670.00, 252.30);
INSERT INTO public.moon VALUES (14, 'Febe', 7, 12947780.00, 106.70);
INSERT INTO public.moon VALUES (15, 'Jano', 7, 151460.00, 89.50);
INSERT INTO public.moon VALUES (16, 'Helena', 7, 377420.00, 17.60);
INSERT INTO public.moon VALUES (17, 'Epimeteo', 7, 151410.00, 58.10);
INSERT INTO public.moon VALUES (18, 'Calipso', 7, 294710.00, 10.70);
INSERT INTO public.moon VALUES (19, 'Pandora', 7, 141720.00, 15.10);
INSERT INTO public.moon VALUES (20, 'Atlas', 7, 137670.00, 15.10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 1, true, 1, true);
INSERT INTO public.planet VALUES (2, 'Mercurio', 0, false, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 0, false, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, false, 1, true);
INSERT INTO public.planet VALUES (4, 'Marte', 2, false, 1, true);
INSERT INTO public.planet VALUES (6, 'Saturno', 83, false, 1, true);
INSERT INTO public.planet VALUES (7, 'Urano', 27, false, 1, true);
INSERT INTO public.planet VALUES (8, 'Neptuno', 14, false, 1, true);
INSERT INTO public.planet VALUES (9, 'Pluton', 3, false, 1, true);
INSERT INTO public.planet VALUES (10, 'Eris', 1, false, 1, true);
INSERT INTO public.planet VALUES (11, 'Alfa Centauri Cb', 0, false, 3, true);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, false, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 5, 4567.90);
INSERT INTO public.star VALUES (2, 'Alfa Centauri A', 1, 5, 5700.00);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 7, 4850.00);
INSERT INTO public.star VALUES (4, 'Zetta Puppis', 1, 1, 3202.00);
INSERT INTO public.star VALUES (5, 'Spica', 1, 6, 0.00);
INSERT INTO public.star VALUES (6, 'Alpheratz', 2, 2, NULL);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Tipo O', 'Color: Azul | Temperatura: 30000°C');
INSERT INTO public.star_type VALUES (2, 'Tipo B', 'Color: Blanco/Azul | Temperatura: 20000°C');
INSERT INTO public.star_type VALUES (3, 'Tipo A', 'Color: Blanco | Temperatura: 10000°C');
INSERT INTO public.star_type VALUES (4, 'Tipo F', 'Color: Blanco/Amarillo | Temperatura: 7000°C');
INSERT INTO public.star_type VALUES (5, 'Tipo G', 'Color: Amarillo | Temperatura: 6000°C');
INSERT INTO public.star_type VALUES (6, 'Tipo K', 'Color: Naranja | Temperatura: 4000°C');
INSERT INTO public.star_type VALUES (7, 'Tipo M', 'Color: Rojo | Temperatura: 3000°C');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_id_seq', 7, true);


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
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: star_type star_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_type_key UNIQUE (name);


--
-- Name: star fk_id_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_id_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_id_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_id_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_nearest_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_nearest_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_type_id FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--
