-- Trigger: prevent borrowing a book that is not available

CREATE OR REPLACE TRIGGER unavailableborrow
BEFORE INSERT ON Borrowing
FOR EACH ROW
DECLARE
    t_quantity NUMBER;
BEGIN
    SELECT quantity INTO t_quantity
    FROM Books
    WHERE book_id = :new.book_id;

    IF t_quantity <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'the book is not available!');
    END IF;
END;
/

-- Test: set a book's quantity to 0, then try to borrow it (raises ORA-20001)
UPDATE Books SET quantity = 0 WHERE book_id = 100;
INSERT INTO Borrowing (borrow_id, member_id, book_id, borrowdate, duedate, returndate)
VALUES (999, 101, 100, SYSDATE, SYSDATE + 7, NULL);
