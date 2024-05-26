USE `BuyPy` ;

DELETE FROM BuyPy.Electronic;
DELETE FROM BuyPy.Book;
DELETE FROM BuyPy.Product;
DELETE FROM BuyPy.Client;
DELETE FROM BuyPy.Order;
DELETE FROM BuyPy.Recommendation;
DELETE FROM BuyPy.Operator;
DELETE FROM BuyPy.Author;
DELETE FROM BuyPy.Ordered_Item;
DELETE FROM BuyPy.BookAuthor;


INSERT INTO BuyPy.Product (id, quantity, price, vat, score, product_image, active, reason) 
VALUES 
    ('P001', 100, 29.99, 0.23, 5, 'product1.jpg', 'active', 'Reason 1'),
    ('P002', 80, 39.99, 0.23, 4, 'product2.jpg', 'inactive', 'Reason 2'),
    ('P003', 120, 19.99, 0.23, 3, 'product3.jpg', 'active', 'Reason 3'),
    ('P004', 150, 49.99, 0.23, 4, 'product4.jpg', 'active', 'Reason 4'),
    ('P005', 90, 59.99, 0.23, 5, 'product5.jpg', 'inactive', 'Reason 5'),
    ('P006', 110, 69.99, 0.23, 3, 'product6.jpg', 'active', 'Reason 6'),
    ('P007', 130, 79.99, 0.23, 4, 'product7.jpg', 'active', 'Reason 7'),
    ('P008', 70, 89.99, 0.23, 5, 'product8.jpg', 'inactive', 'Reason 8'),
    ('P009', 100, 99.99, 0.23, 4, 'product9.jpg', 'active', 'Reason 9'),
    ('P010', 200, 109.99, 0.23, 5, 'product10.jpg', 'active', 'Reason 10'),
    ('P011', 180, 79.99, 0.23, 4, 'product11.jpg', 'active', 'Reason 11'),
    ('P012', 220, 89.99, 0.23, 5, 'product12.jpg', 'inactive', 'Reason 12'),
    ('P013', 130, 99.99, 0.23, 3, 'product13.jpg', 'active', 'Reason 13'),
    ('P014', 170, 109.99, 0.23, 4, 'product14.jpg', 'active', 'Reason 14'),
    ('P015', 150, 119.99, 0.23, 5, 'product15.jpg', 'inactive', 'Reason 15'),
    ('P016', 200, 129.99, 0.23, 4, 'product16.jpg', 'active', 'Reason 16'),
    ('P017', 250, 139.99, 0.23, 3, 'product17.jpg', 'active', 'Reason 17'),
    ('P018', 160, 149.99, 0.23, 5, 'product18.jpg', 'inactive', 'Reason 18'),
    ('P019', 190, 159.99, 0.23, 4, 'product19.jpg', 'active', 'Reason 19'),
    ('P020', 210, 169.99, 0.23, 3, 'product20.jpg', 'active', 'Reason 20');
-- Inserting into Electronic table
INSERT INTO BuyPy.Electronic (product_id, serial_number, brand, model, spec_tec, type) 
VALUES 
    ('P001', 123456789, 'Brand 1', 'Model 1', 'Spec 1', 'Electronic'),
    ('P002', 987654321, 'Brand 2', 'Model 2', 'Spec 2', 'Electronic'),
    ('P003', 456789123, 'Brand 3', 'Model 3', 'Spec 3', 'Electronic'),
    ('P004', 789123456, 'Brand 4', 'Model 4', 'Spec 4', 'Electronic'),
    ('P005', 321654987, 'Brand 5', 'Model 5', 'Spec 5', 'Electronic'),
    ('P006', 654987321, 'Brand 6', 'Model 6', 'Spec 6', 'Electronic'),
    ('P007', 987321654, 'Brand 7', 'Model 7', 'Spec 7', 'Electronic'),
    ('P008', 321987654, 'Brand 8', 'Model 8', 'Spec 8', 'Electronic'),
    ('P009', 654321987, 'Brand 9', 'Model 9', 'Spec 9', 'Electronic'),
    ('P010', 123789456, 'Brand 10', 'Model 10', 'Spec 10', 'Electronic');

