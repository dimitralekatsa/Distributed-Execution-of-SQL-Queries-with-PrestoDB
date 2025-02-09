import os
import subprocess

# MongoDB Config
DB_NAME = "tpcds_db"  
MONGO_CONTAINER = "mongodb"
CSV_DIR = os.path.expanduser("~/tpcds-kit/tools/tpcds_csv/")

def import_csv_to_mongodb():
    """ Import all CSV files into MongoDB without defining primary keys. """
    for file in os.listdir(CSV_DIR):
        if file.endswith(".csv"):
            collection_name = file.replace(".csv", "")
            local_path = os.path.join(CSV_DIR, file)
            remote_path = f"/tmp/{file}"

            # MongoDB Import Command (without primary key specification)
            import_command = [
                "docker", "exec", "-it", MONGO_CONTAINER,
                "mongoimport", "--db", DB_NAME, "--collection", collection_name,
                "--type", "csv", "--headerline", "--file", remote_path
            ]

            # Copy CSV file to MongoDB container
            subprocess.run(["docker", "cp", local_path, f"{MONGO_CONTAINER}:{remote_path}"], check=True)
            
            # Run MongoDB import command
            subprocess.run(import_command, check=True)

            print(f"Imported: {collection_name} into MongoDB")

if __name__ == "__main__":
    import_csv_to_mongodb()
    print("\nAll CSV files have been imported into MongoDB successfully!\n")
