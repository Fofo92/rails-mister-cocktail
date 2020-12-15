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

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: cocktails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cocktails (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: cocktails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cocktails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cocktails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cocktails_id_seq OWNED BY public.cocktails.id;


--
-- Name: doses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doses (
    id bigint NOT NULL,
    description character varying,
    cocktail_id bigint NOT NULL,
    ingredient_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: doses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.doses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: doses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.doses_id_seq OWNED BY public.doses.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ingredients (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: cocktails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cocktails ALTER COLUMN id SET DEFAULT nextval('public.cocktails_id_seq'::regclass);


--
-- Name: doses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doses ALTER COLUMN id SET DEFAULT nextval('public.doses_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cocktails cocktails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cocktails
    ADD CONSTRAINT cocktails_pkey PRIMARY KEY (id);


--
-- Name: doses doses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doses
    ADD CONSTRAINT doses_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_doses_on_cocktail_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_doses_on_cocktail_id ON public.doses USING btree (cocktail_id);


--
-- Name: index_doses_on_ingredient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_doses_on_ingredient_id ON public.doses USING btree (ingredient_id);


--
-- Name: doses fk_rails_48b6f209c2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doses
    ADD CONSTRAINT fk_rails_48b6f209c2 FOREIGN KEY (cocktail_id) REFERENCES public.cocktails(id);


--
-- Name: doses fk_rails_961afcf26a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doses
    ADD CONSTRAINT fk_rails_961afcf26a FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20201212083830'),
('20201212084641'),
('20201212084727');


