
INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Oleksandr','Kuplynov','+380674854218','Ukraine, Kyiv, Khreschatyk 87a');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Leon','Gardner','+380996324815','Ukraine, Kharkiv, Nauky 12');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Peter','King','+380995824619','Ukraine, Lviv, Azovska 6');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('James','Goodwin','+380672118908','Ukraine, Lviv, Belzka 20');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Lionel','Robertson','+380679854632','Ukraine, Kharkiv, Hoholia 36b');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Oliver','Lang','+380678964125','Ukraine, Kyiv, Bankova 1');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Roy','Barrett','+380675864298','Ukraine, Dnipro, 20-richchia Peremohy Street');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Darcy','Lane','+380673624785','Ukraine, Dnipro, 8 Bereznya Lane');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Alvin','Paul','+380677854136','Ukraine, Kyiv, Aleksuhina Basil Street 8');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Peter','Waters','+380678513641','Ukraine, Lviv, Bilasa Vasylia Street 15a');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Edgar','Newton','+380679662555','Studio 49 Lewis Bridge Thomasmouth ST3 1EQ');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Walter','Joseph','+380674442255','Flat 39 Michael Loop North Leah BT46 5NR');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Roderick','Holt','+380961524783','7 Khan Roads Kieranborough ST3 2HB');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Robert','Doyle','+380673214598','0 Evelyn Vista Lake Kirsten G71 7PA');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Asher','Morton','+380679632574','Flat 84s Jane Valley Port Zachary HA1 2AG');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Peter','Nicholson','+380679874512','Flat 53f Morris Court Alisonshire HA3 7SF');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Cody','Hardy','+380677894516','3 Sasha Cliff East Greghaven OX4 1GF');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Paul','Flynn','+380679632548','Flat 26e Adams Landing Jamesmouth EX12 2WH');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Brian','Wells','+380678562345','Studio 25i Poppy Brook LL48 6SE');

INSERT INTO intermediaryservices.person (person_name, person_surname, person_phone, person_address)
 VALUES ('Harry','McGee','+380679513575','8 Elliott Glens Patelmouth ML3 8PH');

INSERT INTO intermediaryservices.agent (agent_passport, person_id) VALUES ('UA858941',1);
INSERT INTO intermediaryservices.agent (agent_passport, person_id) VALUES ('UA967824',2);
INSERT INTO intermediaryservices.agent (agent_passport, person_id) VALUES ('UA207856',3);
INSERT INTO intermediaryservices.agent (agent_passport, person_id) VALUES ('UA856427',4);
INSERT INTO intermediaryservices.agent (agent_passport, person_id) VALUES ('UA975841',5);
INSERT INTO intermediaryservices.agent (agent_passport, person_id) VALUES ('UA856941',6);

INSERT INTO intermediaryservices.provider (provider_company, checking_account, person_id)
 VALUES ('TopShop', 4149583625475863, 7);

INSERT INTO intermediaryservices.provider (provider_company, checking_account, person_id)
 VALUES ('Micron', 4148455678894512, 8);

INSERT INTO intermediaryservices.provider (provider_company, checking_account, person_id)
 VALUES ('UP2U', 4141451223564558, 9);

INSERT INTO intermediaryservices.provider (provider_company, checking_account, person_id)
 VALUES ('EntTrades', 4141986545781265, 10);

INSERT INTO intermediaryservices.customer (person_id) VALUES (11);
INSERT INTO intermediaryservices.customer (person_id) VALUES (12);
INSERT INTO intermediaryservices.customer (person_id) VALUES (13);
INSERT INTO intermediaryservices.customer (person_id) VALUES (14);
INSERT INTO intermediaryservices.customer (person_id) VALUES (15);
INSERT INTO intermediaryservices.customer (person_id) VALUES (16);
INSERT INTO intermediaryservices.customer (person_id) VALUES (17);
INSERT INTO intermediaryservices.customer (person_id) VALUES (18);
INSERT INTO intermediaryservices.customer (person_id) VALUES (19);
INSERT INTO intermediaryservices.customer (person_id) VALUES (20);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id) VALUES ('Boots', 100, 1);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('Coat', 89.50, 1);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('Dress', 149.99, 1);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('Shirt', 15.90, 1);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('microchips T18LE', 5, 2);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('microchips B8912', 120.30, 2);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('microchips TY95JP', 40.90, 2);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('microchips 562AA678', 50.35, 2);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('meat', 2.36, 3);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('avocado', 1, 3);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('broccoli', 0.75, 3);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('beet', 0.5, 3);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('bitcoin', 15, 4);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('step', 19.76, 4);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('next', 90.89, 4);

INSERT INTO intermediaryservices.product (product_name, product_price, provider_id)
 VALUES ('doge', 0.36, 4);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id) VALUES ('2022-11-17', 1, 1);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 2, 2);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 3, 3);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 4, 4);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 5, 5);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 6, 6);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 1, 7);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 2, 8);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 3, 9);

INSERT INTO intermediaryservices.orders (order_date, agent_id, customer_id)
 VALUES ('2022-11-17', 4, 10);


INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount) VALUES (1, 1, 10);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (1, 2, 30);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (1, 3, 17);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (1, 9, 25.7);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (1, 10, 500);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (2, 3, 7);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (2, 4, 40);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (2, 2, 18);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (2, 5, 40);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (2, 6, 90);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (3, 5, 30);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (3, 6, 20);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (3, 7, 7);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (3, 14, 13.76);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (3, 15, 18.90);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (4, 9, 105);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (4, 10, 600);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (4, 11, 400);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (4, 16, 16.35);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (4, 13, 15);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (5, 1, 10);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (5, 6, 5);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (5, 16, 14.86);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (6, 9, 13);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (6, 4, 18);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (6, 5, 60);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (7, 12, 90.62);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (7, 6, 6);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (7, 4, 8);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (8, 1, 10);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (8, 2, 15);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (8, 3, 20);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (9, 5, 23);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (9, 7, 14);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (9, 8, 8);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (10, 9, 50.5);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (10, 10, 80);

INSERT INTO intermediaryservices.order_has_product (order_id, product_id, product_amount)
 VALUES (10, 11, 54.5);