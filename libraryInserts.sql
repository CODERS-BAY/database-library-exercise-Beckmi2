INSERT INTO author
    (author_firstname, author_lastname) VALUES
    ('Christine', 'Thürmer'),
    ('Nora', 'Roberts'),
    ('J.D.', 'Robb'),
    ('August', 'Zirner')
    ;

INSERT INTO publishinghouse
    (publishingHouse_name) VALUES
    ('Blanvalet Taschenbuch Verlag'),
    ('MIRA Taschenbuch'),
    ('NG Taschenbuch');

INSERT INTO book
    (isbn, book_title, publishingHouse_id) VALUES
    ('B08MCCFR7K', 'Nach dem Sturm', 1),
    ('B00HCBCVPW','Ein sündiges Alibi',1),
    ('978-3745701715', 'Wo Weihnachtsträume wahr werden', 2),
    ('978-3492404884', 'Laufen. Essen. Schlafen.: Eine Frau, drei Trails und 12.700 Kilometer Wildnis', 3);
ALTER TABLE book
MODIFY book_title VARCHAR(100) NOT NULL;

INSERT INTO book_author
    (isbn, author_id) VALUES
    ('978-3492404884', 1),
    ('978-3745701715', 2),
    ('B00HCBCVPW', 3),
    ('B08MCCFR7K', 2);

/*
 Buch 'Ella und Laura: Von den Müttern unserer Väter'
 Von: Ana und August Zirner
 Verlag: 'Piper ebooks'
 */
 INSERT INTO publishinghouse
    (publishingHouse_name) VALUES
    ('Piper ebooks');
INSERT INTO book
    (isbn, book_title, publishingHouse_id) VALUES
    ('B092LCM6Z7', 'Ella und Laura: Von den Müttern unserer Väter', 4);
INSERT INTO author
    (author_firstname, author_lastname) VALUES
    ('Ana', 'Zirner');
INSERT INTO book_author
    (isbn, author_id) VALUES
    ('B092LCM6Z7', 4),
    ('B092LCM6Z7', 5);
SELECT b.isbn, b.book_title, CONCAT(a.author_firstname, " ", a.author_lastname), p.publishingHouse_name FROM book b
INNER JOIN book_author ba ON b.isbn = ba.isbn
INNER JOIN author a ON ba.author_id = a.author_id
INNER JOIN publishinghouse p ON b.publishingHouse_id = p.publishingHouse_id
ORDER BY b.isbn ASC;


/*********************************************************************************
 Zeitschrift 'Mein schöner Garten'
 12 Ausgaben pro Jahr
 Verlag: Hubert Burda Media
 */
INSERT INTO publishinghouse
    (publishingHouse_name) VALUES
    ('Hubert Burda Media');
INSERT INTO journal
    (journal_name, issues_per_year, publishingHouse_id) VALUES
    ('Mein schöner Garten', 12, 5);
INSERT INTO subjectarea
    (subjectArea_name) VALUES
    ('Garten'),
    ('Kinder'),
    ('Erziehung'),
    ('Sport'),
    ('Pferd'),
    ('Hund'),
    ('Mode'),
    ('Roman'),
    ('Geschichte');
INSERT INTO journal_subjectarea
    (journal_id, subjectArea_id) VALUES
    (1,1);

INSERT INTO book_subjectarea
    (isbn, subjectArea_id) VALUES
    ('978-3492404884', 8),
    ('978-3745701715', 8),
    ('B00HCBCVPW', 8),
    ('B08MCCFR7K', 8),
    ('B092LCM6Z7', 8);

INSERT INTO publishedissue
    (issue_year, issue_nr, issue_date, journal_id) VALUES
    (2020, 1, '2020-01-01', 1),
    (2020, 2, '2020-02-01', 1),
    (2020, 3, '2020-01-01', 1),
    (2020, 4, '2020-01-01', 1),
    (2020, 5, '2020-01-01', 1),
    (2020, 6, '2020-01-01', 1),
    (2020, 7, '2020-01-01', 1),
    (2020, 8, '2020-01-01', 1),
    (2020, 9, '2020-01-01', 1),
    (2020, 10, '2020-01-01', 1),
    (2020, 11, '2020-01-01', 1),
    (2020, 12, '2020-01-01', 1);

