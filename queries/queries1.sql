-- generally for more workers the more the data of the RAM of the container of the coordinator is split between the workers but overall ram used is increased
-- show the top 100 customers by total sales
-- customer, web_sales
--1pp
-- postgres,postgres
SELECT 
    c.c_customer_id, 
    c.c_first_name, 
    c.c_last_name, 
    COUNT(ws.ws_order_number) AS total_orders,
    SUM(ws.ws_sales_price) AS total_sales
FROM postgres.public.web_sales ws
JOIN postgres.public.customer c 
    ON ws.ws_bill_customer_sk = c.c_customer_sk
GROUP BY c.c_customer_id, c.c_first_name, c.c_last_name
ORDER BY total_sales DESC
LIMIT 100;
--2 workers
--1st run
--  Splits:179
--  Time:1.26m 
--  Memory 2.18G
--2nd run
-- Splits: 179
-- Time:39.5s
-- Memory:1.23GB
--3rd run
-- Splits: 179
-- Time: 37.2s
-- Memory: 1.20GB
--4th run
-- Splits: 179
-- Time: 37.8s
-- Memory: 1.20GB


-- mongodb, mongodb
SELECT 
    c.c_customer_id, 
    c.c_first_name, 
    c.c_last_name, 
    COUNT(ws.ws_order_number) AS total_orders,
    SUM(ws.ws_sales_price) AS total_sales
FROM mongodb.tpcds.web_sales ws
JOIN mongodb.tpcds.customer c 
    ON ws.ws_bill_customer_sk = c.c_customer_sk
GROUP BY c.c_customer_id, c.c_first_name, c.c_last_name
ORDER BY total_sales DESC
limit 100
--2 workers
-- 1st run
--  Splits: 179  0  0
--  Time 1.30m  
--  Memory 2.34G

-- 2ond run
--  Splits: 179 
-- Time 46.4s
--  Memory 1.47G



-- cassandra, cassandra
SELECT 
    c.c_customer_id, 
    c.c_first_name, 
    c.c_last_name, 
    COUNT(ws.ws_order_number) AS total_orders,
    SUM(ws.ws_sales_price) AS total_sales
FROM cassandra.tpcds.web_sales ws
JOIN cassandra.tpcds.customer c 
    ON ws.ws_bill_customer_sk = c.c_customer_sk
GROUP BY c.c_customer_id, c.c_first_name, c.c_last_name
ORDER BY total_sales DESC
limit 100
---1 worker
-- 1st run
--  Splits: 409
--  Time 3:02m
--  Memory 371Mb

-- 2nd run
-- Splits: 409
-- Time 2:17m
-- Memory 347Mb

-- 3rd run
-- Splits: 409
-- Time 1:59m
-- Memory 329Mb

-- 4th run
-- Splits: 409
-- Time 1:58m
-- Memory 326Mb


----- 2 workers
-- 1st run
--  Splits: 489
--  Time 2:40m
--  Memory 754M

-- 2nd run
--  Splits: 489
-- Time 2:04m
-- Memory 613M

-- 3rd run
-- Splits: 489
-- Time 2:03m
-- Memory 607M

-- 4rth run
-- Splits: 489
-- Time 2:36m
-- Memory 753M !!! close to first time


--- 4 workers

-- 1st run
-- Splits: 649
-- Time 3:25m
-- Memory 1.49G

-- 2nd run
-- Splits: 649
-- Time 2:27m
-- Memory 1.3G

-- 3rd run
-- Splits: 649
-- Time 2:10m
-- Memory 1.18G

-- 4th run
-- Splits: 649
-- Time 2:31m
-- Memory 1.37G


-- postgres, mongodb
SELECT 
    c.c_customer_id, 
    c.c_first_name, 
    c.c_last_name, 
    COUNT(ws.ws_order_number) AS total_orders,
    SUM(ws.ws_sales_price) AS total_sales
FROM postgres.public.web_sales ws
JOIN mongodb.tpcds.customer c 
    ON ws.ws_bill_customer_sk = c.c_customer_sk
GROUP BY c.c_customer_id, c.c_first_name, c.c_last_name
ORDER BY total_sales DESC
limit 100
---- to container tou coordinator ayjanei gb ta alla ligo
---- 1 worker
-- 1st run
-- Splits: 99
-- Time 1:40m
-- Memory 3.35G

