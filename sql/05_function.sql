-- Function: calculate the late-return fee (2 per late day)

CREATE OR REPLACE FUNCTION calculatedept(p_borrow_id IN NUMBER)
RETURN NUMBER IS
    v_due    DATE;
    v_return DATE;
    v_dept   NUMBER := 0;
BEGIN
    SELECT duedate, returndate
    INTO v_due, v_return
    FROM Borrowing
    WHERE borrow_id = p_borrow_id;

    IF v_return > v_due THEN
        v_dept := (v_return - v_due) * 2;
    END IF;
    RETURN v_dept;
END;
/

-- Test
SET SERVEROUTPUT ON;
DECLARE
    v_borrow_id NUMBER;
    v_dept      NUMBER;
BEGIN
    v_borrow_id := &borrow_id;
    v_dept := calculatedept(v_borrow_id);
    DBMS_OUTPUT.PUT_LINE('calculated dept amount: ' || v_dept);
END;
/
