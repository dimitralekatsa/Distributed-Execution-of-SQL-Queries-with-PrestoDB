# Information-Systems-Analysis-and-Design-Class
 Distributed Execution of SQL Queries

**ERROR** WSL integration with distro 'Ubuntu-20.04' unexpectedly stopped. Do you want to restart it?
1. wsl --shutdown
2. wsl --set-version Ubuntu-20.04 2
3. End task Docker Desktop in Task Manager
4. Open Docker Desktop.
Settings -> Resources -> WSL Integration -> Unckeck "Ubuntu-20.04"
5. wsl --unregister Ubuntu-20.04

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
