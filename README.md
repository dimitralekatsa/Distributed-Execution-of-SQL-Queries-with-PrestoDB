# Information-Systems-Analysis-and-Design-Class
 Distributed Execution of SQL Queries

**1. python3 ~/tpcds-kit/tools/tpcds/convert_files_to_csv.py**

POSTGRES
1.  docker start postgres
2. docker exec -it postgres psql -U admin -d testdb
3. \i /tpcds/postgres_schema.sql
4. \dt -- only to check if the tables have been created
5. \q
6. docker cp ~/tpcds-kit/tools/data/ postgres:/data/
7. docker exec -it postgres psql -U admin -d testdb
8. \i /tpcds/load_postgres.sql
9. \q

CASSANDRA
1. docker run -d --name cassandra --memory=4g -v ~/tpcds-kit/tools/tpcds:/data cassandra
2. docker exec -it cassandra cqlsh -f /data/cassandra_schema.cql
4. docker exec -it cassandra cqlsh -e "USE tpcds; DESCRIBE TABLES;" -- only to check if the tables have been created
5. python3 ~/tpcds-kit/tools/tpcds/load_cassandra.py

MONGODB
1. docker start mongodb
2. python3 ~/tpcds-kit/tools/tpcds/load_mongodb.py
