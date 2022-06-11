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
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    galaxy_type_id integer,
    min_diameter_ly integer,
    max_diameter_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    description text,
    name character varying,
    int_1 integer,
    int_2 integer
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    mean_rad_km integer,
    is_spherical boolean DEFAULT false NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    planet_id integer NOT NULL,
    sideral_period numeric,
    discovery_yr integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    dist_earth_au numeric(12,2),
    is_spherical boolean NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    planet_types integer NOT NULL,
    star_id integer NOT NULL,
    dist_sun_mi integer,
    dist_earth_mi integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    planet_types character varying(50) NOT NULL,
    description text,
    name character varying,
    int_1 integer,
    int_2 integer
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_from_sun_ly numeric(12,2),
    is_spherical boolean NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    galaxy_id integer NOT NULL,
    star_type_id integer,
    exo_planets integer,
    age_billion_yrs integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    star_types character varying(50) NOT NULL,
    description text,
    name character varying,
    int_1 integer,
    int_2 integer
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'typical galaxy', true, true, 1, 100000, 200000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'closest big galaxy to the Milky Way', true, false, 2, 200000, 220000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'second or third closest to Milky Way', false, false, 3, 14000, 14000);
INSERT INTO public.galaxy VALUES (5, 'Centaurus', 'closest radio galaxy to Earth', true, false, 5, 60000, 60000);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'near the Milky Way', false, false, 4, 7000, 7000);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf', 'close to the Milky Way', true, false, 6, 10000, 10000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'look like giant pinwheels', 'spiral galaxies', NULL, NULL);
INSERT INTO public.galaxy_type VALUES (2, 'barred spiral', 'have barlike buldges in the center', 'barred galaxies', NULL, NULL);
INSERT INTO public.galaxy_type VALUES (3, 'irregular', 'no single common shape', 'irregular galaxies', NULL, NULL);
INSERT INTO public.galaxy_type VALUES (4, 'dwarf irregular', 'no single common shape', 'dwarf galaxies', NULL, NULL);
INSERT INTO public.galaxy_type VALUES (5, 'elliptical', 'look like stretched-out circles', 'elliptical galaxies', NULL, NULL);
INSERT INTO public.galaxy_type VALUES (6, 'elliptical loop', 'a type of elliptical galaxy', 'elliptical-loop galaxies', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'our moon', 1738, false, false, 3, 27.32, 1609);
INSERT INTO public.moon VALUES (2, 'IO', 'innermost and third-largest of the four Galilean moons of Jupiter', 1821, false, false, 5, 1.76, 1610);
INSERT INTO public.moon VALUES (3, 'Europa', 'smallest of the four Galilean moons of Jupiter', 1560, false, false, 5, 3.55, 1610);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'the son of Tros', 2634, false, false, 5, 7.15, 1610);
INSERT INTO public.moon VALUES (5, 'Callisto', 'second largest moon after Gnymede', 2410, false, false, 5, 16.19, 1610);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'fifth largest moon of Jupiter', 84, false, false, 5, 0.50, 1892);
INSERT INTO public.moon VALUES (7, 'Himalia', 'largest irregular satelliteof Jupiter', 70, false, false, 5, 250.6, 1904);
INSERT INTO public.moon VALUES (8, 'Elara', 'prograde irregular satellite of Jupiter', 43, false, false, 5, 259.6, 1905);
INSERT INTO public.moon VALUES (9, 'Pasiphae', 'retrograde irregular satellite of Jupiter', 30, false, false, 5, 743.63, 1908);
INSERT INTO public.moon VALUES (10, 'Sinope', 'prograde irregular satellite of Jupiter', 19, false, false, 5, 758.90, 1914);
INSERT INTO public.moon VALUES (11, 'Lysithea', 'a prograde irregular satellite of Jupiter', 18, false, false, 5, 259.2, 1938);
INSERT INTO public.moon VALUES (12, 'Carme', 'a retrograde irregular satellite of Jupiter', 23, false, false, 5, 734.17, 1938);
INSERT INTO public.moon VALUES (13, 'Ananke', 'a retrograde irregular satellite of Jupiter', 14, false, false, 5, 629.77, 1938);
INSERT INTO public.moon VALUES (14, 'Leda', 'a prograde irregular satellite of Jupiter', 10, false, false, 5, 240.92, 1974);
INSERT INTO public.moon VALUES (15, 'Thebe', 'fourth of Jupiter moon by distance', 49, false, false, 5, 0.675, 1979);
INSERT INTO public.moon VALUES (16, 'Adrastea', 'smallest of the four inner moons of Jupiter', 8, false, false, 5, 0.298, 1979);
INSERT INTO public.moon VALUES (17, 'Metisa', 'inner most moon of Jupiter', 22, false, false, 5, 0.295, 1979);
INSERT INTO public.moon VALUES (18, 'Callirrhoe', 'one of Jupiter outer natural satellites', 5, false, false, 5, 758.77, 2000);
INSERT INTO public.moon VALUES (19, 'Themisto', 'small prograde  irregular satellite of Jupiter', 4, false, false, 5, 130.02, 1979);
INSERT INTO public.moon VALUES (20, 'Megaclite', 'iknown as Jupiter XIX', 3, false, false, 5, 752.86, 2000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 'sthird from the Sun', 0.00, true, true, 4, 1, 93000000, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'sixth planet from the Sun', 8.52, true, false, 1, 1, 886000000, 792248270);
INSERT INTO public.planet VALUES (7, 'Uranus', 'seventh planet from the Sun', 18.21, true, false, 5, 1, 1800000000, 1692662530);
INSERT INTO public.planet VALUES (8, 'Neptune', 'farthest from the Sun', 30.71, true, false, 5, 1, 4351, 2703);
INSERT INTO public.planet VALUES (1, 'Mercury', 'closest to the Sun', 0.61, false, false, 4, 1, 36000000, 56974146);
INSERT INTO public.planet VALUES (2, 'Venus', 'second closest to the Sun', 0.28, true, false, 4, 1, 67000000, 25724767);
INSERT INTO public.planet VALUES (4, 'Mars', 'fourth planet from the Sun', 0.52, false, false, 4, 1, 142000000, 48678219);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'fifth planet from the Sun', 4.20, true, false, 1, 1, 484000000, 390674710);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'potentially closest habitable planet to Earth', 4.24, false, false, 4, 2, 0, 0);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'potential exoplaent', 4.20, false, false, 3, 2, 0, 0);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'potential exoplaent', 4.20, false, false, 3, 2, 0, 0);
INSERT INTO public.planet VALUES (12, 'Barnard Star b', 'potential exoplanet', 6.00, false, false, 3, 4, 0, 0);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'gas giant', 'a large planet mostly composed of helium and/or hydrogen', 'gas giant', NULL, NULL);
INSERT INTO public.planet_type VALUES (2, 'Neptunian', 'exoplanets similar in size to Neptune', 'Neptunian', NULL, NULL);
INSERT INTO public.planet_type VALUES (3, 'super-Earth', 'more massive than Earth yet lighter than ice giants like Neptune and Uranus', 'super-Earth', NULL, NULL);
INSERT INTO public.planet_type VALUES (4, 'terrestrial', 'rocky planets like Earth, Mars, and Mercury ', 'terrestrial', NULL, NULL);
INSERT INTO public.planet_type VALUES (5, 'ice giant', 'a giant planet composed mainly ofheavier elements', 'ice giant', NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'home star', 0.00, false, false, 1, 6, 8, 4);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'closest know star to the Sun', 4.24, false, false, 1, 3, 3, 5);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Alpha and Proxima Centauri are a binary system', 4.37, false, false, 1, 3, 0, 5);
INSERT INTO public.star VALUES (4, 'Barnard Star', 'fourth closest to the Sun', 5.94, false, false, 1, 5, 0, 10);
INSERT INTO public.star VALUES (5, 'Wolf 359', 'In the Leo constellation', 7.90, false, false, 1, 5, 2, 0);
INSERT INTO public.star VALUES (6, 'Lalande', 'a star in the south of Ursa Major', 8.30, false, false, 1, 5, 2, 5);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'protostar', 'a collection of gas prior to star formation', 'protostar', NULL, NULL);
INSERT INTO public.star_type VALUES (2, 'T Tauri star', 'prior to becoming a main sequence star', 'T Tauri', NULL, NULL);
INSERT INTO public.star_type VALUES (3, 'main sequence star', 'young stars; majority of stars', 'main sequence', NULL, NULL);
INSERT INTO public.star_type VALUES (4, 'blue star', 'very hot and short-lived stars', 'blue stars', NULL, NULL);
INSERT INTO public.star_type VALUES (5, 'red dwarf star', 'most common stars', 'red dwarf stars', NULL, NULL);
INSERT INTO public.star_type VALUES (7, 'orange dwarf star', 'belongs to the main sequence of stars', 'orange dwarf stars', NULL, NULL);
INSERT INTO public.star_type VALUES (8, 'white dwarf star', 'exhausted all hydrogen fuel', 'white dwarf stars', NULL, NULL);
INSERT INTO public.star_type VALUES (10, 'brown dwarf star', 'failed stars', 'brown dwarf stars', NULL, NULL);
INSERT INTO public.star_type VALUES (9, 'neutron star', 'collapsed cores of massive stars', 'neutron stars', NULL, NULL);
INSERT INTO public.star_type VALUES (6, 'yellow dwarf star', 'belongs to the main sequence of stars', 'yellow dwarf star', NULL, NULL);


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
-- Name: star_type star_type_star_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_star_types_key UNIQUE (star_types);


--
-- Name: galaxy_type types_of_galaxies_galaxy_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT types_of_galaxies_galaxy_types_key UNIQUE (galaxy_types);


--
-- Name: galaxy_type types_of_galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT types_of_galaxies_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: planet_type types_of_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT types_of_planets_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type types_of_planets_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT types_of_planets_planet_types_key UNIQUE (planet_types);


--
-- Name: star_type types_of_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT types_of_stars_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--
