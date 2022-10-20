create database if not exists lab_20;
use lab_20;

CREATE TABLE IF NOT EXISTS cars (
vin VARCHAR(17) NOT NULL,
manufacturer VARCHAR(30),
model VARCHAR(30),
year_ INT,
color VARCHAR(30),
PRIMARY KEY (vin)
);

CREATE TABLE IF NOT EXISTS customers (
customer_id INT NOT NULL,
name_ VARCHAR(50),
phone VARCHAR(30),
email VARCHAR(40),
address VARCHAR(50),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20),
zip VARCHAR(10),
PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS stores (
store_id INT NOT NULL,
address VARCHAR(50),
city VARCHAR(50),
PRIMARY KEY (store_id)
);

CREATE TABLE IF NOT EXISTS salespersons (
staff_id INT NOT NULL,
name_ VARCHAR(50),
store_id INT,
PRIMARY KEY (staff_id),
FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE IF NOT EXISTS invoices (
invoice_id INT NOT NULL,
date_ DATE,
customer_id INT,
vin VARCHAR(17),
staff_id INT,
PRIMARY KEY (invoice_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (vin) REFERENCES cars(vin),
FOREIGN KEY (staff_id) REFERENCES salespersons(staff_id)
);