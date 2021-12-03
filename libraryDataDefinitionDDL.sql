CREATE DATABASE IF NOT EXISTS library;
USE library;

CREATE TABLE author (
    author_id INT AUTO_INCREMENT,
    author_firstname VARCHAR(30),
    author_lastname VARCHAR(30) NOT NULL,
    PRIMARY KEY (author_id)
);
ALTER TABLE author
ADD author_lastname VARCHAR(30) NOT NULL;

ALTER TABLE author
DROP author_lastname;



CREATE TABLE book (
    isbn VARCHAR(30),
    book_title VARCHAR(60)  NOT NULL,
    publishingHouse_id INT NOT NULL,
    PRIMARY KEY (isbn)
);

CREATE TABLE book_author (
    isbn VARCHAR(60),
    author_id INT,
    PRIMARY KEY (isbn, author_id)
);

CREATE TABLE article (
    article_id INT AUTO_INCREMENT,
    article_title VARCHAR(60) NOT NULL,
    issue_id INT NOT NULL,
    PRIMARY KEY (article_id)
);

CREATE TABLE article_author (
    article_id INT,
    author_id INT,
    PRIMARY KEY (article_id, author_id)
);

CREATE TABLE publishingHouse (
    publishingHouse_id INT AUTO_INCREMENT,
    publishingHouse_name VARCHAR(40),
    PRIMARY KEY (publishingHouse_id)
);

CREATE TABLE journal (
    journal_id INT AUTO_INCREMENT,
    journal_name VARCHAR(60) NOT NULL,
    issues_per_year INT,
    publishingHouse_id INT NOT NULL,
    PRIMARY KEY (journal_id)
);
DROP table journal;

CREATE TABLE subjectArea (
    subjectArea_id INT AUTO_INCREMENT,
    subjectArea_name VARCHAR(30),
    PRIMARY KEY (subjectArea_id)
);

CREATE TABLE book_subjectArea (
    isbn VARCHAR(30),
    subjectArea_id  INT,
    PRIMARY KEY (isbn, subjectArea_id)
);

CREATE TABLE journal_subjectArea (
    journal_id INT,
    subjectArea_id INT,
    PRIMARY KEY (journal_id, subjectArea_id)
);


CREATE TABLE publishedIssue (
    issue_id INT AUTO_INCREMENT,
    issue_year INT NOT NULL,
    issue_nr INT NOT NULL,
    issue_date DATE,
    journal_id INT NOT NULL
    PRIMARY KEY (issue_id),
    UNIQUE (issue_year, issue_nr)
);
DROP TABLE publishedIssue;

CREATE TABLE  physicalBook (
    physicalBook_id INT AUTO_INCREMENT,
    isbn VARCHAR(30) NOT NULL,
    shelf_id INT NOT NULL,
    PRIMARY KEY (physicalBook_id)
);

CREATE TABLE shelf (
    shelf_id INT AUTO_INCREMENT,
    shelf_location VARCHAR(30) NOT NULL,
    subjectArea_id  INT NOT NULL,
    PRIMARY KEY (shelf_id)
);

CREATE TABLE book_keyword_relevance (
    isbn VARCHAR(30),
    keyword_id INT,
    relevance INT NOT NULL,
    PRIMARY KEY (isbn, keyword_id)
);

CREATE TABLE article_keyword_relevance (
    article_id INT,
    keyword_id INT,
    relevance INT NOT NULL,
    PRIMARY KEY (article_id, keyword_id)
);

CREATE TABLE keyword (
    keyword_id INT AUTO_INCREMENT,
    keyword VARCHAR(30) NOT NULL,
    PRIMARY KEY (keyword_id)
);

CREATE TABLE keyword_synonym (
    keyword_id  INT,
    synonym_id  INT,
    PRIMARY KEY (keyword_id,synonym_id)
);

CREATE TABLE reservation (
    reservation_id  INT AUTO_INCREMENT,
    reservation_date DATE NOT NULL DEFAULT now(),
    physicalBook_id INT NOT NULL,
    customer_id INT NOT NULL,
    loan_id INT,
    PRIMARY KEY (reservation_id)
);

