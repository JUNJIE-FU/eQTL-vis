--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: zmap_eqtlviz_b73_gene; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_eqtlviz_b73_gene (
    gencodeid character varying(32),
    chromosome character varying(16),
    gstart integer,
    gend integer,
    strand character varying(2),
    tss integer,
    genesymbol character varying(128),
    genesymbolupper character varying(128),
    genetype character varying(32),
    description character varying(128),
    genomebuild character varying(8),
    datasource character varying(16),
    entrezgeneid character varying(128),
    gencodeversion character varying(8),
    genestatus character varying(16)
);


ALTER TABLE public.zmap_eqtlviz_b73_gene OWNER TO tripal;

--
-- Name: TABLE zmap_eqtlviz_b73_gene; Type: COMMENT; Schema: public; Owner: tripal
--

COMMENT ON TABLE public.zmap_eqtlviz_b73_gene IS 'The table used for store b73 eqtl gene info';


--
-- Name: zmap_eqtlviz_b73_snp; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_eqtlviz_b73_snp (
    gene character varying(32),
    snpid character varying(32),
    beta real,
    pvalue double precision
);


ALTER TABLE public.zmap_eqtlviz_b73_snp OWNER TO tripal;

--
-- Name: TABLE zmap_eqtlviz_b73_snp; Type: COMMENT; Schema: public; Owner: tripal
--

COMMENT ON TABLE public.zmap_eqtlviz_b73_snp IS 'The table used for store b73 eqtl snp data';


--
-- Name: zmap_eqtlviz_sk_gene; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_eqtlviz_sk_gene (
    gencodeid character varying(32),
    chromosome character varying(16),
    gstart integer,
    gend integer,
    strand character varying(2),
    tss integer,
    genesymbol character varying(128),
    genesymbolupper character varying(128),
    genetype character varying(32),
    description character varying(128),
    genomebuild character varying(8),
    datasource character varying(16),
    entrezgeneid character varying(128),
    gencodeversion character varying(8),
    genestatus character varying(16)
);


ALTER TABLE public.zmap_eqtlviz_sk_gene OWNER TO tripal;

--
-- Name: TABLE zmap_eqtlviz_sk_gene; Type: COMMENT; Schema: public; Owner: tripal
--

COMMENT ON TABLE public.zmap_eqtlviz_sk_gene IS 'The table used for store sk eqtl gene info';


--
-- Name: zmap_eqtlviz_sk_snp; Type: TABLE; Schema: public; Owner: tripal
--

CREATE TABLE public.zmap_eqtlviz_sk_snp (
    gene character varying(32),
    snpid character varying(32),
    beta real,
    pvalue double precision
);


ALTER TABLE public.zmap_eqtlviz_sk_snp OWNER TO tripal;

--
-- Name: TABLE zmap_eqtlviz_sk_snp; Type: COMMENT; Schema: public; Owner: tripal
--

COMMENT ON TABLE public.zmap_eqtlviz_sk_snp IS 'The table used for store sk eqtl snp data';


--
-- Name: zmap_eqtlviz_tissue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zmap_eqtlviz_tissue (
    dataset_id character varying(32),
    egene_count integer,
    expressed_gene_count integer,
    has_egenes smallint,
    rna_seq_and_genotype_sample_count integer,
    rna_seq_sample_count integer,
    tissue_site_detail_id character varying(32)
);


ALTER TABLE public.zmap_eqtlviz_tissue OWNER TO tripal;


--
-- Name: zmap_eqtlviz_b73_gene_gencodeid; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_eqtlviz_b73_gene_gencodeid ON public.zmap_eqtlviz_b73_gene USING btree (gencodeid);


--
-- Name: zmap_eqtlviz_b73_snp_gene; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_eqtlviz_b73_snp_gene ON public.zmap_eqtlviz_b73_snp USING btree (gene);


--
-- Name: zmap_eqtlviz_sk_gene_gencodeid; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_eqtlviz_sk_gene_gencodeid ON public.zmap_eqtlviz_sk_gene USING btree (gencodeid);


--
-- Name: zmap_eqtlviz_sk_snp_gene; Type: INDEX; Schema: public; Owner: tripal
--

CREATE INDEX zmap_eqtlviz_sk_snp_gene ON public.zmap_eqtlviz_sk_snp USING btree (gene);


--
-- PostgreSQL database dump complete
--
