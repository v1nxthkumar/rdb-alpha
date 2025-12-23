--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period_years integer NOT NULL,
    is_periodic boolean NOT NULL,
    notes text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_millions integer NOT NULL,
    has_life boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    is_habitable boolean NOT NULL,
    composition text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    radius_km integer NOT NULL,
    has_rings boolean NOT NULL,
    atmosphere text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    mass numeric(6,2),
    is_main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 76, true, 'Famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533, false, 'Bright in 1997');
INSERT INTO public.comet VALUES (3, 'Encke', 3, true, 'Short-period comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, true, 'Home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, false, 'Nearest large galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, false, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 9000, false, 'Bright nucleus');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 11000, false, 'Interacting galaxy');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 8000, false, 'Ring-shaped galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, false, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Io', 6, 3643, false, 'Volcanic');
INSERT INTO public.moon VALUES (5, 'Europa', 6, 3122, true, 'Ice');
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 5268, false, 'Ice and rock');
INSERT INTO public.moon VALUES (7, 'Callisto', 6, 4821, false, 'Ice');
INSERT INTO public.moon VALUES (8, 'Moon A', 5, 3000, false, 'Unknown');
INSERT INTO public.moon VALUES (9, 'Moon B', 5, 2800, false, 'Unknown');
INSERT INTO public.moon VALUES (10, 'Moon C', 7, 1500, false, 'Rocky');
INSERT INTO public.moon VALUES (11, 'Moon D', 7, 1600, false, 'Rocky');
INSERT INTO public.moon VALUES (12, 'Moon E', 8, 4100, true, 'Ice');
INSERT INTO public.moon VALUES (13, 'Moon F', 8, 3900, false, 'Ice');
INSERT INTO public.moon VALUES (14, 'Moon G', 9, 2100, false, 'Rocky');
INSERT INTO public.moon VALUES (15, 'Moon H', 9, 2200, false, 'Rocky');
INSERT INTO public.moon VALUES (16, 'Moon I', 10, 1800, false, 'Dust');
INSERT INTO public.moon VALUES (17, 'Moon J', 10, 1700, false, 'Dust');
INSERT INTO public.moon VALUES (18, 'Moon K', 11, 2500, true, 'Ice');
INSERT INTO public.moon VALUES (19, 'Moon L', 11, 2400, false, 'Ice');
INSERT INTO public.moon VALUES (20, 'Moon M', 12, 5000, false, 'Dense rock');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, false, 'Thin exosphere');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052, false, 'Thick CO2');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, false, 'Nitrogen-Oxygen');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3389, false, 'Thin CO2');
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 7160, false, 'Unknown');
INSERT INTO public.planet VALUES (6, 'Sirius I', 3, 5000, true, 'Hydrogen');
INSERT INTO public.planet VALUES (7, 'Sirius II', 3, 6200, false, 'Helium');
INSERT INTO public.planet VALUES (8, 'Andromeda I', 4, 7000, true, 'Dense gases');
INSERT INTO public.planet VALUES (9, 'Andromeda II', 4, 6800, false, 'Methane');
INSERT INTO public.planet VALUES (10, 'Triangulum I', 5, 4500, false, 'Thin');
INSERT INTO public.planet VALUES (11, 'Triangulum II', 5, 4700, true, 'Unknown');
INSERT INTO public.planet VALUES (12, 'Sombrero I', 6, 8000, true, 'Heavy atmosphere');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.00, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3042, 0.12, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9940, 2.02, true);
INSERT INTO public.star VALUES (4, 'Andromeda A', 2, 6200, 1.10, true);
INSERT INTO public.star VALUES (5, 'Triangulum X', 3, 4800, 0.90, true);
INSERT INTO public.star VALUES (6, 'Sombrero Prime', 4, 7000, 1.50, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

