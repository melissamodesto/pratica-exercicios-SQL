CREATE DATABASE nullbank;

CREATE TABLE states (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	"stateId" INTEGER REFERENCES "states"("id")
);

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	"fullName" VARCHAR(200) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	password VARCHAR (50) NOT NULL
);


CREATE TABLE "customerAddresses" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES "customers"("id") UNIQUE,
	street VARCHAR(100) NOT NULL,
	number INTEGER,
	complement VARCHAR(20),
	"postalCode" VARCHAR(10) NOT NULL,
	"cityId" INTEGER REFERENCES "cities"("id")
);

CREATE TABLE "customerPhones" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES "customers"("id"),
	number TEXT NOT NULL, --+55
	type TEXT DEFAULT 'mobile' NOT NULL
);


CREATE TABLE "bankAccount" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER REFERENCES "customers"("id"),
	"accountNumber" VARCHAR(10) NOT NULL,
	agency VARCHAR(6) NOT NULL,
	"openDate" DATE DEFAULT NOW() NOT NULL,
	"closeDate" DATE
);



CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER REFERENCES "bankAccount"("id"),
	amount INTEGER NOT NULL,
	type VARCHAR(10), --credit OR debit
	time TIME NOT NULL DEFAULT NOW(),
	description TEXT,
	cancelled BOOLEAN DEFAULT FALSE NOT NULL
);


CREATE TABLE "creditCards" (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER REFERENCES "bankAccount"("id"),
	name TEXT NOT NULL,
	"securityCode" VARCHAR(3) NOT NULL,
	expirantionMonth VARCHAR(2) NOT NULL,
	expirantionYear INTEGER NOT NULL,
	password TEXT NOT NULL,
	"limit" INTEGER NOT NULL
);