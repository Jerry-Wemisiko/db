# Skyles Clinic Booking System

## Description

This project is a database management system designed for a medical clinic. It's built using MySQL and provides a structured way to manage information related to patients, doctors, appointments, services, and payments.  The system allows the clinic to efficiently schedule and track appointments, manage patient and doctor records, record services offered, and process payments.

## Features

* **Patient Management:** Stores patient demographics, contact information, and registration details.
* **Doctor Management:** Stores doctor information, including specialization and contact details.
* **Appointment Scheduling:** Schedules and tracks appointments, linking patients, doctors, and services.
* **Service Management:** Stores information about the types of services offered by the clinic.
* **Payment Processing:** Records payment details for appointments.
* **Data Integrity:** Enforces data integrity through primary keys, foreign keys, constraints (NOT NULL, UNIQUE), and data types.
* **Soft Deletes:** Implements soft deletes for patients and doctors using a `Status` column.
* **Audit Trails:** Uses `TIMESTAMP` for `RegistrationDate` and `PaymentDate` to automatically record date and time.

## How to Run/Setup the Project

1.  **Prerequisites:**
    * MySQL Server installed and running.
    * A MySQL client (e.g., MySQL Workbench, command-line `mysql`).

2.  **Installation:**
    * Create a new database in MySQL:
        ```sql
        CREATE DATABASE SkylesClinic;
        ```
    * Use the database:
        ```sql
        USE SkylesClinic;
        ```
    * Import the SQL file:
        * **MySQL Workbench:** Go to File -> Open SQL Script, select the `skyles_clinic_booking_system.sql` file, and then click the "Execute" button.
        * **Command Line:**
            ```bash
            mysql -u your_user -p SkylesClinic < skyles_clinic_booking_system.sql
            ```
            (Replace `your_user` with your MySQL username.  You will be prompted for your password.)


## Repository Contents

The repository should contain the following files:

* `skyles_clinic_booking_system.sql`: The SQL script to create the database schema.
* `README.md`: This file, containing project information and setup instructions.
