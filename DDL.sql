/*Добавьте в этот файл все запросы, для создания схемы данных автосалона и
 таблиц в ней в нужном порядке*/

CREATE SCHEMA IF NOT EXISTS car_shop;

CREATE TABLE IF NOT EXISTS car_shop.customer(
  customer_id           SMALLSERIAL PRIMARY KEY,
  name         TEXT NOT NULL,
  phone        TEXT NOT NULL,
  UNIQUE(name, phone)
);

CREATE TABLE IF NOT EXISTS car_shop.country(
  country_id    SMALLSERIAL PRIMARY KEY NOT NULL, 
  name  TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS car_shop.color(
  color_id    SMALLSERIAL PRIMARY KEY,
  name  TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS car_shop.brand(
  brand_id    SMALLSERIAL PRIMARY KEY NOT NULL,
  name        TEXT NOT NULL,
  country_id  SMALLINT REFERENCES car_shop.country(country_id)
);

CREATE TABLE IF NOT EXISTS car_shop.model(
  model_id                SMALLSERIAL PRIMARY KEY NOT NULL,
  brand_id              SMALLINT NOT NULL REFERENCES car_shop.brand(brand_id),
  model_name            TEXT NOT NULL,
  gasoline_consumption  TEXT
);

CREATE TABLE IF NOT EXISTS car_shop.car(
  car_id          SMALLSERIAL PRIMARY KEY NOT NULL,
  model_id     SMALLINT NOT NULL REFERENCES car_shop.model (model_id),
  color_id    SMALLINT NOT NULL REFERENCES car_shop.color (color_id),
  UNIQUE (model_id, color_id)
);

CREATE TABLE IF NOT EXISTS car_shop.invoice(
  order_id    SMALLSERIAL PRIMARY KEY NOT NULL,
  car_id      SMALLINT NOT NULL REFERENCES car_shop.car(car_id),
  customer_id SMALLINT   NOT NULL REFERENCES car_shop.customer (customer_id),
  invoice_date    DATE       NOT NULL,
  price       NUMERIC(9,2) NOT NULL,
  discount    SMALLINT   default 0  
);
