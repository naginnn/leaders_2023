begin;

drop table if exists for_model;
drop view if exists data_to_model;
drop view if exists building_v;

CREATE VIEW building_v AS SELECT
    o.id,
    a.address, -- полный адрес
    a.u, -- улица
    a.d, -- дом
    a.k, -- корпус
    a.s, -- строеник
    a.soor, -- координата
    o.unom,
    o.col_781_id,
    o.col_775_id,
    o.col_772,
    o.col_771,
    o.col_770_id,
    o.col_769_id,
    o.col_767,
    o.col_766,
    o.col_765,
    o.col_764,
    o.col_763,
    o.col_762,
    o.col_761,
    o.col_760,
    o.col_759,
    o.col_758_id,
    o.col_757,
    o.col_756,
    o.col_755,
    o.col_754,
    o.col_3468,
    o.col_3363,
    o.col_3243_id,
    o.col_3163_id,
    o.col_2463_id,
    o.col_2156_id,
    o.col_103506_id
FROM object o
join address a on o.unom = a.id
WHERE o.col_2463_id = 42875644 AND o.col_3163_id = 58761330;

--вью для забора сырых данных для модели
CREATE VIEW data_to_model AS
SELECT w.work_type_id,
    o.unom,
    o.col_754,
    o.col_755,
    o.col_756,
    o.col_757,
    o.col_758_id,
    o.col_759,
    o.col_760,
    o.col_761,
    o.col_762,
    o.col_763,
    o.col_764,
    o.col_765,
    o.col_766,
    o.col_767,
    o.col_769_id,
    o.col_770_id,
    o.col_771,
    o.col_772,
    o.col_775_id,
    o.col_781_id,
    o.col_2156_id,
    o.col_2463_id,
    o.col_3163_id,
    o.col_3243_id,
    o.col_3363,
    o.col_103506_id
FROM object o
LEFT JOIN work w ON o.unom = w.unom
WHERE o.col_2463_id = 42875644 AND o.col_3163_id = 58761330;

commit ;