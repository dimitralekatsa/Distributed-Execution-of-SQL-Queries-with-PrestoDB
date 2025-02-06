import os
import subprocess

# MongoDB Config
DB_NAME = "tpcds_db"  
MONGO_CONTAINER = "mongodb"
CSV_DIR = os.path.expanduser("~/tpcds-kit/tools/tpcds_csv/")

# Define Primary Keys for MongoDB (to override `_id`)
PRIMARY_KEYS = {
    "customer_address": "ca_address_sk",
    "customer_demographics": "cd_demo_sk",
    "date_dim": "d_date_sk",
    "warehouse": "w_warehouse_sk",
    "ship_mode": "sm_ship_mode_sk",
    "time_dim": "t_time_sk",
    "reason": "r_reason_sk",
    "income_band": "ib_income_band_sk",
    "item": "i_item_sk",
    "store": "s_store_sk",
    "call_center": "cc_call_center_sk",
    "customer": "c_customer_sk",
    "web_site": "web_site_sk",
    "store_returns": "sr_item_sk,sr_ticket_number",
    "household_demographics": "hd_demo_sk",
    "web_page": "wp_web_page_sk",
    "promotion": "p_promo_sk",
    "catalog_page": "cp_catalog_page_sk",
    "inventory": "inv_date_sk,inv_item_sk,inv_warehouse_sk",
    "catalog_returns": "cr_item_sk,cr_order_number",
    "web_returns": "wr_item_sk,wr_order_number",
    "web_sales": "ws_item_sk,ws_order_number",
    "catalog_sales": "cs_item_sk,cs_order_number",
    "store_sales": "ss_item_sk,ss_ticket_number"
}

def import_csv_to_mongodb():
    """ Import all CSV files into MongoDB with a custom primary key. """
    for file in os.listdir(CSV_DIR):
        if file.endswith(".csv"):
            collection_name = file.replace(".csv", "")
            local_path = os.path.join(CSV_DIR, file)
            remote_path = f"/tmp/{file}"

            # Get primary key for this table
            primary_key = PRIMARY_KEYS.get(collection_name, None)

            if primary_key:
                upsert_command = [
                    "docker", "exec", "-it", MONGO_CONTAINER,
                    "mongoimport", "--db", DB_NAME, "--collection", collection_name,
                    "--type", "csv", "--headerline", "--columnsHaveTypes",
                    "--file", remote_path, "--mode", "upsert", "--upsertFields", primary_key
                ]
            else:
                upsert_command = [
                    "docker", "exec", "-it", MONGO_CONTAINER,
                    "mongoimport", "--db", DB_NAME, "--collection", collection_name,
                    "--type", "csv", "--headerline", "--file", remote_path
                ]

            subprocess.run(["docker", "cp", local_path, f"{MONGO_CONTAINER}:{remote_path}"], check=True)
            subprocess.run(upsert_command, check=True)

            print(f"Imported: {collection_name} into MongoDB (Primary Key: {primary_key or '_id (default)'})")

if __name__ == "__main__":
    import_csv_to_mongodb()
    print("\nAll CSV files have been imported into MongoDB successfully!\n")