-- Inserting into Book table
INSERT INTO BuyPy.Book (product_id, isbn13, title, genre, publisher, publication_date) 
VALUES 
    ('P011', '1234567890123', 'Book Title 1', 'Fiction', 'Publisher 1', '2023-01-15'),
    ('P012', '9876543210123', 'Book Title 2', 'Non-fiction', 'Publisher 2', '2022-05-20'),
    ('P013', '4567891230123', 'Book Title 3', 'Mystery', 'Publisher 3', '2021-12-10'),
    ('P014', '7891234560123', 'Book Title 4', 'Thriller', 'Publisher 4', '2020-08-05'),
    ('P015', '3216549870123', 'Book Title 5', 'Romance', 'Publisher 5', '2019-03-25'),
    ('P016', '6549873210123', 'Book Title 6', 'Fantasy', 'Publisher 6', '2018-11-30'),
    ('P017', '9873216540123', 'Book Title 7', 'Sci-fi', 'Publisher 7', '2017-06-15'),
    ('P018', '3219876540123', 'Book Title 8', 'Horror', 'Publisher 8', '2016-02-20'),
    ('P019', '6543219870123', 'Book Title 9', 'Biography', 'Publisher 9', '2015-09-10'),
    ('P020', '1237894560123', 'Book Title 10', 'History', 'Publisher 10', '2014-04-05');

-- Inserting into Client table
INSERT INTO BuyPy.Client (id, firstname, surname, email, password, address, zip_code, city, country, phone_number, birthdate, is_active) 
VALUES 
    (11, 'Eva', 'Garcia', 'eva@example.com', 'password11', '123 Boulevard', 12345, 'City 11', 'Country 11', '1234567890', '1990-01-11', 1),
    (12, 'Daniel', 'Martinez', 'daniel@example.com', 'password12', '456 Street', 54321, 'City 12', 'Country 12', '9876543210', '1995-05-12', 1),
    (13, 'Sophia', 'Rodriguez', 'sophia@example.com', 'password13', '789 Avenue', 67890, 'City 13', 'Country 13', '2345678901', '1985-10-13', 0),
    (14, 'Alexander', 'Lopez', 'alexander@example.com', 'password14', '101 Road', 98765, 'City 14', 'Country 14', '8765432109', '1980-03-14', 1),
    (15, 'Isabella', 'Hernandez', 'isabella@example.com', 'password15', '202 Lane', 34567, 'City 15', 'Country 15', '7654321098', '1975-07-15', 1),
    (16, 'Mia', 'Gonzalez', 'mia@example.com', 'password16', '303 Court', 98765, 'City 16', 'Country 16', '6543210987', '1970-12-16', 0),
    (17, 'Charlotte', 'Perez', 'charlotte@example.com', 'password17', '404 Street', 34567, 'City 17', 'Country 17', '5432109876', '1965-08-17', 1),
    (18, 'Lucas', 'Torres', 'lucas@example.com', 'password18', '505 Avenue', 87654, 'City 18', 'Country 18', '4321098765', '1960-04-18', 1),
    (19, 'Liam', 'Rivera', 'liam@example.com', 'password19', '606 Road', 56789, 'City 19', 'Country 19', '3210987654', '1955-09-19', 0),
    (20, 'James', 'Gomez', 'james@example.com', 'password20', '707 Boulevard', 23456, 'City 20', 'Country 20', '2109876543', '1950-02-20', 1);

