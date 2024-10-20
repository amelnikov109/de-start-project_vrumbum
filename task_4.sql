/*добавьте сюда запрос для решения задания 4*/
SELECT c.name AS person,
     STRING_AGG(CONCAT(b.name, ' ', m.model_name), ', ') AS cars
  FROM car_shop.invoice i
   JOIN car_shop.car USING(car_id)
   JOIN car_shop.model m USING(model_id)
   JOIN car_shop.brand b USING(brand_id)
   JOIN car_shop.customer c USING(customer_id)
  GROUP BY person
  ORDER BY person
 ;
