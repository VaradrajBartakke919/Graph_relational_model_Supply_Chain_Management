-- Table: public.production_cle_area_code

-- DROP TABLE IF EXISTS public.production_cle_area_code;

CREATE TABLE IF NOT EXISTS public.production_cle_area_code
(
    area_code integer,
    area text COLLATE pg_catalog."default",
    CONSTRAINT unique_area_code_constraint UNIQUE (area_code, area)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.production_cle_area_code
    OWNER to postgres;