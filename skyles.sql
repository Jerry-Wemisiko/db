-- Skyles Clinic Booking System
-- A database to manage appointments, patients, doctors, and services in a medical clinic.

-- ---------------------------------------------------------------------------------------------------------------------
-- 1. Patients Table: Stores patient information.
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Phone VARCHAR(20) NOT NULL UNIQUE,
    Email VARCHAR(100) UNIQUE,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    --  Added a status for soft deletes
    Status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

-- ---------------------------------------------------------------------------------------------------------------------
-- 2. Doctors Table: Stores doctor information.
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20) UNIQUE,
    -- Added a join date
    HireDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Active'
);

-- ---------------------------------------------------------------------------------------------------------------------
-- 3. Appointments Table: Stores appointment details, linking patients, doctors, and services.
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    -- Changed to VARCHAR for flexibility.  Can store "Scheduled", "Completed", "Cancelled", etc.
    Status VARCHAR(20) NOT NULL DEFAULT 'Scheduled',
    Notes VARCHAR(255),
    -- Added Service ID
    ServiceId INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    -- Foreign Key for Service
    FOREIGN KEY (ServiceId) REFERENCES Services(ServiceId)
);

-- ---------------------------------------------------------------------------------------------------------------------
-- 4. Services Table:  Stores the type of services offered by the clinic
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE Services (
    ServiceId INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(255) NOT NULL UNIQUE,
    Description TEXT,
    Cost DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Available'
);

-- ---------------------------------------------------------------------------------------------------------------------
-- 5.  Payments Table:  Stores payment information for appointments
-- ---------------------------------------------------------------------------------------------------------------------
CREATE TABLE Payments (
    PaymentId INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentId INT NOT NULL,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,  -- e.g., "Cash", "Credit Card", "Insurance"
    TransactionId VARCHAR(255), -- Added for tracking external transaction IDs
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending',  -- e.g., "Pending", "Completed", "Failed", "Refunded"
    FOREIGN KEY (AppointmentId) REFERENCES Appointments(AppointmentId)
);
