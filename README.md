# Distributed Execution of SQL Queries

This project was developed as part of the **Information Systems Analysis and Design** class. It focuses on evaluating and comparing the execution of TPC-DS benchmark queries across distributed data systems using **PrestoDB**, **PostgreSQL**, **Cassandra**, and **MongoDB**.

---

## Setup Instructions

### 1. Clone the project and prepare TPC-DS data
```bash
git clone https://github.com/databricks/tpcds-kit.git
cd tpcds-kit/tools
make OS=LINUX
./dsdgen -SCALE 12 -DIR ./data
python3 convert_files_to_csv.py
```

### 2. Start Docker
```bash
docker-compose up -d
```

---

## Load TPC-DS Data

### PostgreSQL
```bash
docker exec -it postgres psql -U admin -d testdb
\i /tpcds/postgres_schema.sql
\dt               # Check if tables created
\q
docker cp ./data postgres:/data/
docker exec -it postgres psql -U admin -d testdb
\i /tpcds/load_postgres.sql
\q
```

### Cassandra
```bash
docker exec -it cassandra cqlsh -f /data/cassandra_schema.cql
# Verify with:
cqlsh> USE tpcds; DESCRIBE TABLES;
python3 load_cassandra.py
```

### MongoDB
```bash
docker start mongodb
python3 load_mongodb.py
```

---

## Query Execution with Presto
Use the Presto web interface or CLI to run queries across the different backends (Postgres, Cassandra, MongoDB). This allows benchmarking and analysis of execution time and correctness.

---

## Benchmarking & Analysis
We use the **TPC-DS benchmark** to compare:
- Query execution time
- Query correctness
- Data loading overhead
- Suitability of each system for analytical queries

---

## Related Tools
- [TPC-DS Kit (Databricks)](https://github.com/databricks/tpcds-kit)
- [PrestoDB](https://prestodb.io/)
- [PostgreSQL](https://www.postgresql.org/)
- [Apache Cassandra](https://cassandra.apache.org/)
- [MongoDB](https://www.mongodb.com/)

---

## Troubleshooting
For system-specific issues (e.g., WSL/Docker), see [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

---

## Assignment Context
This project corresponds to the fourth group project, under the **SQL3** task, in the "Information Systems Analysis and Design" course.

