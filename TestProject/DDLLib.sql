CREATE TABLE Book_Author (
	book_id INT,
	author_id INT,
	PRIMARY KEY (book_id, author_id),
	FOREIGN KEY (book_id) REFERENCES Book (book_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (author_id) REFERENCES Author (author_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Book_Genre (
	book_id INT,
	genre_id INT,
	PRIMARY KEY (book_id, genre_id),
	FOREIGN KEY (book_id) REFERENCES Book (book_id) ON DELETE CASCADE,
	FOREIGN KEY (genre_id) REFERENCES Genre (genre_id)
);

CREATE TABLE Waitlist (
	book_id INT,
	member_id INT,
	PRIMARY KEY (book_id, member_id),
	FOREIGN KEY (book_id) REFERENCES Book (book_id) ON DELETE CASCADE,
	FOREIGN KEY (member_id) REFERENCES Membership (member_id) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Book_Copies (
	copies_id INT IDENTITY,
	book_id INT,
	num_copies INT NOT NULL,
	cover_type VARCHAR(20) CHECK ( cover_type IN ('hard cover', 'soft cover')),
	PRIMARY KEY (copies_id),
	UNIQUE (book_id, cover_type),
	FOREIGN KEY (book_id) REFERENCES Book (book_id) ON DELETE CASCADE
);

CREATE TABLE Book_Check_Out (
	check_out_id INT IDENTITY,
	member_id INT,
	copies_id INT,
	check_out_date DATE NOT NULL,
	return_date DATE NOT NULL,
	status_return VARCHAR (15) CHECK ( status_return IN ('returned', 'not returned')) NOT NULL,
	PRIMARY KEY (check_out_id),
	FOREIGN KEY (member_id) REFERENCES Membership (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (copies_id) REFERENCES Book_Copies (copies_id)
);
CREATE TABLE Unreturned_Books (
    unreturned_id INT IDENTITY,
    member_id INT,
    copies_id INT,
    status_return VARCHAR(15) DEFAULT 'not returned',
    PRIMARY KEY (unreturned_id),
    FOREIGN KEY (member_id) REFERENCES Membership (member_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (copies_id) REFERENCES Book_Copies (copies_id)
);