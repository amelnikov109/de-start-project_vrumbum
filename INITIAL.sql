/*сохраните в этом файле запросы для первоначальной загрузки данных - создание схемы raw_data и таблицы sales и наполнение их данными из csv файла*/

create schema if not exists raw_data;
create table if not exists raw_data.sales
(
    id                      integer,
    auto                    text,
    gasoline_consumption    text,
    price                   numeric(9,2),
    date                    date,
    person_name             text,
    phone                   text,
    discount                smallint default 0,
    brand_origin            text
);

copy raw_data.sales from 'C:\Temp\cars.csv' with csv header null 'null';
