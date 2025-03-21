-- Table: public.trade_cle_trade_matrix

-- DROP TABLE IF EXISTS public.trade_cle_trade_matrix;

CREATE TABLE IF NOT EXISTS public.trade_cle_trade_matrix
(
    reporter_area text COLLATE pg_catalog."default",
    reporter_area_code integer,
    partner_area text COLLATE pg_catalog."default",
    partner_area_code integer,
    item text COLLATE pg_catalog."default",
    item_code integer,
    element text COLLATE pg_catalog."default",
    element_code integer,
    unit text COLLATE pg_catalog."default",
    year_2020 double precision,
    year_2021 double precision,
    year_2022 double precision,
    year_2023 double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.trade_cle_trade_matrix
    OWNER to postgres;