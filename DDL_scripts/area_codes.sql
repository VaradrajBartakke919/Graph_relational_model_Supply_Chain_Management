-- Table: public.area_codes

-- DROP TABLE IF EXISTS public.area_codes;

CREATE TABLE IF NOT EXISTS public.area_codes
(
    area_code integer NOT NULL,
    area text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT area_codes_pkey PRIMARY KEY (area_code),
    CONSTRAINT area_codes_area_key UNIQUE (area),
    CONSTRAINT unique_area_codes_constraint UNIQUE (area_code, area)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.area_codes
    OWNER to postgres;