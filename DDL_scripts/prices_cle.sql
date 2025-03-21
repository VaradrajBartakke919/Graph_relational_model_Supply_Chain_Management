-- Table: public.price_cle

-- DROP TABLE IF EXISTS public.price_cle;

CREATE TABLE IF NOT EXISTS public.price_cle
(
    area text COLLATE pg_catalog."default",
    area_code integer,
    item text COLLATE pg_catalog."default",
    item_code integer,
    element text COLLATE pg_catalog."default",
    element_code integer,
    unit text COLLATE pg_catalog."default",
    y2020 double precision,
    y2021 double precision,
    y2022 double precision,
    y2023 double precision,
    y1991 double precision,
    y1992 double precision,
    y1993 double precision,
    y1994 double precision,
    y1995 double precision,
    y1996 double precision,
    y1997 double precision,
    y1998 double precision,
    y1999 double precision,
    y2000 double precision,
    y2001 double precision,
    y2002 double precision,
    y2003 double precision,
    y2004 double precision,
    y2005 double precision,
    y2006 double precision,
    y2007 double precision,
    y2008 double precision,
    y2009 double precision,
    y2010 double precision,
    y2011 double precision,
    y2012 double precision,
    y2013 double precision,
    y2014 double precision,
    y2015 double precision,
    y2016 double precision,
    y2017 double precision,
    y2018 double precision,
    y2019 double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.price_cle
    OWNER to postgres;