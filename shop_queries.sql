-- Get roles per employee

SELECT
  e.name AS employee,
  r.name AS role
FROM employee e
  JOIN role r ON e.role_id = r.role_id

-- Get stocked items per store ordered by store then product

SELECT
  ss.address,
  p.name     AS product,
  s.quantity AS stock
FROM stock s
  JOIN store ss ON s.store_id = ss.store_id
  JOIN product p ON s.product_id = p.product_id
ORDER BY 1, 2

-- Get sold items, price, quantity, total

SELECT
  s.sale_id,
  p.name               AS product,
  s.quantity,
  p.price,
  p.price * s.quantity AS total
FROM sale_entry s
  JOIN product p ON p.product_id = s.product_id;
  
-- Get sold items, employee, client, quantity, price, total

SELECT
  s.sale_id,
  e.name               AS employee,
  c.name               AS client,
  p.name               AS product,
  s.quantity,
  p.price,
  p.price * s.quantity AS total
FROM sale_entry s
  JOIN product p ON p.product_id = s.product_id
  JOIN sale ss ON s.sale_id = ss.sale_id
  JOIN employee e ON ss.employee_id = e.employee_id
  JOIN client c ON ss.client_id = c.client_id

-- Get sold items, employee, client, total, group by sale

SELECT
  s.sale_id,
  e.name                              AS employee,
  c.name                              AS client,
  group_concat(p.name SEPARATOR ', ') AS products,
  sum(p.price * s.quantity)           AS total
FROM sale_entry s
  JOIN product p ON p.product_id = s.product_id
  JOIN sale ss ON s.sale_id = ss.sale_id
  JOIN employee e ON ss.employee_id = e.employee_id
  JOIN client c ON ss.client_id = c.client_id
GROUP BY 1

-- Get total of all sold items

SELECT sum(p.price * s.quantity) AS grand_total
FROM sale_entry s
  JOIN product p ON p.product_id = s.product_id

-- Get total quantity sold

SELECT sum(s.quantity) AS quantity
FROM sale_entry s

-- Get total quantity and price per sold item

SELECT
  p.name                    AS product,
  sum(s.quantity)           AS quantity,
  sum(p.price * s.quantity) AS total
FROM sale_entry s
  JOIN product p ON p.product_id = s.product_id
GROUP BY p.product_id

-- Get total quantity and price per sold item with subtotals

SELECT
  p.name                    AS product,
  sum(s.quantity)           AS quantity,
  sum(p.price * s.quantity) AS total
FROM sale_entry s
  JOIN product p ON p.product_id = s.product_id
GROUP BY p.product_id
UNION SELECT
        NULL,
        sum(s.quantity),
        sum(p2.price * s.quantity)
      FROM sale_entry s
        JOIN product p2 ON s.product_id = p2.product_id