-- 2nd run
-- Splits: 99
-- Time 1:01m
-- Memory 2.50G

-- 3rd run
-- Splits: 99
-- Time 49s
-- Memory 2.06G asd asd

-- 4th run
-- Splits: 99
-- Time 41s
-- Memory 1.86G

---- 2 workers
-- 1st run
-- Splits: 179
-- Time 1:44m
-- Memory 2.72G

-- 2nd run
-- Splits: 179
-- Time 49s
-- Memory 1.61G

-- 3rd run
-- Splits: 179
-- Time 33.7s
-- Memory 1.08G

-- 4th run
-- Splits: 179
-- Time 34.7s
-- Memory 1.24G

-- 4 workers
-- 1st run
-- Splits: 339
-- Time 1:30m
-- Memory 2.43G

-- 2nd run
-- Splits: 339
-- Time 49s
-- Memory 1.57G

-- 3rd run
-- Splits: 339
-- Time 36s
-- Memory 1.19G

-- 4th run
-- Splits: 339
-- Time 34s
-- Memory 1.15G


-- mongodb, postgres
SELECT 
    c.c_customer_id, 
    c.c_first_name, 
    c.c_last_name, 
    COUNT(ws.ws_order_number) AS total_orders,
    SUM(ws.ws_sales_price) AS total_sales
FROM mongodb.tpcds.web_sales ws
JOIN postgres.public.customer c 
    ON ws.ws_bill_customer_sk = c.c_customer_sk
GROUP BY c.c_customer_id, c.c_first_name, c.c_last_name
ORDER BY total_sales DESC
limit 100

-- 1 worker
-- 1st run
-- Splits: 99
-- Time 1:31m
-- Memory 2.81G

-- 2nd run
-- Splits: 99
-- Time 59s
-- Memory 1.99G

-- 3rd run
-- Splits: 99
-- Time 54s
-- Memory 1.91G

-- 4th run
-- Splits: 99
-- Time 41.8s
-- Memory 1.53G

---- 2 workers
-- 1st run
-- Splits: 179
-- Time 1:28m
-- Memory 2.27G

-- 2nd run
-- Splits: 179
-- Time 58s
-- Memory 1.16G

-- 3rd run
-- Splits: 179
-- Time 40s
-- Memory 1.18G

-- 4th run
--- cooordinator exceeeded memory limit of 7 GB

-- 4 workers
-- 1st run
-- Splits: 339
-- Time 1:46m
-- Memory 3.04G

-- 2nd run
-- Splits: 339
-- Time 55.8s
-- Memory 1.79G

-- 3rd run
-- Total ram used crashed the pc




-- cassandra, postgres !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! make the oposite
SELECT 
    c.c_customer_id, 
    c.c_first_name, 
    c.c_last_name, 
    COUNT(ws.ws_order_number) AS total_orders,
    SUM(ws.ws_sales_price) AS total_sales
FROM cassandra.tpcds.web_sales ws
JOIN postgres.public.customer c 
    ON ws.ws_bill_customer_sk = c.c_customer_sk
GROUP BY c.c_customer_id, c.c_first_name, c.c_last_name
ORDER BY total_sales DESC
limit 100

-- 1 worker
-- 1st run
-- Splits: 393
-- Time 3:16m
-- Memory 12.8G

-- 2nd run
-- Splits: 393
-- Time 2:34m
-- Memory 12.0G

-- 3rd run
-- Splits: 393
-- Time 2:20m
-- Memory 11.1G

-- 4th run
-- Splits: 393
-- Time 2:15m
-- Memory 10.6G


-- 2 worker

-- crashes the pc

-- 747f8e7bc9ec   coordinator   7.57%     4.029GiB / 7GiB       57.56%    940MB / 8.7MB    47MB / 6.11MB     261
-- 6f94a2a351de   cassandra     1.66%     4.362GiB / 15.49GiB   28.16%    2.47MB / 750MB   1.43GB / 22.7MB   92
-- 9f8a1931563e   postgres      0.00%     60.58MiB / 15.49GiB   0.38%     1.31MB / 188MB   226MB / 303kB     6







