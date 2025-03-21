-- auto-generated definition
create table trade_cle_trade_matrix_2
(
    reporter_area      text,
    reporter_area_code integer,
    partner_area       text,
    partner_area_code  integer,
    item               text,
    item_code          integer,
    element            text,
    element_code       integer,
    unit               text,
    year_2020          double precision,
    year_2021          double precision,
    year_2022          double precision,
    year_2023          double precision
);

alter table trade_cle_trade_matrix_2
    owner to postgres;

