/*добавьте сюда запрос для решения задания 6*/
SELECT COUNT(customer_id) AS persons_from_usa_count 
  FROM car_shop.customer
  WHERE phone LIKE '+1%'
  ;
