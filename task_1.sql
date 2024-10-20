/*добавьте сюда запрос для решения задания 1*/
SELECT 
	(COUNT(*) FILTER (WHERE gasoline_consumption is NULL)::REAL / COUNT(*) * 100)::NUMERIC(4, 2) as nulls_percentage_gasoline_consumption
  FROM car_shop.model
 ;
