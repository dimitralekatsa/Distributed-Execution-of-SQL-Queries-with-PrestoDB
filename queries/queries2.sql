--cassandra
SELECT *
FROM cassandra.tpcds.web_sales ws
limit 100

-- 1 worker
-- 1st run
-- Splits: 21
-- Time: 8.72s
-- Memory: 0

-- 2nd run
-- Splits: 21
-- Time: 3.78s
-- Memory: 0

-- 3rd run
-- Splits: 21
-- Time: 1.78s
-- Memory: 0

-- 4th run
-- Splits: 21
-- Time: 1.78s
-- Memory: 0

-- 2 workers
-- 1st run
-- Splits: 19
-- Time: 1.49s
-- Memory: 0

-- 2nd run
-- Splits: 19
-- Time: 1.43s
-- Memory: 0

-- 3rd run
-- Splits: 19
-- Time: 1.39s
-- Memory: 0

-- 4th run
-- Splits: 19
-- Time: 1.38s
-- Memory: 0


-- 4 workers
-- 1st run
-- Splits: 20
-- Time: 7.09s
-- Memory: 0

-- 2nd run
-- Splits: 20
-- Time: 2.6s
-- Memory: 0

-- 3rd run
-- Splits: 20
-- Time: 1.97s
-- Memory: 0

-- 4th run
-- Splits: 20
-- Time: 1.56s
-- Memory: 0














-- postgres
SELECT *
FROM postgres.public.web_sales ws
limit 100

-- 1 worker
-- 1st run
-- Splits: 18
-- Time: 2.88s
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 1.47s
-- Memory: 0

-- 3rd run
-- Splits: 18
-- Time: 1.29s
-- Memory: 0

-- 4th run
-- Splits: 18
-- Time: 1.25s
-- Memory: 0

-- 2 workers
-- 1st run
-- Splits: 18
-- Time: 97ms
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 95ms
-- Memory: 0

-- 3rd run
-- Splits: 18
-- Time: 78ms
-- Memory: 0

-- 4th run
-- Splits: 18
-- Time: 81ms
-- Memory: 0


-- 4 workers
-- 1st run
-- Splits: 18
-- Time: 2.62s

-- 2nd run
-- Splits: 18
-- Time: 0.939s
-- Memory: 0

-- 3rd run
-- Splits: 18
-- Time: 0.8s
-- Memory: 0

-- 4th run
-- Splits: 18
-- Time: 1.03s
-- Memory: 0


-- mongo
SELECT *
FROM mongodb.tpcds.web_sales ws
limit 100


-- 1 worker
-- 1st run
-- Splits: 18
-- Time: 4.27s
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 20.7s
-- Memory: 0

-- 3rd run
-- Splits: 18
-- Time: 1.64s
-- Memory: 0

-- 4th run
-- Splits: 18
-- Time: 1.77s
-- Memory: 0




