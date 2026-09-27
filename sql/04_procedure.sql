-- Procedure: return a book (sets the return date to today)

CREATE OR REPLACE PROCEDURE returnbook(p_borrow_id IN NUMBER) IS
BEGIN
    UPDATE Borrowing
    SET returndate = SYSDATE
    WHERE borrow_id = p_borrow_id;
    DBMS_OUTPUT.PUT_LINE('the book has been returned');
END;
/

-- Test
SET SERVEROUTPUT ON;
DECLARE
    v_borrow_id NUMBER;
BEGIN
    v_borrow_id := &borrow_id;
    returnbook(v_borrow_id);
END;
/
