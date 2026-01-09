# database schema

this document describes the database tables used in the sql practice exercises.

---

## users

stores information about registered users.

| column   | type           | description                         |
|----------|----------------|-------------------------------------|
| id       | serial (pk)    | unique user identifier              |
| name     | varchar(100)   | full name of the user               |
| email    | varchar(100)   | email address (unique)              |
| phone    | varchar(20)    | phone number (nullable)             |
| age      | integer        | age of the user                     |
| country  | varchar(50)    | country of residence                |
| city     | varchar(50)    | city of residence                   |

---

## departments

stores company departments used for organizing employees.

| column   | type           | description                               |
|----------|----------------|-------------------------------------------|
| id       | serial (pk)    | unique department identifier              |
| name     | varchar(100)   | department name                           |
| location | varchar(100)   | department location / office              |

---

## employees

stores employee details and organizational relationships.

| column         | type            | description                                      |
|----------------|-----------------|--------------------------------------------------|
| id             | serial (pk)     | unique employee identifier                       |
| name           | varchar(100)    | employee full name                               |
| email          | varchar(100)    | employee email address (unique)                  |
| department_id  | integer (fk)    | references departments(id)                       |
| manager_id     | integer (fk)    | references employees(id), self-referencing       |
| salary         | decimal(10,2)   | employee salary                                  |
| hire_date      | date            | date the employee was hired                      |

---

## categories

stores product categories used for organizing products.

| column      | type         | description                        |
|-------------|--------------|------------------------------------|
| id          | serial (pk)  | unique category identifier         |
| name        | varchar(50)  | category name                      |
| description | text         | category description               |

---


## suppliers

stores product suppliers and vendors.

| column        | type           | description                          |
|---------------|----------------|--------------------------------------|
| id            | serial (pk)    | unique supplier identifier           |
| name          | varchar(100)   | supplier company name                |
| country       | varchar(50)    | supplier country                     |
| contact_email | varchar(100)   | supplier contact email               |

---

## products

stores product information, pricing, and inventory details.

| column       | type           | description                              |
|--------------|----------------|------------------------------------------|
| id           | serial (pk)    | unique product identifier                |
| name         | varchar(100)   | product name                             |
| description  | text           | product description (nullable)           |
| category_id  | integer (fk)   | references categories(id)                |
| supplier_id  | integer (fk)   | references suppliers(id)                 |
| price        | decimal(10,2)  | product price in dollars                 |
| stock        | integer        | available inventory quantity             |

---
## orders

stores customer orders and order details.

| column      | type           | description                                   |
|-------------|----------------|-----------------------------------------------|
| id          | serial (pk)    | unique order identifier                       |
| user_id     | integer (fk)   | references users(id)                          |
| product_id  | integer (fk)   | references products(id)                       |
| quantity    | integer        | number of items ordered                       |
| order_date  | date           | date when the order was placed                |
| status      | varchar(20)    | order status (pending, shipped, delivered)    |

---
## reviews

stores product reviews submitted by users.

| column      | type           | description                                  |
|-------------|----------------|----------------------------------------------|
| id          | serial (pk)    | unique review identifier                     |
| product_id  | integer (fk)   | references products(id)                      |
| user_id     | integer (fk)   | references users(id)                         |
| rating      | integer        | rating from 1 to 5 stars                     |
| comment     | text           | review comment text                          |
| review_date | date           | date the review was posted                   |

---

## relationships

users.id → orders.user_id  
users.id → reviews.user_id  

products.id → orders.product_id  
products.id → reviews.product_id  

products.category_id → categories.id  
products.supplier_id → suppliers.id  

employees.department_id → departments.id  
employees.manager_id → employees.id  
