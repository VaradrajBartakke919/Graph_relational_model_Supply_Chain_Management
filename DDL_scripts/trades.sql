-- Table: public.trades

-- DROP TABLE IF EXISTS public.trades;

CREATE TABLE IF NOT EXISTS public.trades
(
    reporter_area_code integer NOT NULL,
    reporter_area text COLLATE pg_catalog."default",
    partner_area_code integer NOT NULL,
    partner_area text COLLATE pg_catalog."default",
    item_code integer NOT NULL,
    item text COLLATE pg_catalog."default",
    element_code integer NOT NULL,
    element text COLLATE pg_catalog."default",
    unit text COLLATE pg_catalog."default",
    year_2020 double precision,
    year_2021 double precision,
    year_2022 double precision,
    year_2023 double precision,
    CONSTRAINT trades_pkey PRIMARY KEY (reporter_area_code, partner_area_code, item_code, element_code),
    CONSTRAINT trades_element_code_fkey FOREIGN KEY (element_code)
        REFERENCES public.element_codes (element_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT trades_item_code_fkey FOREIGN KEY (item_code)
        REFERENCES public.item_codes (item_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT trades_partner_area_code_fkey FOREIGN KEY (partner_area_code)
        REFERENCES public.area_codes (area_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT trades_reporter_area_code_fkey FOREIGN KEY (reporter_area_code)
        REFERENCES public.area_codes (area_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.trades
    OWNER to postgres;