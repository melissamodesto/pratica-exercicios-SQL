CREATE DATABASE drivencommerce;

CREATE TABLE "ordersState" (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE states (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	"stateId" INTEGER REFERENCES "states"("id")
);

CREATE TABLE addresses (
	id SERIAL PRIMARY KEY,
	street TEXT NOT NULL,
	number INTEGER NOT NULL,
	complement TEXT NOT NULL,
	"cityId" INTEGER REFERENCES "cities"("id")
);

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	date DATE DEFAULT NOW(),
	"userId" INTEGER NOT NULL,
	"addressId" INTEGER NOT NULL,
	"stateId" INTEGER REFERENCES "ordersState"("id")
);

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	password TEXT NOT NULL,
	email TEXT NOT NULL,
	"addressId" INTEGER REFERENCES "addresses"("id")
);


CREATE TABLE sizes (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE categories (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE images (
	id SERIAL PRIMARY KEY,
	url TEXT NOT NULL
);


CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	price INTEGER NOT NULL,
	"mainImage" INTEGER REFERENCES "images"("id"),
	"categoryId" INTEGER REFERENCES "categories"("id"),
	"sizeId" INTEGER REFERENCES "sizes"("id")
);

CREATE TABLE "productsImages" (
	id SERIAL PRIMARY KEY,
	"productId" INTEGER REFERENCES "products"("id"),
	"imageId" INTEGER REFERENCES "images"("id") UNIQUE
);


CREATE TABLE "ordersProducts" (
	id SERIAL PRIMARY KEY,
	"orderId" INTEGER REFERENCES "orders"("id"),
	"productId" INTEGER REFERENCES "products"("id"),
	quantity INTEGER NOT NULL DEFAULT 0,
	"unityPrice" INTEGER
);