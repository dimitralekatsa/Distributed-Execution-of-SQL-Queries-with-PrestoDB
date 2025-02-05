COPY dbgen_version FROM '/dbgen_version.dat' WITH DELIMITER '|' CSV;
COPY customer_address FROM '/customer_address.dat' WITH DELIMITER '|' CSV;
COPY customer_demographics FROM '/customer_demographics.dat' WITH DELIMITER '|' CSV;
COPY date_dim FROM '/date_dim.dat' WITH DELIMITER '|' CSV;
COPY warehouse FROM '/warehouse.dat' WITH DELIMITER '|' CSV;
COPY ship_mode FROM '/ship_mode.dat' WITH DELIMITER '|' CSV;
COPY time_dim FROM '/time_dim.dat' WITH DELIMITER '|' CSV;
COPY reason FROM '/reason.dat' WITH DELIMITER '|' CSV;
COPY income_band FROM '/income_band.dat' WITH DELIMITER '|' CSV;
COPY item FROM '/item.dat' WITH DELIMITER '|' CSV;
COPY store FROM '/store.dat' WITH DELIMITER '|' CSV;
COPY call_center FROM '/call_center.dat' WITH DELIMITER '|' CSV;

-- Use UTF-8 encoded customer file
COPY customer FROM '/customer.dat' WITH DELIMITER '|' CSV;

COPY web_site FROM '/web_site.dat' WITH DELIMITER '|' CSV;
COPY store_returns FROM '/store_returns.dat' WITH DELIMITER '|' CSV;
COPY household_demographics FROM '/household_demographics.dat' WITH DELIMITER '|' CSV;
COPY web_page FROM '/web_page.dat' WITH DELIMITER '|' CSV;
COPY promotion FROM '/promotion.dat' WITH DELIMITER '|' CSV;
COPY catalog_page FROM '/catalog_page.dat' WITH DELIMITER '|' CSV;
COPY inventory FROM '/inventory.dat' WITH DELIMITER '|' CSV;
COPY catalog_returns FROM '/catalog_returns.dat' WITH DELIMITER '|' CSV;
COPY web_returns FROM '/web_returns.dat' WITH DELIMITER '|' CSV;
COPY web_sales FROM '/web_sales.dat' WITH DELIMITER '|' CSV;
COPY catalog_sales FROM '/catalog_sales.dat' WITH DELIMITER '|' CSV;
COPY store_sales FROM '/store_sales.dat' WITH DELIMITER '|' CSV;
