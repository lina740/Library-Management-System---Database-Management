-- Sample data

INSERT INTO Books VALUES (100, 'The black cat', 'jackson', 5);
INSERT INTO Books VALUES (101, 'think and grow Rich', 'napoleon hill', 3);
INSERT INTO Books VALUES (102, 'the art of happiness', 'dalai lama and howard cutler', 4);
INSERT INTO Books VALUES (103, '1984', 'George Orwell', 2);
INSERT INTO Books VALUES (104, 'To Kill a Mockingbird', 'Harper Lee', 4);
INSERT INTO Books VALUES (105, 'Sapiens', 'Yuval Noah Harari', 5);
INSERT INTO Books VALUES (106, 'Atomic Habits', 'James Clear', 3);
INSERT INTO Books VALUES (107, 'The Power of Now', 'Eckhart Tolle', 10);

INSERT INTO Members VALUES (01, 'Ahmed', 'Ali', 'ahmed@gmail.com');
INSERT INTO Members VALUES (02, 'jana', 'Ibrahim', 'jana@gmail.com');
INSERT INTO Members VALUES (03, 'Sara', 'Mohammed', 'sara@gmail.com');
INSERT INTO Members VALUES (04, 'Faisal', 'Salem', 'faisal@hotmail.com');

INSERT INTO Borrowing VALUES (1134, 01, 100, DATE '2025-04-01', DATE '2025-04-10', NULL);
INSERT INTO Borrowing VALUES (1156, 02, 101, DATE '2025-04-02', DATE '2025-04-12', DATE '2025-04-11');
INSERT INTO Borrowing VALUES (1178, 03, 102, DATE '2025-04-03', DATE '2025-04-15', NULL);
INSERT INTO Borrowing VALUES (1190, 04, 103, DATE '2025-04-04', DATE '2025-04-14', DATE '2025-04-13');

INSERT INTO Users VALUES (1, 'Wajd',  'W01',   'Admin');
INSERT INTO Users VALUES (2, 'Lina',  'L02',   'Moderator');
INSERT INTO Users VALUES (3, 'Rawda', 'Raw03', 'Member');
INSERT INTO Users VALUES (4, 'Reema', 'R04',   'Guest');

INSERT INTO payment VALUES (704,  1156, 02, 0.00,  DATE '2025-04-11', 'Paid');
INSERT INTO payment VALUES (805,  1134, 01, 20.00, NULL,              'Unpaid');
INSERT INTO payment VALUES (910,  1178, 03, 50.00, DATE '2025-04-10', 'Paid');
INSERT INTO payment VALUES (1023, 1190, 04, 35.00, NULL,              'Unpaid');

COMMIT;
