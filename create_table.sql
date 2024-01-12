-- Execute this command to create the tables
-- sqlite3 olist.db < create_table.sql

CREATE TABLE IF NOT EXISTS State_name (
    state_name_id TEXT PRIMARY KEY,
    state TEXT,
    state_name TEXT,
);

CREATE TABLE IF NOT EXISTS sellers (
    seller_id TEXT PRIMARY KEY,
    seller_zip_code_prefix TEXT,
    seller_city TEXT,
    seller_state TEXT,
);

CREATE TABLE IF NOT EXISTS products (
    product_id TEXT PRIMARY KEY,
    state TEXT FOREIGN KEY,
    product_category_name TEXT,
    product_name_lenght TEXT,
    product_description_lenght TEXT,
    product_photos_qty TEXT,
    product_weight_g TEXT,
    product_lenght_cm TEXT,
    product_height_cm TEXT,
    product_widht_cm TEXT,
                        
);

CREATE TABLE IF NOT EXISTS product_category_name_translation (
    id_producti_category_name TEXT PRIMARY KEY,
    product_category_name TEXT,
    product_category_name_english TEXT,
    strproduct_category_name_englis,
);
