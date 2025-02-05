#!/bin/bash

# Convert customer.dat to UTF-8 before copying
iconv -f ISO-8859-1 -t UTF-8 ~/tpcds-kit/tools/data/customer.dat -o ~/tpcds-kit/tools/data/customer_utf8.dat

# Define tables to load
tables=("dbgen_version" "customer_address" "customer_demographics" "date_dim" "warehouse" "ship_mode" "time_dim" "reason" "income_band" "item" "store" "call_center" "customer" "web_site" "store_returns" "household_demographics" "web_page" "promotion" "catalog_page" "inventory" "catalog_returns" "web_returns" "web_sales" "catalog_sales" "store_sales")

# Copy .dat files to PostgreSQL container
for table in "${tables[@]}"; do
    if [ "$table" == "customer" ]; then
        docker cp ~/tpcds-kit/tools/data/customer_utf8.dat postgres:/customer.dat
    else
        docker cp ~/tpcds-kit/tools/data/"$table".dat postgres:/"$table".dat
    fi
done

echo "Data files copied to PostgreSQL container"