-- Inserting into Order table
INSERT INTO BuyPy.Order (date_time, delivery_method, status, payment_card_number, payment_card_name, payment_card_expiration, client_id) 
VALUES 
    ('2024-04-26 10:00:00', 'regular', 'open', 3423, 'John Doe', '2026-01-01', 11),
    ('2024-04-26 11:00:00', 'urgent', 'processing', 3242, 'Jane Doe', '2025-01-01', 12),
    ('2024-04-26 12:00:00', 'regular', 'pending', 1241, 'Alice Smith', '2024-01-01', 13),
    ('2024-04-26 13:00:00', 'urgent', 'closed', 7634, 'Bob Johnson', '2023-01-01', 14),
    ('2024-04-26 14:00:00', 'regular', 'cancelled', 43578, 'Emily Brown', '2022-01-01', 15),
    ('2024-04-26 15:00:00', 'urgent', 'open', 3543, 'David Wilson', '2021-01-01', 16),
    ('2024-04-26 16:00:00', 'regular', 'processing', 3246, 'Sarah Taylor', '2020-01-01', 17),
    ('2024-04-26 17:00:00', 'urgent', 'pending', 8945, 'Michael Miller', '2019-01-01', 18),
    ('2024-04-26 18:00:00', 'regular', 'closed', 9541, 'Olivia Davis', '2018-01-01', 19),
    ('2024-04-26 19:00:00', 'urgent', 'cancelled', 1245, 'William Martinez', '2017-01-01', 20);

-- Inserting into Recommendation table
INSERT INTO BuyPy.Recommendation (data_rec, client_id, product_id, reason, start_date) 
VALUES 
    ('2024-04-26', 1, 'P001', 'Reason 1', '2024-04-26'),
    ('2024-04-26', 2, 'P002', 'Reason 2', '2024-04-26'),
    ('2024-04-26', 3, 'P003', 'Reason 3', '2024-04-26'),
    ('2024-04-26', 4, 'P004', 'Reason 4', '2024-04-26'),
    ('2024-04-26', 5, 'P005', 'Reason 5', '2024-04-26'),
    ('2024-04-26', 6, 'P006', 'Reason 6', '2024-04-26'),
    ('2024-04-26', 7, 'P007', 'Reason 7', '2024-04-26'),
    ('2024-04-26', 8, 'P008', 'Reason 8', '2024-04-26'),
    ('2024-04-26', 9, 'P009', 'Reason 9', '2024-04-26'),
    ('2024-04-26', 10, 'P010', 'Reason 10', '2024-04-26');

-- Inserting into Operator table
INSERT INTO BuyPy.Operator (firstname, surname, email, password) 
VALUES 

    ('Gui', '1', 'gui@example.com', 'Passw0rd');
    ('hen', '1', 'gui@example.com', 'Passw0rd');
-- Inserting into Author table
INSERT INTO BuyPy.Author (name, fullname, birthdate) 
VALUES 
    ('Author 1', 'Full Name 1', '1980-01-01'),
    ('Author 2', 'Full Name 2', '1975-02-02'),
    ('Author 3', 'Full Name 3', '1970-03-03'),
    ('Author 4', 'Full Name 4', '1965-04-04'),
    ('Author 5', 'Full Name 5', '1960-05-05'),
    ('Author 6', 'Full Name 6', '1955-06-06'),
    ('Author 7', 'Full Name 7', '1950-07-07'),
    ('Author 8', 'Full Name 8', '1945-08-08'),
    ('Author 9', 'Full Name 9', '1940-09-09'),
    ('Author 10', 'Full Name 10', '1935-10-10');

-- Inserting into Ordered_Item table
INSERT INTO BuyPy.Ordered_Item (id, quantity, price, vat_amount, Order_id, Product_id) 
VALUES 
    (1, 2, 29.99, 3.66, 1, 'P001'),
    (2, 1, 39.99, 4.88, 1, 'P002'),
    (3, 3, 19.99, 2.44, 2, 'P003'),
    (4, 2, 49.99, 6.11, 2, 'P004'),
    (5, 1, 59.99, 7.33, 3, 'P005'),
    (6, 4, 69.99, 8.55, 3, 'P006'),
    (7, 2, 79.99, 9.80, 4, 'P007'),
    (8, 3, 89.99, 11.03, 4, 'P008'),
    (9, 1, 99.99, 12.24, 5, 'P009'),
    (10, 5, 109.99, 13.47, 5, 'P010');

-- Inserting into BookAuthor table
INSERT INTO BuyPy.BookAuthor (product_id, author_id) 
VALUES 
    ('P001', 1),
    ('P002', 2),
    ('P003', 3),
    ('P004', 4),
    ('P005', 5),
    ('P006', 6),
    ('P007', 7),
    ('P008', 8),
    ('P009', 9),
    ('P010', 10);