Create Database Restaurant;
use restaurant;

CREATE TABLE category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT
);
CREATE TABLE menu_item (
  menu_item_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  price DECIMAL(8,2) NOT NULL CHECK (price >= 0),
  category_id INT NOT NULL,
  available BOOLEAN DEFAULT TRUE,
  last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES category(category_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customer_address (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  street VARCHAR(255) NOT NULL,
  city VARCHAR(100) NOT NULL,
  province_state VARCHAR(100),
  postal_code VARCHAR(20),
  country VARCHAR(100) DEFAULT 'Canada',
  is_default BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);
 

CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  address_id INT, -- delivery address (nullable for pickup)
  order_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
  status ENUM('Pending','Preparing','Out for Delivery','Delivered','Cancelled') DEFAULT 'Pending',
  total_price DECIMAL(9,2) DEFAULT 0.00,
  cancelled_reason TEXT,
  delivered_at DATETIME NULL,
  last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (address_id) REFERENCES customer_address(address_id) ON DELETE SET NULL
);

CREATE TABLE employee (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  full_name VARCHAR(200),
  role ENUM('Cashier','Cook','Manager','Driver','Other') NOT NULL DEFAULT 'Other',
  hired_date DATE,
  active BOOLEAN DEFAULT TRUE
);


