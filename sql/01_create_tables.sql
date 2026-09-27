-- Library Management System: table definitions (Oracle)

DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE Borrowing CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE Members CASCADE CONSTRAINTS;
DROP TABLE Books CASCADE CONSTRAINTS;

CREATE TABLE Books (
    book_id   NUMBER PRIMARY KEY,
    title     VARCHAR2(50) NOT NULL,
    author    VARCHAR2(50) NOT NULL,
    quantity  NUMBER
);

CREATE TABLE Members (
    member_id NUMBER PRIMARY KEY,
    f_name    VARCHAR2(10),
    L_name    VARCHAR2(20),
    email     VARCHAR2(40)
);

CREATE TABLE Borrowing (
    borrow_id  NUMBER PRIMARY KEY,
    member_id  NUMBER,
    book_id    NUMBER,
    borrowdate DATE,
    duedate    DATE,
    returndate DATE,
    CONSTRAINT fk_borrow_member FOREIGN KEY (member_id) REFERENCES Members(member_id),
    CONSTRAINT fk_borrow_book   FOREIGN KEY (book_id)   REFERENCES Books(book_id)
);

CREATE TABLE Users (
    userId   NUMBER PRIMARY KEY,
    username VARCHAR2(50),
    password VARCHAR2(10) NOT NULL,
    role     VARCHAR2(50)
);

CREATE TABLE payment (
    payment_id  NUMBER PRIMARY KEY,
    borrow_id   NUMBER,
    member_id   NUMBER,
    deptamount  NUMBER(10,2),
    paymentdate DATE,
    status      VARCHAR2(10),
    CONSTRAINT fk_payment_borrow FOREIGN KEY (borrow_id) REFERENCES Borrowing(borrow_id),
    CONSTRAINT fk_payment_member FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
