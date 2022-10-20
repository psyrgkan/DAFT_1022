use lab_20;


INSERT INTO cars (vin, manufacturer, model, year_, color)
VALUES
("3K096I98581DHSNUP", "Volkswagen",	"Tiguan",	2019, "Blue"),
("ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", 2019, "Red"),
("RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "White"),
("HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", 2018, "Silver"),
("DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "Gray");

INSERT INTO customers (customer_id, name_, phone, email, address, city, state, country, zip)
VALUES
(10001, "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", "28045"),
(20001, "Abraham Lincoln", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States", "33130"),
(30001, "Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France", "France", "75008");

INSERT INTO stores (store_id, address, city)
VALUES
(001, "-", "Madrid"),
(002, "-", "Barcelona"),
(003, "-", "Berlin"),
(004, "-", "Paris"),
(005, "-", "Miami"),
(006, "-", "Mexico City"),
(007, "-", "Amsterdam"),
(008, "-", "São Paulo");

INSERT INTO salespersons (staff_id, name_, store_id)
VALUES
(00001, "Petey Cruiser", 001),
(00002, "Anna Sthesia", 002),
(00003, "Paul Molive", 003),
(00004, "Gail Forcewind", 004),
(00005, "Paige Turner", 005),
(00006, "Bob Frapples", 006),
(00007, "Walter Melon", 007),
(00008, "Shonda Leer", 008);

INSERT INTO invoices (invoice_id, date_, vin, customer_id, staff_id)
VALUES
(852399038, "2018-08-22", "3K096I98581DHSNUP", 20001, 00004),
(731166526, "2018-12-31", "HKNDGS7CU31E9Z7JW", 10001, 00006),
(271135104, "2019-01-22", "RKXVNNIHLVVZOUB4M", 30001, 00008);