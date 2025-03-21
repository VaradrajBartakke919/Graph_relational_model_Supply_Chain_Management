-- Table: public.item_codes

-- DROP TABLE IF EXISTS public.item_codes;

CREATE TABLE IF NOT EXISTS public.item_codes
(
    item_code integer NOT NULL,
    item text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT item_codes_pkey PRIMARY KEY (item_code),
    CONSTRAINT item_codes_item_key UNIQUE (item),
    CONSTRAINT unique_item_codes_constraint UNIQUE (item_code, item)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.item_codes
    OWNER to postgres;