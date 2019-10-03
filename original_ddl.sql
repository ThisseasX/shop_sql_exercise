CREATE TABLE role (
  role_id INT PRIMARY KEY AUTO_INCREMENT,
  name    VARCHAR(50)
);
INSERT INTO role (name) VALUES ('manager'), ('clerk'), ('cashier');

CREATE TABLE employee (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  name        VARCHAR(50),
  role_id     INT,
  FOREIGN KEY (role_id) REFERENCES role (role_id)
);
INSERT INTO employee (name, role_id)
VALUES ('Thiss', 1), ('George', 1), ('Joe', 2), ('Jack', 2), ('Jane', 3), ('Jill', 3);

CREATE TABLE client (
  client_id INT PRIMARY KEY AUTO_INCREMENT,
  name      VARCHAR(50)
);
INSERT INTO client (name) VALUES ('John'), ('Jeremy'), ('Jeremiah'), ('Jerome'), ('Jake');

CREATE TABLE product (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(50),
  price      DECIMAL(7, 2)
);
INSERT INTO product (name, price) VALUES ('Product1', 3.99), ('Product2', 5.98), ('Product3', 7.54);

CREATE TABLE store (
  store_id INT PRIMARY KEY AUTO_INCREMENT,
  address  VARCHAR(50)
);
INSERT INTO store (address)
VALUES ('Street 15, Area 2, City 5'), ('Street 120, Area 25, City 12'), ('Street 35, Area 6, City 1');

CREATE TABLE stock (
  store_id   INT,
  product_id INT,
  quantity   INT,
  FOREIGN KEY (store_id) REFERENCES store (store_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);
INSERT INTO stock
VALUES (1, 1, 15), (1, 2, 32), (1, 3, 53), (2, 1, 8), (2, 2, 1), (2, 3, 23), (3, 1, 5), (3, 2, 24), (3, 3, 84);

CREATE TABLE sale (
  sale_id     INT PRIMARY KEY AUTO_INCREMENT,
  employee_id INT,
  client_id   INT,
  FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
  FOREIGN KEY (client_id) REFERENCES client (client_id)
);
INSERT INTO sale (employee_id, client_id) VALUES (1, 2), (1, 3), (2, 4), (2, 1), (2, 3), (1, 3), (3, 2);

CREATE TABLE sale_entry (
  sale_id    INT,
  product_id INT,
  quantity   INT,
  FOREIGN KEY (sale_id) REFERENCES sale (sale_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);
INSERT INTO sale_entry
VALUES (1, 1, 2), (1, 2, 8), (1, 3, 5), (2, 1, 6), (2, 2, 9), (3, 1, 2), (4, 2, 9), (4, 3, 11), (5, 1, 3), (5, 3, 15),
  (6, 3, 3), (7, 2, 4);