CREATE TABLE loan (
    loan_id INT AUTO_INCREMENT,
    loan_date DATE NOT NULL DEFAULT now(),
    physicalBook_id INT NOT NULL,
    customer_id INT NOT NULL,
    responsible_for_loan INT NOT NULL,
    responsible_for_return INT,
    PRIMARY KEY (loan_id),
    UNIQUE (loan_date, physicalBook_id, customer_id)
);
DROP TABLE loan;

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT,
    customer_firstname VARCHAR(30) NOT NULL,
    customer_lastname VARCHAR(30) NOT NULL,
    PRIMARY KEY (customer_id)
);
DROP TABLE customer;

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT,
    employee_firstname VARCHAR(30) NOT NULL,
    employee_lastname VARCHAR(30) NOT NULL,
    PRIMARY KEY (employee_id)
);
DROP TABLE employee;

/*****************************************************************************
 ************************   foreign keys   ***********************************
 *****************************************************************************/
ALTER TABLE book
ADD FOREIGN KEY (publishingHouse_id) REFERENCES publishingHouse (publishingHouse_id);

ALTER TABLE book_author
ADD FOREIGN KEY (isbn) REFERENCES book(isbn);

ALTER TABLE book_author
ADD FOREIGN KEY (author_id) REFERENCES author (author_id);

ALTER TABLE article
ADD FOREIGN KEY (issue_id) REFERENCES publishedIssue (issue_id);

ALTER TABLE article_author
ADD FOREIGN KEY (article_id) REFERENCES article (article_id),
ADD FOREIGN KEY (author_id) REFERENCES author (author_id);

ALTER TABLE journal
ADD FOREIGN KEY (publishingHouse_id) REFERENCES publishingHouse (publishingHouse_id);

ALTER TABLE book_subjectArea
ADD FOREIGN KEY (isbn) REFERENCES book(isbn),
ADD FOREIGN KEY (subjectArea_id) REFERENCES subjectArea (subjectArea_id);

ALTER TABLE journal_subjectArea
ADD FOREIGN KEY (journal_id) REFERENCES journal (journal_id),
ADD FOREIGN KEY (subjectArea_id) REFERENCES subjectArea (subjectArea_id);

ALTER TABLE publishedIssue
ADD FOREIGN KEY (journal_id) REFERENCES journal (journal_id);

ALTER TABLE physicalBook
ADD FOREIGN KEY (isbn) REFERENCES book (isbn),
ADD FOREIGN KEY (shelf_id) REFERENCES shelf (shelf_id);

ALTER TABLE shelf
ADD FOREIGN KEY (subjectArea_id) REFERENCES subjectArea (subjectArea_id);

ALTER TABLE book_keyword_relevance
ADD FOREIGN KEY (isbn) REFERENCES book (isbn),
ADD FOREIGN KEY (keyword_id) REFERENCES  keyword (keyword_id);

ALTER TABLE article_keyword_relevance
ADD FOREIGN KEY (article_id) REFERENCES article (article_id),
ADD FOREIGN KEY (keyword_id) REFERENCES keyword (keyword_id);

ALTER TABLE keyword_synonym
ADD FOREIGN KEY (keyword_id)  REFERENCES keyword (keyword_id),
ADD FOREIGN KEY (synonym_id) REFERENCES keyword (keyword_id);

ALTER TABLE reservation
ADD FOREIGN KEY (physicalBook_id) REFERENCES physicalBook (physicalBook_id),
ADD FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
ADD FOREIGN KEY (loan_id) REFERENCES loan (loan_id);

ALTER TABLE loan
ADD FOREIGN KEY (physicalBook_id) REFERENCES physicalBook (physicalBook_id),
ADD FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
ADD FOREIGN KEY (responsible_for_loan) REFERENCES employee (employee_id),
ADD FOREIGN KEY (responsible_for_return) REFERENCES employee (employee_id);