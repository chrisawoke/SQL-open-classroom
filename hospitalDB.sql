DROP DATABASE IF EXISTS hospital_mgtDB;
CREATE DATABASE hospital_mgtDB;
USE hospital_mgtDB;

-- Assignment
-- How do you ensure that the server generates non-numeric primary keys?

-- Create Relevant Tables
CREATE TABLE insurance (
    insurance_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    insurance_provider VARCHAR(100),
    policy_number VARCHAR(50),
    coverage_type ENUM('Full', 'Partial') DEFAULT 'Full',
    start_date DATE,
    end_date DATE
);

-- Add the patient_id as a foreign key to insurance
ALTER TABLE insurance
ADD FOREIGN KEY (patient_id)
REFERENCES patients(patient_id);


DROP TABLE IF EXISTS patients;
CREATE TABLE patients (
    patient_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    date_of_birth DATE,
    address VARCHAR(200),
    phone INT,
    email VARCHAR(150),
    insurance_id INT,
    FOREIGN KEY (insurance_id)
        REFERENCES insurance (insurance_id)
);

CREATE TABLE doctors (
    doctor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(35),
    last_name VARCHAR(35),
    specialization VARCHAR(100),
    phone_number VARCHAR(100),
    email VARCHAR(150)
);

CREATE TABLE appointments (
    appointment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    FOREIGN KEY (patient_id)
        REFERENCES patients (patient_id),
    doctor_id INT,
    FOREIGN KEY (doctor_id)
        REFERENCES doctors (doctor_id),
    appointment_date DATE,
    appointment_reason TEXT,
    status ENUM('Present', 'Absent', 'Unavailable') DEFAULT 'Unavailable'
);

      		
