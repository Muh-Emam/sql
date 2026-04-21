-- CREATE DATABASE e_commerce;
USE e_commerce;

CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(60) NOT NULL,
email VARCHAR(225) NOT NULL UNIQUE,
password VARCHAR(20) NOT NULL,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
image VARCHAR(255) NOT NULL,
stock INT,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders(
Id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NULL,
total DECIMAL(10, 2) NOT NULL CHECK (total > 0),
statuses ENUM('pending' , 'paid' , 'shipped' , 'cancelled') DEFAULT 'pending',
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items(
id INT PRIMARY KEY AUTO_INCREMENT,
orderId INT NOT NULL,
productId INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
price DECIMAL(10, 2) NOT NULL CHECK (price > 0),

FOREIGN KEY (orderId) REFERENCES orders(orderId),
FOREIGN KEY (productId) REFERENCES products(productId)
);

INSERT INTO users(name, email, password) VALUES
("Mohamed Emam", "mohamed@gmail.com", "mohamed123"),
("Ahmed Mosa", "ahmed@gmail.com", "ahmed123"),
("Aaser Ali", "aaser@gmail.com", "aaser123"),
("Arda Guler", "arda@gmail.com", "arda123"),
("Puskas", "puskas@gmail.com", "puskas123");

INSERT INTO products(name, price, image) VALUES
('iPhone 15', 70000, 'iphone15.jpg'),
('Samsung S24', 65000, 's24.jpg'),
('MacBook Air', 120000, 'macbook.jpg'),
('Dell Laptop', 50000, 'dell.jpg'),
('iPad', 40000, 'ipad.jpg'),
('AirPods', 8000, 'airpods.jpg'),
('Gaming Mouse', 1500, 'mouse.jpg'),
('Mechanical Keyboard', 3000, 'keyboard.jpg'),
('Smart Watch', 9000, 'watch.jpg'),
('Headphones', 2500, 'headphones.jpg');

INSERT INTO orders(total, user_id, statuses)
VALUES(3000, 2, "pending");

-- Read ALL Users
SELECT * FROM users;

SELECT * FROM orders WHERE user_id = 2;

SELECT * FROM products LIMIT 2 OFFSET 3