INSERT INTO article (article_title, issue_id) VALUES
    ('Hochbeet bauen', 1),
    ('was heißt BIO?', 1),
    ('Der eigene Spielplatz im eigenen Garten', 1);
DELETE FROM article
WHERE article_id IN (4,5,6);

INSERT INTO article_author (article_id, author_id) VALUES
    (1,1),
    (2,1),
    (3,1);

INSERT INTO keyword (keyword) VALUES
    ('Schaukel'),
    ('Rutsche'),
    ('Spielplatz'),
    ('Erde'),
    ('Schnecken'),
    ('Schädlinge'),
    ('Hochbeet'),
    ('Bio'),
    ('Gemüse anbauen'),
    ('Liebesroman'),
    ('Geschichtsroman'),
    ('Krimi'),
    ('Thriller'),
    ('Abenteuer');

INSERT INTO keyword_synonym (keyword_id, synonym_id) VALUES
    (5,6);

INSERT INTO article_keyword_relevance (article_id, keyword_id, relevance) VALUES
    (1,5,7),
    (1,6,7),
    (1,7,10),
    (1,8,8),
    (1,9,9);

INSERT INTO book_keyword_relevance (isbn, keyword_id, relevance) VALUES
    ('B00HCBCVPW', 12, 10),
    ('B00HCBCVPW', 14, 5),
    ('978-3492404884', 14, 10),
    ('978-3745701715', 10, 10),
    ('978-3745701715', 14, 7);

INSERT INTO customer (customer_firstname, customer_lastname) VALUES
    ('Michaela', 'Schmidleitner'),
    ('Max', 'Schmidleitner'),
    ('Gert', 'Schmidleitner'),
    ('Carolin', 'Schmidleitner'),
    ('Paul', 'Müller'),
    ('Jasmin', 'Zaunbauer');

INSERT INTO employee (employee_firstname, employee_lastname) VALUES
    ('Michaela', 'Bauer'),
    ('Max', 'Mustermann'),
    ('Gert', 'Neuhuber'),
    ('Carolin', 'Sauer'),
    ('Paul', 'Gross'),
    ('Jasmin', 'Neuner');

INSERT INTO shelf (shelf_location, subjectArea_id) VALUES
    ('Erdgeschoß', 1),
    ('Erdgeschoß', 1),
    ('Erdgeschoß', 2),
    ('Erdgeschoß', 2),
    ('Erdgeschoß', 2),
    ('Erdgeschoß', 2),
    ('1. Stock', 3),
    ('1. Stock', 4),
    ('1. Stock', 5),
    ('1. Stock', 6),
    ('2. Stock', 7),
    ('2. Stock', 8),
    ('2. Stock', 8),
    ('2. Stock', 8),
    ('2. Stock', 8),
    ('2. Stock', 9);

INSERT INTO physicalbook (isbn, shelf_id) VALUES
    ('978-3492404884', 8),
    ('978-3745701715', 8),
    ('978-3745701715', 8),
    ('B00HCBCVPW', 8),
    ('B00HCBCVPW', 8),
    ('B00HCBCVPW', 8),
    ('B092LCM6Z7', 8);

INSERT INTO reservation (physicalBook_id, customer_id, loan_id) VALUES
    (1, 1, null),
    (2,1,null);

INSERT INTO loan (physicalBook_id, customer_id, responsible_for_loan, responsible_for_return) VALUES
    (3, 2, 1, null),
    (4, 2, 1, null),
    (5, 2, 1, null);

INSERT INTO reservation (physicalBook_id, customer_id, loan_id) VALUES
    (5, 2, 3);