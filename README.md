# Information-Systems-Analysis-and-Design-Class
 Distributed Execution of SQL Queries

*1.python3 ~/tpcds-kit/tools/tpcds/convert_files_to_csv.py*

POSTGRES
1. docker exec -it postgres psql -U admin -d testdb
2. \i /tpcds/postgresql_schema.sql
3. \dt # only to check if the tables have been created
4. \q
5. docker cp ~/tpcds-kit/tools/data/ postgres:/data/
6. docker exec -it postgres psql -U admin -d testdb
7. \i /tpcds/load_postgres.sql
\q

CASSANDRA
1. docker exec -it cassandra cqlsh -f ~/tpcds-kit/tools/tpcds/cassandra_schema.cql
2. docker exec -it cassandra cqlsh -e "USE tpcds; DESCRIBE TABLES;" # only to check if the tables have been created
3. python3 ~/tpcds-kit/tools/tpcds/load_cassandra.py

MONGODB
1. python3 ~/tpcds-kit/tools/tpcds/load_mongodb.py
