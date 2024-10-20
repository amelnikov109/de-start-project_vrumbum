/*добавьте сюда запрос для решения задания 3*/
SELECT EXTRACT(MONTH FROM CAST(i.invoice_date AS timestamp)) AS month,
     EXTRACT(YEAR FROM CAST(i.invoice_date AS timestamp)) AS year,
     ROUND(AVG(price), 2) AS price_avg
  FROM car_shop.invoice i
  WHERE EXTRACT (YEAR FROM CAST(i.invoice_date AS timestamp)) = '2022'
  GROUP BY month, year
  ORDER BY month
 ;
