--- mongodb

---7.197.566


SELECT COUNT(*)
FROM mongodb.tpcds.web_sales ws
limit 100

--- 1 worker
-- 1st run
-- Splits: 18
-- Time: 2:04s
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 1:54
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 1:55
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 1:52
-- Memory: 0

--coordinator 5.8GB
--mongo 4.8GB


-- 2 workers
--1st run
--Splits 18
--Time: 2:10m
--CPU time 1:20m
--Memory 0

--2ond run
--Splits 18
-- Time: 1:38m
-- CPU Time 1:21m
-- Memory 0

--3rd  run
-- Splits 18
-- Time 1:40m
-- CPU Time 1:21m
-- Memory 0

-- 4th  run
-- Splits 18
-- Time 1:43m
-- CPU Time 1:23m
-- Memory 0

--  coordinator   14.40%    4.125GiB 
--  mongo         0.98%     4.707GiB 
--  worker1       2.33%     1.142GiB 


----4 workers
--1st run
--Splits 18
--Time: 1:22m
--CPU time 48s
--Memory 0

--2nd run
--Splits 18
-- Time: 53.7s
-- CPU Time 42.2s
-- Memory 0

--3rd  run
-- Splits 18
-- Time 51.2s
-- CPU Time 42.8s
-- Memory 0

-- 4th  run
-- Splits 18
-- Time 47.6s
-- CPU Time 40.2s
-- Memory 0


--    worker4       1.71%     929.6MiB 
--    worker2       2.03%     908.7MiB
--   coordinator   12.67%    4.746GiB 
--    mongo         1.17%     4.663GiB 
--    worker1       2.61%     950.2MiB 

SELECT COUNT(*)
FROM cassandra.tpcds.web_sales ws
limit 100


-- 1 worker
-- 1st run
-- Splits: 312
-- Time: 2:27m
-- CPU Time: 1:27m
-- Memory: ~0

-- 2nd run
-- Splits: 312
-- Time: 1:51m
-- CPU Time: 1:01m
-- Memory: ~0

-- 3rd run
-- Splits: 312
-- Time: 1:42m
-- CPU Time: 1:02m
-- Memory: ~0

-- 4th run
-- Splits: 312
-- Time: 1:44m
-- CPU Time: 1:02m
-- Memory: ~0

-- 747f8e7bc9ec   coordinator   7.75%     4.371GiB / 7GiB       62.44%    8.91GB / 10.5MB   114MB / 10.6MB    227
-- 6f94a2a351de   cassandra     1.89%     4.355GiB / 15.49GiB   28.11%    6.06MB / 8.91GB   1.24GB / 29.1MB   90

-- 2 workers

-- 1st run
-- Splits: 312
-- Time: 2:27m
-- CPU Time: 1:15m
-- Memory: ~0

-- 2nd run
-- Splits: 312
-- Time: 2:03m
-- CPU Time: 1:10m
-- Memory: ~0

-- 3rd run
-- Splits: 312
-- Time: 1:57m
-- CPU Time: 1:11m
-- Memory: ~0

-- 4th run
-- Splits: 312
-- Time: 1:57m
-- CPU Time: 1:10m
-- Memory: ~0

-- cassandra 3.7
-- coordinator 3.8
-- worker 950MB


-- 4 workers
-- 1st run
-- Splits: 312
-- Time: 2:09m
-- CPU Time: 1:57m
-- Memory: ~0

-- 2nd run
-- Splits: 312
-- Time: 2:00m
-- CPU Time: 1:13m
-- Memory: ~0

-- 3rd run
-- Splits: 312
-- Time: 1:59m
-- CPU Time: 1:14m
-- Memory: ~0

-- 4th run
-- Splits: 312
-- Time: 2:01m
-- CPU Time: 1:12m
-- Memory: ~0

-- 13e529f2428c   worker4       2.15%     1.039GiB / 15.49GiB   6.71%     890kB / 795kB     10.7MB / 49.2MB   171
-- 43fede31a2d4   worker2       9.66%     1.21GiB / 15.49GiB    7.81%     964kB / 1.23MB    14.8MB / 51.8MB   179
-- 747f8e7bc9ec   coordinator   10.46%    4.724GiB / 7GiB       67.49%    6.69GB / 10.7MB   126MB / 3.37MB    273
-- 742662b25540   worker1       1.56%     1.329GiB / 15.49GiB   8.58%     1.51MB / 1.77MB   8.04MB / 181MB    173
-- 6f94a2a351de   cassandra     2.10%     2.536GiB / 15.49GiB   16.37%    14.7MB / 22.3GB   4.54GB / 2GB      90

SELECT COUNT(*)
FROM postgres.public.web_sales ws
limit 100

-- 1 worker
-- 1st run
-- Splits: 18
-- Time: 16.8s
--CPU Time: 1.5s
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 8.26s
-- CPU Time: 1.83s
-- Memory: 0

-- 3rd run
-- Splits: 18
-- Time: 4.73s
-- CPU Time: 1.15s
-- Memory: 0

-- 4th run
-- Splits: 18
-- Time: 3.75s
-- CPU Time: 1.00s
-- Memory: 0


--- 2 workers

-- 1st run
-- Splits: 18
-- Time: 19.3s
-- CPU Time: 2.23s
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 6.17s
-- CPU Time: 1.69s
-- Memory: 0

-- 3rd run
-- Splits: 18
-- Time: 5.19s
-- CPU Time: 1.22s
-- Memory: 0

-- 4th run
-- Splits: 18
-- Time: 6.92s
-- CPU Time: 1.56s
-- Memory: 0

-- coordinator 3.4Gb
-- postgres 200Mb
--worker1 960Mb

-- 4 workers

-- 1st run
-- Splits: 18
-- Time: 22.2s
-- CPU Time: 1.97s
-- Memory: 0

-- 2nd run
-- Splits: 18
-- Time: 6.09s
-- CPU Time: 1.52s
-- Memory: 0

-- 3rd run
-- Splits: 18
-- Time: 4.35s
-- CPU Time: 1.16s
-- Memory: 0

-- 4th run
-- Splits: 18
-- Time: 4.11s
-- CPU Time: 1.14s
-- Memory: 0

-- coordinator 1.4b
-- postgres 250Mb
-- worker1 1Gb
-- worker2 1.1Gb
-- worker3 1Gb