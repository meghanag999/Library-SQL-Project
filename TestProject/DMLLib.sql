insert into Author (name) VALUES
('J.K Rowling'),
('Harper Lee'),
('Stephen King'),
('Agatha Christie'),
('Dr. Seuss'),
('George Orwell'),
('Toni Morrison'),
('Jenny Port');


INSERT INTO Book (name, audience) VALUES 
('Harry Potter and the Chamber of Secrets', 'middle school'),
('To Kill a Mockingbird', 'young adult'),
('The Shining', 'adult'),
('Murder on the Orient Express', 'teen'),
('The Cat in the Hat', 'elementary'),
('1984', 'teen'),
('Beloved', 'adult');


insert into Genre (genre_type) VALUES
('Horror'),
('Romance'),
('Mystery'),
('Fantasy'),
('Nursery'),
('Thriller'),
('Dystopian'),
('Historical'),
('Sci-Fi');



INSERT INTO Membership (firstname, lastname, status) VALUES 
('John', 'Doe', 'active'),
('Jane', 'Smith', 'inactive'),
('Alice', 'Johnson', 'active'),
('Michael', 'Brown', 'inactive'),
('Emily', 'Davis', 'active'),
('Marie','Clark','active'),
('Jack', 'Roberts', 'inactive'),
('Nicole','Berry','active'),
('Harry','Klein','inactive'),
('Megan','Stanza','inactive');



INSERT INTO Waitlist (book_id, member_id)
SELECT b.book_id, m.member_id
FROM Book b
JOIN Membership m ON 
    (b.name = 'Harry Potter and the Chamber of Secrets' AND m.firstname = 'John') OR
    (b.name = 'The Shining' AND m.firstname = 'Alice') OR
	(b.name = 'To Kill a Mockingbird' AND m.firstname = 'Emily') OR
	(b.name = '1984' AND m.firstname = 'Marie') OR
    (b.name = 'Beloved' AND m.firstname = 'Nicole');



INSERT INTO book_genre (book_id, genre_id)
SELECT b.book_id, g.genre_id
FROM Book b
JOIN Genre g ON 
    (b.name = 'Harry Potter and the Chamber of Secrets' AND g.genre_type = 'Fantasy') OR
    (b.name = 'To Kill a Mockingbird' AND g.genre_type = 'Historical') OR
    (b.name = 'The Shining' AND g.genre_type = 'Horror') OR
	(b.name = 'The Shining' AND g.genre_type = 'Thriller') OR
    (b.name = 'Murder on the Orient Express' AND g.genre_type = 'Mystery') OR
	(b.name = 'Murder on the Orient Express' AND g.genre_type = 'Thriller') OR
    (b.name = 'The Cat in the Hat' AND g.genre_type = 'Nursery') OR
    (b.name = '1984' AND g.genre_type = 'Dystopian') OR
	(b.name = '1984' AND g.genre_type = 'Romance') OR
	(b.name = 'To Kill a Mockingbird' AND g.genre_type = 'Thriller') OR
    (b.name = 'Beloved' AND g.genre_type = 'Historical') OR
	(b.name = 'Beloved' AND g.genre_type = 'Romance');



INSERT INTO Book_Author (book_id, author_id)
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'Harry Potter and the Chamber of Secrets' AND a.name = 'J.K Rowling'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'To Kill a Mockingbird' AND a.name = 'Harper Lee'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'The Shining' AND a.name = 'Stephen King'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'Murder on the Orient Express' AND a.name = 'Agatha Christie'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'The Cat in the Hat' AND a.name = 'Dr. Seuss'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = '1984' AND a.name = 'George Orwell'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'Beloved' AND a.name = 'Toni Morrison'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'The Shining' AND a.name = 'J.K Rowling'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = '1984' AND a.name = 'Harper Lee'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'The Shining' AND a.name = 'Agatha Christie'
UNION ALL
SELECT b.book_id, a.author_id
FROM Book b
JOIN Author a ON b.name = 'Beloved' AND a.name = 'George Orwell';



INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 50, 'hard cover'
FROM Book b
WHERE b.name = 'Harry Potter and the Chamber of Secrets'; 

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 100, 'soft cover'
FROM Book b
WHERE b.name = 'Harry Potter and the Chamber of Secrets';


INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 75, 'hard cover'
FROM Book b
WHERE b.name = 'To Kill a Mockingbird'; 

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 80, 'soft cover'
FROM Book b
WHERE b.name = 'To Kill a Mockingbird'; 


INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 20, 'soft cover'
FROM Book b
WHERE b.name = 'The Shining';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 20, 'hard cover'
FROM Book b
WHERE b.name = 'The Shining';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 30, 'hard cover'
FROM Book b
WHERE b.name = 'Murder on the Orient ';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 60, 'soft cover'
FROM Book b
WHERE b.name = 'Murder on the Orient ';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 37, 'soft cover'
FROM Book b
WHERE b.name = 'The Cat in the Hat';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 12, 'hard cover'
FROM Book b
WHERE b.name = 'The Cat in the Hat';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 11, 'soft cover'
FROM Book b
WHERE b.name = '1984';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 29, 'hard cover'
FROM Book b
WHERE b.name = '1984';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 45, 'soft cover'
FROM Book b
WHERE b.name = 'Beloved';

INSERT INTO Book_Copies (book_id, num_copies, cover_type)
SELECT b.book_id, 45, 'hard cover'
FROM Book b
WHERE b.name = 'Beloved';





INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-11-01', '2023-12-01', 'not returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'John' AND m.lastname = 'Doe' 
WHERE bc.cover_type = 'hard cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = 'The Shining'
);

INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-10-15', '2023-11-15', 'not returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'Alice' AND m.lastname = 'Jonhson' 
WHERE bc.cover_type = 'soft cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = 'To Kill a Mockingbird'
);

INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-9-10', '2023-10-15', 'returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'Emily' AND m.lastname = 'Davis' 
WHERE bc.cover_type = 'hard cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = '1984'
);

INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-8-07', '2023-9-07', 'returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'Marie' AND m.lastname = 'Clark' 
WHERE bc.cover_type = 'hard cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = 'Beloved'
);

INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-8-07', '2023-9-07', 'returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'Marie' AND m.lastname = 'Clark' 
WHERE bc.cover_type = 'soft cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = 'The Shining'
);

INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-8-07', '2023-9-07', 'returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'Nicole' AND m.lastname = 'Berry' 
WHERE bc.cover_type = 'soft cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = 'The Cat in the Hat'
);
INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-9-10', '2023-10-10', 'not returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'Nicole' AND m.lastname = 'Berry' 
WHERE bc.cover_type = 'hard cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = 'The Shining'
);


INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-8-13', '2023-9-13', 'not returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'John' AND m.lastname = 'Doe' 
WHERE bc.cover_type = 'soft cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = '1984'
);

INSERT INTO Book_Check_Out (member_id, copies_id, check_out_date, return_date, status_return)
SELECT m.member_id, bc.copies_id, '2023-8-07', '2023-9-07', 'returned'
FROM Membership m
JOIN Book_Copies bc ON m.firstname = 'Emily' AND m.lastname = 'Davis' 
WHERE bc.cover_type = 'hard cover' AND bc.book_id = (
    SELECT book_id FROM Book WHERE name = 'The Shining'
);

INSERT INTO Unreturned_Books (member_id, copies_id)
SELECT member_id, copies_id
FROM Book_Check_Out
WHERE status_return = 'not returned';




