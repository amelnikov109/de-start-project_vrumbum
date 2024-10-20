/*добавьте сюда запрос для решения задания 5*/
SELECT c.name AS brand_origin,
     MIN(price / (1 - discount::REAL/100))::NUMERIC(9,2) AS price_min2,
     MAX(price / (1 - discount::REAL/100))::NUMERIC(9,2) AS price_max2
  FROM car_shop.invoice i 
   JOIN car_shop.car USING(car_id)
   JOIN car_shop.model m USING(model_id)
   JOIN car_shop.brand b using(brand_id)
   LEFT JOIN car_shop.country c USING(country_id)
  GROUP BY c.name
  ORDER BY c.name ASC
 ;
