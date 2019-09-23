CREATE TABLE tags
(
    pk INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tag VARCHAR(256)
);

CREATE TABLE authors
(
    pk INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(512),
    lastname VARCHAR(512),
    email VARCHAR(1024)
);

CREATE TABLE posts
(
    pk INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title TEXT,
    date TIMESTAMP,
    author INT NOT NULL,
    intro TEXT,
    content TEXT,
    FOREIGN KEY (author) REFERENCES authors(pk)
);

CREATE TABLE post_tags
(
    pk_posts INT NOT NULL,
    pk_tags INT NOT NULL,
    PRIMARY KEY (pk_posts, pk_tags),
    FOREIGN KEY (pk_posts) REFERENCES posts(pk) ON DELETE CASCADE,
    FOREIGN KEY (pk_tags) REFERENCES tags(pk) ON DELETE CASCADE
);

INSERT INTO authors (firstname, lastname, email)
VALUES ('Mateusz', 'Strzałkowski', 'strzamat@gmail.com');

INSERT INTO authors (firstname, lastname, email)
VALUES ('Bździągwa', 'Bździągwoliński', 'bzdziabzdziagwa@gmail.com');

INSERT INTO posts (title, intro, content, author)
VALUES ('Bździągwa', 'Bździągwoliński', 'bzdziabzdziabzdziaaa!!!!', 1),
 ('Bździągwa2', 'Bździągwoliński2', 'bzdziabzdziabzdziaaa?????', 1),
 ('Example', 'example of englisc', 'King Theoden mounted his steed and cried: forth riders of the Rohirrim!', 2);

INSERT INTO tags (tag)
VALUES ('śmieć'), ('englisc');

INSERT INTO post_tags VALUES
(1,1),(3,1),(3,2);

SELECT * FROM posts, authors WHERE posts.author=authors.pk;

SELECT * FROM posts INNER JOIN authors ON posts.author=authors.pk;

SELECT * FROM post_tags JOIN tags ON post_tags.pk_tags=tags.pk;

-- posty wg daty
SELECT title, firstname, lastname, date,  intro, content FROM posts INNER JOIN authors ON posts.author=authors.pk ORDER BY date DESC;

-- posty wedlug tagu
SELECT title, firstname, lastname, date,  intro, content FROM post_tags AS pt 
JOIN posts AS p ON pt.pk_posts = p.pk 
    INNER JOIN authors ON p.author=authors.pk
        JOIN tags AS t ON pk_tags = t.pk WHERE t.tag = 'englisc';

--chyba koniec