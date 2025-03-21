-- Table: public.foodbalances

-- DROP TABLE IF EXISTS public.foodbalances;

CREATE TABLE IF NOT EXISTS public.foodbalances
(
    area_code integer,
    area text COLLATE pg_catalog."default",
    item_code integer,
    item text COLLATE pg_catalog."default",
    element_code integer,
    element text COLLATE pg_catalog."default",
    unit text COLLATE pg_catalog."default",
    year_2020 double precision,
    year_2021 double precision,
    year_2022 double precision,
    year_2023 double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.foodbalances
    OWNER to postgres;