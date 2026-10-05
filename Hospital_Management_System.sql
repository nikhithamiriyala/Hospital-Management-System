-- Hospital Management System Project

-- =====================================================
-- STEP 1: DATABASE CREATION
-- =====================================================

CREATE DATABASE HospitalDB;
USE HospitalDB;

-- =====================================================
-- STEP 2: TABLE CREATION
-- =====================================================

-- Table 1: Branches
CREATE TABLE branches(
branch_id INT AUTO_INCREMENT PRIMARY KEY,
branch_name VARCHAR(50),
city VARCHAR(30)
);

-- Table 2: Hospitals
CREATE TABLE hospitals(
hospital_id INT AUTO_INCREMENT PRIMARY KEY,
hospital_name VARCHAR(60),
address VARCHAR(100),
branch_id INT,
FOREIGN KEY(branch_id)
REFERENCES branches(branch_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- Table 3: Specializations 
CREATE TABLE specializations(
specialization_id INT AUTO_INCREMENT PRIMARY KEY,
specialization_name VARCHAR(50),
min_salary DECIMAL(10,2),
max_salary DECIMAL(10,2)
);
-- Table 4: Departments
CREATE TABLE departments(
department_id INT AUTO_INCREMENT PRIMARY KEY,
department_name VARCHAR(50),
hospital_id INT,
FOREIGN KEY(hospital_id)
REFERENCES hospitals(hospital_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- Table 5: Doctors
CREATE TABLE doctors(
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
email VARCHAR(100),
phone VARCHAR(20),
joining_date DATE,
specialization_id INT,
salary DECIMAL(10,2),
department_id INT,

FOREIGN KEY(specialization_id)
REFERENCES specializations(specialization_id)
ON DELETE CASCADE
ON UPDATE CASCADE,

FOREIGN KEY(department_id)
REFERENCES departments(department_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- Table 6: Patients
CREATE TABLE patients(
patient_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender VARCHAR(10),
age INT,
phone VARCHAR(20),
doctor_id INT,

FOREIGN KEY(doctor_id)
REFERENCES doctors(doctor_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- Table 7: Appointments
CREATE TABLE appointments(
appointment_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATE,
appointment_time TIME,
status VARCHAR(20),

FOREIGN KEY(patient_id)
REFERENCES patients(patient_id)
ON DELETE CASCADE
ON UPDATE CASCADE,

FOREIGN KEY(doctor_id)
REFERENCES doctors(doctor_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- =====================================================
-- STEP 3: INSERT SAMPLE DATA
-- =====================================================

INSERT INTO branches
(branch_id, branch_name, city)
VALUES
(1, 'Apollo Care Branch', 'Hyderabad'),
(2, 'Sunrise Medical Branch', 'Vijayawada'),
(3, 'City Health Branch', 'Chennai'),
(4, 'LifeCare Branch', 'Bangalore'),
(5, 'Global Health Branch', 'Visakhapatnam');

-- SELECT * FROM branches;

INSERT INTO hospitals
(hospital_id, hospital_name, address, branch_id)
VALUES
(1, 'Apollo Care Hospital', 'Banjara Hills', 1),
(2, 'Sunrise Medical Center', 'M.G. Road', 2),
(3, 'City Health Hospital', 'Anna Nagar', 3),
(4, 'LifeCare Hospital', 'Whitefield', 4),
(5, 'Global Health Hospital', 'MVP Colony', 5),
(6, 'Apollo Care Hospital - Secunderabad', 'Secunderabad', 1),
(7, 'Sunrise Medical Center - Guntur', 'Brodipet', 2);

-- SELECT * FROM hospitals;

INSERT INTO specializations
(specialization_id, specialization_name, min_salary, max_salary)
VALUES
(1, 'Cardiology', 120000.00, 300000.00),
(2, 'Neurology', 130000.00, 320000.00),
(3, 'Orthopedics', 100000.00, 250000.00),
(4, 'Pediatrics', 80000.00, 180000.00),
(5, 'Dermatology', 90000.00, 220000.00),
(6, 'General Medicine', 70000.00, 160000.00),
(7, 'Gynecology', 100000.00, 240000.00),
(8, 'Oncology', 150000.00, 350000.00),
(9, 'ENT', 75000.00, 170000.00),
(10, 'Radiology', 90000.00, 220000.00);

-- SELECT * FROM specializations;

INSERT INTO departments
(department_id, department_name, hospital_id)
VALUES
(1, 'Cardiology Department', 1),
(2, 'Neurology Department', 1),
(3, 'Orthopedics Department', 2),
(4, 'Pediatrics Department', 2),
(5, 'Dermatology Department', 3),
(6, 'General Medicine Department', 3),
(7, 'Gynecology Department', 4),
(8, 'Oncology Department', 4),
(9, 'ENT Department', 5),
(10, 'Radiology Department', 5);

-- SELECT * FROM departments;

INSERT INTO doctors
(doctor_id, first_name, last_name, email, phone, joining_date, specialization_id, salary, department_id)
VALUES
(1, 'Ravi', 'Kumar', 'ravi.kumar@gmail.com', '9876543210', '2022-06-15', 1, 180000.00, 1),
(2, 'Anita', 'Sharma', 'anita.sharma@gmail.com', '9876543211', '2021-08-20', 2, 200000.00, 2),
(3, 'Suresh', 'Reddy', 'suresh.reddy@gmail.com', '9876543212', '2023-01-10', 3, 150000.00, 3),
(4, 'Priya', 'Patel', 'priya.patel@gmail.com', '9876543213', '2022-11-05', 4, 120000.00, 4),
(5, 'Arjun', 'Rao', 'arjun.rao@gmail.com', '9876543214', '2020-04-18', 5, 140000.00, 5),
(6, 'Kavya', 'Reddy', 'kavya.reddy@gmail.com', '9876543215', '2023-07-12', 6, 100000.00, 6),
(7, 'Vikram', 'Singh', 'vikram.singh@gmail.com', '9876543216', '2021-03-25', 7, 160000.00, 7),
(8, 'Meena', 'Iyer', 'meena.iyer@gmail.com', '9876543217', '2019-09-30', 8, 220000.00, 8),
(9, 'Rahul', 'Verma', 'rahul.verma@gmail.com', '9876543218', '2022-02-14', 9, 110000.00, 9),
(10, 'Sneha', 'Das', 'sneha.das@gmail.com', '9876543219', '2023-05-22', 10, 150000.00, 10);

-- SELECT * FROM doctors;

INSERT INTO patients
(patient_id, first_name, last_name, gender, age, phone, doctor_id)
VALUES
(1, 'Akhil', 'Rao', 'Male', 35, '9000000001', 1),
(2, 'Lakshmi', 'Devi', 'Female', 42, '9000000002', 2),
(3, 'Kiran', 'Kumar', 'Male', 28, '9000000003', 3),
(4, 'Swathi', 'Reddy', 'Female', 31, '9000000004', 4),
(5, 'Manoj', 'Sharma', 'Male', 55, '9000000005', 5),
(6, 'Divya', 'Patel', 'Female', 24, '9000000006', 6),
(7, 'Ramesh', 'Rao', 'Male', 63, '9000000007', 7),
(8, 'Anjali', 'Iyer', 'Female', 47, '9000000008', 8),
(9, 'Vijay', 'Das', 'Male', 39, '9000000009', 9),
(10, 'Pooja', 'Singh', 'Female', 29, '9000000010', 10);

-- SELECT * FROM patients;

INSERT INTO appointments
(appointment_id, patient_id, doctor_id, appointment_date, appointment_time, status)
VALUES
(1, 1, 1, '2026-10-06', '09:30:00', 'Completed'),
(2, 2, 2, '2026-10-06', '10:00:00', 'Scheduled'),
(3, 3, 3, '2026-10-07', '11:00:00', 'Scheduled'),
(4, 4, 4, '2026-10-07', '11:30:00', 'Completed'),
(5, 5, 5, '2026-10-08', '09:00:00', 'Scheduled'),
(6, 6, 6, '2026-10-08', '10:30:00', 'Cancelled'),
(7, 7, 7, '2026-10-09', '12:00:00', 'Scheduled'),
(8, 8, 8, '2026-10-09', '14:00:00', 'Completed'),
(9, 9, 9, '2026-10-10', '15:30:00', 'Scheduled'),
(10, 10, 10, '2026-10-10', '16:00:00', 'Scheduled');

-- SELECT * FROM appointments;

-- =====================================================
-- STEP 4: SQL QUERIES
-- =====================================================

SELECT * FROM hospitals;

SELECT hospital_name, address
FROM hospitals;

SELECT * FROM doctors;

SELECT first_name, last_name, salary
FROM doctors;

SELECT first_name, last_name, salary
FROM doctors
WHERE salary > 150000;

SELECT first_name, last_name, age
FROM patients
WHERE gender = 'Female';

SELECT first_name, last_name, age
FROM patients
WHERE age > 40;

SELECT *
FROM appointments
WHERE status = 'Scheduled';

-- =====================================================
-- STEP 5: JOIN QUERIES
-- =====================================================

SELECT 
    d.first_name,
    d.last_name,
    s.specialization_name,
    d.salary
FROM doctors d
JOIN specializations s
ON d.specialization_id = s.specialization_id;

SELECT 
    d.first_name,
    d.last_name,
    dep.department_name
FROM doctors d
JOIN departments dep
ON d.department_id = dep.department_id;

SELECT
    dep.department_name,
    h.hospital_name
FROM departments dep
JOIN hospitals h
ON dep.hospital_id = h.hospital_id;

SELECT
    d.first_name,
    d.last_name,
    dep.department_name,
    h.hospital_name
FROM doctors d
JOIN departments dep
ON d.department_id = dep.department_id
JOIN hospitals h
ON dep.hospital_id = h.hospital_id;

SELECT
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name
FROM patients p
JOIN doctors d
ON p.doctor_id = d.doctor_id;

SELECT
    a.appointment_date,
    a.appointment_time,
    a.status,
    p.first_name AS patient_name,
    d.first_name AS doctor_name
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id;

-- =====================================================
-- STEP 6: GROUP BY AND AGGREGATE FUNCTIONS
-- =====================================================

SELECT 
    s.specialization_name,
    COUNT(d.doctor_id) AS total_doctors
FROM specializations s
JOIN doctors d
ON s.specialization_id = d.specialization_id
GROUP BY s.specialization_name;

SELECT AVG(salary) AS average_salary
FROM doctors;

SELECT MAX(salary) AS highest_salary
FROM doctors;

SELECT MIN(salary) AS lowest_salary
FROM doctors;

SELECT SUM(salary) AS total_salary
FROM doctors;

SELECT 
    d.first_name,
    d.last_name,
    COUNT(p.patient_id) AS total_patients
FROM doctors d
LEFT JOIN patients p
ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

SELECT 
    d.first_name,
    d.last_name,
    COUNT(p.patient_id) AS total_patients
FROM doctors d
JOIN patients p
ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
HAVING COUNT(p.patient_id) > 1;

-- =====================================================
-- STEP 7: ORDER BY, LIKE, BETWEEN AND IN
-- =====================================================

SELECT 
    first_name,
    last_name,
    salary
FROM doctors
ORDER BY salary DESC;

SELECT 
    first_name,
    last_name,
    salary
FROM doctors
ORDER BY salary ASC;

SELECT 
    first_name,
    last_name
FROM patients
WHERE first_name LIKE 'A%';

SELECT 
    first_name,
    last_name
FROM doctors
WHERE first_name LIKE '%a%';

SELECT 
    first_name,
    last_name,
    salary
FROM doctors
WHERE salary BETWEEN 100000 AND 200000;

SELECT 
    first_name,
    last_name,
    age
FROM patients
WHERE age BETWEEN 25 AND 50;

SELECT 
    first_name,
    last_name,
    specialization_id
FROM doctors
WHERE specialization_id IN (1, 3, 5);

SELECT *
FROM appointments
WHERE status IN ('Scheduled', 'Completed');

-- =====================================================
-- STEP 8: SUBQUERIES
-- =====================================================

SELECT
    first_name,
    last_name,
    salary
FROM doctors
WHERE salary > (
    SELECT AVG(salary)
    FROM doctors
);

SELECT
    first_name,
    last_name,
    salary
FROM doctors
WHERE salary = (
    SELECT MAX(salary)
    FROM doctors
);

SELECT
    first_name,
    last_name
FROM doctors
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Cardiology Department'
);

SELECT
    first_name,
    last_name,
    doctor_id
FROM patients
WHERE doctor_id = (
    SELECT doctor_id
    FROM doctors
    WHERE salary = (
        SELECT MAX(salary)
        FROM doctors
    )
);

SELECT
    d.first_name,
    d.last_name,
    d.salary,
    s.specialization_name
FROM doctors d
JOIN specializations s
ON d.specialization_id = s.specialization_id
WHERE d.salary > (
    SELECT AVG(d2.salary)
    FROM doctors d2
    WHERE d2.specialization_id = d.specialization_id
);

SELECT
    hospital_name
FROM hospitals
WHERE hospital_id IN (
    SELECT hospital_id
    FROM departments
);

SELECT
    first_name,
    last_name
FROM doctors
WHERE doctor_id IN (
    SELECT doctor_id
    FROM patients
);

-- =====================================================
-- STEP 9: ADVANCED JOIN QUERIES
-- =====================================================

SELECT
    h.hospital_name,
    dep.department_name
FROM hospitals h
LEFT JOIN departments dep
ON h.hospital_id = dep.hospital_id;

SELECT
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name
FROM doctors d
LEFT JOIN patients p
ON d.doctor_id = p.doctor_id;

SELECT
    dep.department_name,
    d.first_name,
    d.last_name
FROM departments dep
LEFT JOIN doctors d
ON dep.department_id = d.department_id;

SELECT
    a.appointment_id,
    p.first_name AS patient_name,
    d.first_name AS doctor_name,
    s.specialization_name,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
JOIN specializations s
ON d.specialization_id = s.specialization_id;

SELECT
    d.first_name,
    d.last_name,
    dep.department_name,
    h.hospital_name
FROM doctors d
JOIN departments dep
ON d.department_id = dep.department_id
JOIN hospitals h
ON dep.hospital_id = h.hospital_id;

SELECT
    p.first_name,
    p.last_name,
    a.appointment_date,
    a.status
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id;

SELECT
    p.first_name AS patient_name,
    d.first_name AS doctor_name,
    a.appointment_date,
    a.appointment_time
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
WHERE a.status = 'Scheduled';

-- =====================================================
-- STEP 10: ADVANCED SQL QUERIES
-- =====================================================

SELECT
    status,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY status;

SELECT
    dep.department_name,
    COUNT(d.doctor_id) AS total_doctors
FROM departments dep
LEFT JOIN doctors d
ON dep.department_id = d.department_id
GROUP BY dep.department_id, dep.department_name;

SELECT
    dep.department_name,
    COUNT(d.doctor_id) AS total_doctors
FROM departments dep
JOIN doctors d
ON dep.department_id = d.department_id
GROUP BY dep.department_id, dep.department_name
HAVING COUNT(d.doctor_id) > 1;

SELECT
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary >= 200000 THEN 'High Salary'
        WHEN salary >= 100000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM doctors;

SELECT
    first_name,
    last_name,
    age,
    CASE
        WHEN age >= 60 THEN 'Senior'
        WHEN age >= 40 THEN 'Middle Age'
        ELSE 'Young'
    END AS age_category
FROM patients;

SELECT
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date,
    status
FROM appointments
WHERE appointment_date >= CURDATE();

SELECT
    first_name,
    last_name,
    joining_date
FROM doctors
WHERE joining_date < '2022-01-01';

SELECT
    appointment_id,
    appointment_date,
    appointment_time,
    status
FROM appointments
ORDER BY appointment_date ASC, appointment_time ASC;

SELECT
    gender,
    COUNT(*) AS total_patients
FROM patients
GROUP BY gender;

-- ============================================
-- FINAL PROJECT VERIFICATION / TESTING
-- ============================================

USE HospitalDB;

SHOW TABLES;

SELECT 'Branches' AS table_name, COUNT(*) AS total_records FROM branches
UNION ALL
SELECT 'Hospitals', COUNT(*) FROM hospitals
UNION ALL
SELECT 'Specializations', COUNT(*) FROM specializations
UNION ALL
SELECT 'Departments', COUNT(*) FROM departments
UNION ALL
SELECT 'Doctors', COUNT(*) FROM doctors
UNION ALL
SELECT 'Patients', COUNT(*) FROM patients
UNION ALL
SELECT 'Appointments', COUNT(*) FROM appointments;

DESC branches;
DESC hospitals;
DESC specializations;
DESC departments;
DESC doctors;
DESC patients;
DESC appointments;

SELECT
    d.first_name,
    d.last_name,
    s.specialization_name,
    dep.department_name,
    h.hospital_name
FROM doctors d
JOIN specializations s
ON d.specialization_id = s.specialization_id
JOIN departments dep
ON d.department_id = dep.department_id
JOIN hospitals h
ON dep.hospital_id = h.hospital_id;

SELECT
    p.first_name AS patient_name,
    d.first_name AS doctor_name
FROM patients p
JOIN doctors d
ON p.doctor_id = d.doctor_id;

SELECT
    a.appointment_id,
    p.first_name AS patient_name,
    d.first_name AS doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id;


















