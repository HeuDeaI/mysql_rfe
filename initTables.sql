-- DROP TABLE  BookAuthor;
-- DROP TABLE  Loan;
-- DROP TABLE  Book;
-- DROP TABLE  Author;
-- DROP TABLE  Reader;


CREATE TABLE Reader (
    reader_id INT PRIMARY KEY IDENTITY(1, 1),
    first_name VARCHAR(31) NOT NULL,
    last_name VARCHAR(31) NOT NULL,
    phone_number VARCHAR(20) CHECK (phone_number LIKE '+375[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    email VARCHAR(255) CHECK (email LIKE '%_@%_%._%')
);

CREATE TABLE Author (
    author_id INT PRIMARY KEY IDENTITY(1, 1),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE Book (
    book_id INT PRIMARY KEY IDENTITY(1, 1),
    title VARCHAR(255) NOT NULL,
    publication_year INT CHECK (publication_year > 0),
    genre VARCHAR(100)
);

CREATE TABLE BookAuthor (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Loan (
    loan_id INT PRIMARY KEY IDENTITY(1, 1),
    book_id INT,
    reader_id INT,
    issue_date DATE NOT NULL DEFAULT(CAST(CURRENT_TIMESTAMP AS DATE)),
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (reader_id) REFERENCES Reader(reader_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (return_date > issue_date)
);