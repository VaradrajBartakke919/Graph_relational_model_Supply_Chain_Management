-- Table: public.production_cle_item_code

-- DROP TABLE IF EXISTS public.production_cle_item_code;

CREATE TABLE IF NOT EXISTS public.production_cle_item_code
(
    item_code integer,
    item text COLLATE pg_catalog."default",
    CONSTRAINT unique_item_constraint UNIQUE (item_code, item)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.production_cle_item_code
    OWNER to postgres;