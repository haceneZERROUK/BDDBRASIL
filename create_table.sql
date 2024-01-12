-- Create a table for Customers
CREATE TABLE IF NOT EXISTS Customers (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT ,
    customer_state TEXT
);

-- Create a table for Geolocalisation
CREATE TABLE IF NOT EXISTS Geolocalisation (
    geolocation_zip_code_prefix TEXT,
    geolocation_lat REAL,
    geolocation_lng REAL,
    geolocation_city TEXT,
    geolocation_state TEXT
);

CREATE TABLE IF NOT EXISTS Reviews (
    review_id TEXT PRIMARY KEY,
    order_id TEXT,
    review_score FLOAT,
    review_comment_message TEXT,
    review_creation_date date,
    review_answer_timestamp DATE,
    timestamp_fiel_7 DATE
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id  TEXT PRIMARY KEY,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp DATE,
    order_approved_at DATE,
    order_delivered_carrier_date DATE,
    order_delivered_customer_date DATE,
    order_estimated_delivery_date DATE
);

CREATE TABLE IF NOT EXISTS OrdersItems (

    order_item_id TEXT PRIMARY KEY,
    order_id TEXT,
    product_id  TEXT,
    seller_id  TEXT,
    shipping_limit_date  DATE,
    price  FLOAT,
    freight_value  FLOAT
    );

 CREATE TABLE paiements (
    id_paiemnt TEXT PRIMARY KEY,
    order_id TEXT,
    payment_sequential TEXT,
    payment_type TEXT,
    payment_installments INT,
    payment_value FLOAT
);   

CREATE TABLE Products (
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT,
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);


 -- sqlite3 Olist.db < create_table.sql

SELECT COUNT(DISTINCT geolocation_city) as nombre_villes, COUNT( DISTINCT geolocation_state) as nombre_etats
FROM geolocalisation;

-- Le nombre de clients viennent de 8011 villes et de 27 états

SELECT COUNT(DISTINCT customer_city) as nombre_villes
FROM Customers
WHERE customer_state = 'SP';

-- le nombre de villes différentes dans l'étant de Sao Paulo est de 629

SELECT *
FROM Customers
WHERE customer_id IS NULL OR customer_unique_id IS NULL OR customer_zip_code_prefix IS NULL
   OR customer_city IS NULL OR customer_state IS NULL;

-- dans la requête plus haut on voit que la requete n'a rien retourné


SELECT customer_state, COUNT(customer_unique_id) as total_customers
FROM Customers
group by customer_state
ORDER BY customer_state;

-- le code du dessus permet de trouver le nombre de clients par état