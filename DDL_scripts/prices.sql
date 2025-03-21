-- Table: public.prices

-- DROP TABLE IF EXISTS public.prices;

CREATE TABLE IF NOT EXISTS public.prices
(
    area_code integer NOT NULL,
    area text COLLATE pg_catalog."default",
    item_code integer NOT NULL,
    item text COLLATE pg_catalog."default",
    element text COLLATE pg_catalog."default",
    element_code integer NOT NULL,
    unit text COLLATE pg_catalog."default",
    year_2020 double precision,
    year_2021 double precision,
    year_2022 double precision,
    year_2023 double precision,
    CONSTRAINT prices_pkey PRIMARY KEY (area_code, item_code, element_code),
    CONSTRAINT prices_area_code_fkey FOREIGN KEY (area_code)
        REFERENCES public.area_codes (area_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT prices_element_code_fkey FOREIGN KEY (element_code)
        REFERENCES public.element_codes (element_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT prices_item_code_fkey FOREIGN KEY (item_code)
        REFERENCES public.item_codes (item_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.prices
    OWNER to postgres;