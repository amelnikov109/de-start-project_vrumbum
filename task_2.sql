/*добавьте сюда запрос для решения задания 2*/
SELECT b.name,
     EXTRACT(YEAR FROM CAST(i.invoice_date AS timestamp)) AS year,
     ROUND(avg(i.price),2) AS price_avg
  FROM car_shop.invoice i
   JOIN car_shop.car c USING(car_id)
   JOIN car_shop.model m USING(model_id)
   JOIN car_shop.brand b USING(brand_id)
  GROUP BY year, name
  ORDER BY b.name, year
;
