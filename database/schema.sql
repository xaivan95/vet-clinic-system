-- Database Schema for Vet Clinic System

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE veterinarians (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE owners (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES owners(id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE medical_records (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT,
    visit_date DATETIME,
    notes TEXT,
    FOREIGN KEY (pet_id) REFERENCES pets(id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE vaccinations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT,
    vaccination_date DATETIME,
    vaccine_name VARCHAR(100),
    FOREIGN KEY (pet_id) REFERENCES pets(id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pet_id INT,
    appointment_date DATETIME,
    veterinarian_id INT,
    FOREIGN KEY (pet_id) REFERENCES pets(id),
    FOREIGN KEY (veterinarian_id) REFERENCES veterinarians(id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE invoices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT,
    amount DECIMAL(10, 2),
    invoice_date DATETIME,
    FOREIGN KEY (owner_id) REFERENCES owners(id),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE services (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);