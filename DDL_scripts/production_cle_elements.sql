-- Table: public.production_cle_elements

-- DROP TABLE IF EXISTS public.production_cle_elements;

CREATE TABLE IF NOT EXISTS public.production_cle_elements
(
    element_code integer,
    element text COLLATE pg_catalog."default",
    CONSTRAINT unique_element_constraint UNIQUE (element_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.production_cle_elements
    OWNER to postgres;