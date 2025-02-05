import os
import subprocess

# Cassandra Config
CASSANDRA_CONTAINER = "cassandra"  # Name of the Cassandra Docker container
CASSANDRA_KEYSPACE = "tpcds"  # Keyspace where tables are stored
CSV_DIR = os.path.expanduser("~/tpcds-kit/tools/tpcds_csv/")  # Directory where CSV files are stored

def import_csv_to_cassandra():
    """ Import all CSV files in CSV_DIR into Cassandra using CQL COPY command """
    for file in os.listdir(CSV_DIR):
        if file.endswith(".csv"):
            table_name = file.replace(".csv", "")  # Extract table name
            local_path = os.path.join(CSV_DIR, file)
            remote_path = f"/tmp/{file}"  # Path inside the Docker container

            # Copy file into Cassandra container
            print(f"Copying {file} to Cassandra container...")
            subprocess.run(["docker", "cp", local_path, f"{CASSANDRA_CONTAINER}:{remote_path}"], check=True)

            # Run COPY command in CQLSH
            print(f"Importing {file} into Cassandra table {table_name}...")
            copy_command = f"COPY {CASSANDRA_KEYSPACE}.{table_name} FROM '{remote_path}' WITH HEADER = TRUE AND NULL = 'NULL';"
            subprocess.run(["docker", "exec", "-it", CASSANDRA_CONTAINER, "cqlsh", "-e", copy_command], check=True)

            print(f"Successfully imported {table_name} into Cassandra!")

if __name__ == "__main__":
    import_csv_to_cassandra()
    print("\nAll CSV files have been imported into Cassandra successfully!\n")
