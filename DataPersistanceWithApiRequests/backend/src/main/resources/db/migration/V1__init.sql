
CREATE TABLE book
(
    id    BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    title VARCHAR(255),
    CONSTRAINT pk_book PRIMARY KEY (id)
);