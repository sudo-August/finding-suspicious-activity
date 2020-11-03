DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS credit_card;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS card_holder;
DROP TABLE IF EXISTS merchant_category;


CREATE TABLE card_holder (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE merchant_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE credit_card (
    card BIGSERIAL PRIMARY KEY,
    card_holder_id SERIAL,
    FOREIGN KEY (card_holder_id) REFERENCES card_holder(id)
);

CREATE TABLE merchant (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category INT NOT NULL,
    FOREIGN KEY (category) REFERENCES merchant_category(id)
);

CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    date TIMESTAMP NOT NULL,
    amount FLOAT NOT NULL,
    card BIGSERIAL NOT NULL,
    merchant_id INT NOT NULL,
    FOREIGN KEY (card) REFERENCES credit_card(card),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);