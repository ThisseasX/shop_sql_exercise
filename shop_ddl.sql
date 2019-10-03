CREATE TABLE client
(
  client_id INT AUTO_INCREMENT
    PRIMARY KEY,
  name      VARCHAR(50) NULL
);

CREATE TABLE employee
(
  employee_id INT AUTO_INCREMENT
    PRIMARY KEY,
  name        VARCHAR(50) NULL,
  role_id     INT         NULL
);

CREATE INDEX role_id
  ON employee (role_id);

CREATE TABLE product
(
  product_id INT AUTO_INCREMENT
    PRIMARY KEY,
  name       VARCHAR(50)   NULL,
  price      DECIMAL(7, 2) NULL
);

CREATE TABLE role
(
  role_id INT AUTO_INCREMENT
    PRIMARY KEY,
  name    VARCHAR(50) NULL
);

ALTER TABLE employee
  ADD CONSTRAINT employee_ibfk_1
FOREIGN KEY (role_id) REFERENCES role (role_id);

CREATE TABLE sale
(
  sale_id     INT AUTO_INCREMENT
    PRIMARY KEY,
  employee_id INT NULL,
  client_id   INT NULL,
  CONSTRAINT sale_ibfk_1
  FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
  CONSTRAINT sale_ibfk_2
  FOREIGN KEY (client_id) REFERENCES client (client_id)
);

CREATE INDEX client_id
  ON sale (client_id);

CREATE INDEX employee_id
  ON sale (employee_id);

CREATE TABLE sale_entry
(
  sale_id    INT NULL,
  product_id INT NULL,
  quantity   INT NULL,
  CONSTRAINT sale_entry_ibfk_1
  FOREIGN KEY (sale_id) REFERENCES sale (sale_id),
  CONSTRAINT sale_entry_ibfk_2
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE INDEX product_id
  ON sale_entry (product_id);

CREATE INDEX sale_id
  ON sale_entry (sale_id);

CREATE TABLE stock
(
  store_id   INT NULL,
  product_id INT NULL,
  quantity   INT NULL,
  CONSTRAINT stock_ibfk_2
  FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE INDEX product_id
  ON stock (product_id);

CREATE INDEX store_id
  ON stock (store_id);

CREATE TABLE store
(
  store_id INT AUTO_INCREMENT
    PRIMARY KEY,
  address  VARCHAR(50) NULL
);

ALTER TABLE stock
  ADD CONSTRAINT stock_ibfk_1
FOREIGN KEY (store_id) REFERENCES store (store_id);

