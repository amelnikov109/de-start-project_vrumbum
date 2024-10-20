/*Добавьте в этот файл запросы, которые наполняют данными таблицы в схеме автосалона*/

INSERT INTO car_shop.customer(name, phone)
  SELECT DISTINCT person_name,
     phone
    FROM raw_data.sales
;

INSERT INTO car_shop.country(name)
SELECT DISTINCT brand_origin
  FROM raw_data.sales
  WHERE brand_origin IS NOT null 
;  

INSERT INTO car_shop.color(name)
  SELECT DISTINCT split_part(auto, ', ', 2) AS name
  	FROM raw_data.sales
;

INSERT INTO car_shop.brand(name, country_id)
SELECT DISTINCT SPLIT_PART(s.auto, ' ', 1),
	  c.country_id
  FROM raw_data.sales s
  LEFT JOIN car_shop.country  c 
  ON c.name = s.brand_origin
;

INSERT INTO car_shop.model(brand_id, model_name, gasoline_consumption)
SELECT DISTINCT b.brand_id,
     substr(s.auto, strpos(auto, ' '), strpos(s.auto, ',') - strpos(s.auto, ' ')) as model_name,
     s.gasoline_consumption
  FROM raw_data.sales s
  INNER JOIN car_shop.brand b 
  ON b.name = SPLIT_PART(s.auto, ' ', 1)
;

INSERT INTO car_shop.car(model_id, color_id) 
SELECT DISTINCT m.model_id, c.color_id
  FROM raw_data.sales s, car_shop.brand b, car_shop.color c, car_shop.model m 
  WHERE m.brand_id = b.brand_id
    AND b.name = SPLIT_PART(s.auto, ' ', 1)
    AND m.model_name = substr(s.auto, strpos(auto, ' '), strpos(s.auto, ',') - strpos(s.auto, ' '))
    AND c.name = SPLIT_PART(s.auto, ', ', 2)
;

INSERT INTO car_shop.invoice(car_id, customer_id, invoice_date, price, discount)
SELECT c.car_id,
     cu.customer_id,
     s.date,
     s.price,
     s.discount
  FROM raw_data.sales s, car_shop.brand b, car_shop.car c, car_shop.color co, car_shop.model m, car_shop.customer cu   
  WHERE m.brand_id = b.brand_id
    AND b.name = SPLIT_PART(s.auto, ' ', 1)
    AND m.model_name = substr(s.auto, strpos(auto, ' '), strpos(s.auto, ',') - strpos(s.auto, ' '))
    AND co.name = SPLIT_PART(s.auto, ', ', 2)
    AND cu.phone = s.phone
    AND c.model_id = m.model_id 
    AND c.color_id = co.color_id 
;


