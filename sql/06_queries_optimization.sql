-- Queries and query optimization

-- Most borrowed books
SELECT b.book_id, b.title, COUNT(*) AS timesborrowed
FROM Borrowing b1
JOIN Books b ON b1.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY timesborrowed DESC;

-- Author search: before optimization
SELECT * FROM Books
WHERE author = 'George Orwell';

-- Author search: after optimization (select only the needed column)
SELECT title
FROM Books
WHERE author = 'George Orwell';

-- Overdue members: before optimization
EXPLAIN PLAN FOR
SELECT m.member_id, m.f_name, m.L_name, b.duedate
FROM Members m
JOIN Borrowing b ON m.member_id = b.member_id
WHERE b.duedate < SYSDATE AND b.returndate IS NULL;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Overdue members: after optimization (index + EXISTS)
CREATE INDEX idx_borrowing_bookid ON Borrowing(book_id);

EXPLAIN PLAN FOR
SELECT m.member_id, m.f_name, m.L_name
FROM Members m
WHERE EXISTS (
    SELECT * FROM Borrowing b
    WHERE b.member_id = m.member_id
      AND b.duedate < SYSDATE
      AND b.returndate IS NULL
);
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
