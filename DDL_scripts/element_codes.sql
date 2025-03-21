-- Table: public.element_codes

-- DROP TABLE IF EXISTS public.element_codes;

CREATE TABLE IF NOT EXISTS public.element_codes
(
    element_code integer NOT NULL,
    element text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT unique_element_codes_constraint PRIMARY KEY (element_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.element_codes
    OWNER to postgres;