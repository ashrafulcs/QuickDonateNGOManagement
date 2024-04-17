CREATE TABLE VOLUNTEER_T (
    VolunteerID INT AUTO_INCREMENT PRIMARY KEY,
    VolunteerName VARCHAR(255)
);

CREATE TABLE EMPLOYEE_T (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    EmployeeContact VARCHAR(20)
);

CREATE TABLE FUNDRAISING_EVENT_T (
    EventNum INT AUTO_INCREMENT PRIMARY KEY,
    EventTime DATETIME,
    EmployeeID INT,
    VolunteerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE_T(EmployeeID),
    FOREIGN KEY (VolunteerID) REFERENCES VOLUNTEER_T(VolunteerID)
);

CREATE TABLE DONATOR_T (
    DonatorID INT AUTO_INCREMENT PRIMARY KEY,
    D_Name VARCHAR(255),
    D_Phone VARCHAR(20)
);

CREATE TABLE RECIPIENT_T (
    RecipientID INT AUTO_INCREMENT PRIMARY KEY,
    RecipientName VARCHAR(255)
);

CREATE TABLE PAYMENT_T (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(10,2),
    Date DATE,
    DonatorID INT,
    FOREIGN KEY (DonatorID) REFERENCES DONATOR_T(DonatorID)
);

CREATE TABLE CHARITY_T (
    OrganizationID INT AUTO_INCREMENT PRIMARY KEY,
    O_Name VARCHAR(255),
    O_Location VARCHAR(255),
    RecipientID INT,
    FOREIGN KEY (RecipientID) REFERENCES RECIPIENT_T(RecipientID)
);

CREATE TABLE PROJECT_T (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    Project_Name VARCHAR(255),
    Project_Description TEXT,
    Submit_Date DATE,
    VolunteerID INT,
    EmployeeID INT,
    FOREIGN KEY (VolunteerID) REFERENCES VOLUNTEER_T(VolunteerID),
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE_T(EmployeeID)
);

CREATE TABLE ENQUIRY_T (
    EnquiryID INT AUTO_INCREMENT PRIMARY KEY,
    EnquiryType VARCHAR(100),
    DonatorID INT,
    FOREIGN KEY (DonatorID) REFERENCES DONATOR_T(DonatorID)
);

-- Populate VOLUNTEER_T table with random data
INSERT INTO VOLUNTEER_T (VolunteerName) VALUES
('John Doe'),
('Jane Smith'),
('Michael Johnson'),
('Emily Brown');

-- Populate EMPLOYEE_T table with random data
INSERT INTO EMPLOYEE_T (EmployeeName, EmployeeContact) VALUES
('Alice Williams', '123-456-7890'),
('Bob Jones', '456-789-0123'),
('Sarah Davis', '789-012-3456'),
('David Wilson', '012-345-6789');

-- Populate FUNDRAISING_EVENT_T table with random data
INSERT INTO FUNDRAISING_EVENT_T (EventTime, EmployeeID, VolunteerID) VALUES
('2024-04-15 10:00:00', 1, 1),
('2024-04-16 14:30:00', 2, 2),
('2024-04-17 12:00:00', 3, 3),
('2024-04-18 09:45:00', 4, 4);

-- Populate DONATOR_T table with random data
INSERT INTO DONATOR_T (D_Name, D_Phone) VALUES
('Mary Johnson', '234-567-8901'),
('James Smith', '567-890-1234'),
('Emma Wilson', '890-123-4567'),
('Matthew Brown', '123-456-7890');

-- Populate RECIPIENT_T table with random data
INSERT INTO RECIPIENT_T (RecipientName) VALUES
('Charity A'),
('Charity B'),
('Charity C'),
('Charity D');

-- Populate PAYMENT_T table with random data
INSERT INTO PAYMENT_T (Amount, Date, DonatorID) VALUES
(100.00, '2024-04-15', 1),
(50.00, '2024-04-16', 2),
(200.00, '2024-04-17', 3),
(75.00, '2024-04-18', 4);

-- Populate CHARITY_T table with random data
INSERT INTO CHARITY_T (O_Name, O_Location, RecipientID) VALUES
('Charity X', 'Location X', 1),
('Charity Y', 'Location Y', 2),
('Charity Z', 'Location Z', 3),
('Charity W', 'Location W', 4);

-- Populate PROJECT_T table with random data
INSERT INTO PROJECT_T (Project_Name, Project_Description, Submit_Date, VolunteerID, EmployeeID) VALUES
('Project 1', 'Description for Project 1', '2024-04-15', 1, 1),
('Project 2', 'Description for Project 2', '2024-04-16', 2, 2),
('Project 3', 'Description for Project 3', '2024-04-17', 3, 3),
('Project 4', 'Description for Project 4', '2024-04-18', 4, 4);

-- Populate ENQUIRY_T table with random data
INSERT INTO ENQUIRY_T (EnquiryType, DonatorID) VALUES
('Type A', 1),
('Type B', 2),
('Type C', 3),
('Type D', 4);

