-- Populate VOLUNTEER_T with random data
INSERT INTO VOLUNTEER_T (VolunteerName)
SELECT CONCAT('Volunteer_', FLOOR(RAND() * 1000))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate EMPLOYEE_T with random data
INSERT INTO EMPLOYEE_T (EmployeeName, EmployeeContact)
SELECT CONCAT('Employee_', FLOOR(RAND() * 1000)), CONCAT('Contact_', FLOOR(RAND() * 10000000000))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate RECIPIENT_T with random data
INSERT INTO RECIPIENT_T (RecipientName)
SELECT CONCAT('Recipient_', FLOOR(RAND() * 1000))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate DONATOR_T with random data
INSERT INTO DONATOR_T (D_Name, D_Phone)
SELECT CONCAT('Donator_', FLOOR(RAND() * 1000)), CONCAT('Phone_', FLOOR(RAND() * 10000000000))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate PROJECT_T with random data
INSERT INTO PROJECT_T (Project_Name, Project_Description, Submit_Date, VolunteerID, EmployeeID)
SELECT CONCAT('Project_', FLOOR(RAND() * 1000)),
       CONCAT('Description_', FLOOR(RAND() * 1000)),
       DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY),
       FLOOR(RAND() * (SELECT MAX(VolunteerID) FROM VOLUNTEER_T)),
       FLOOR(RAND() * (SELECT MAX(EmployeeID) FROM EMPLOYEE_T))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate FUNDRAISING_EVENT_T with random data
INSERT INTO FUNDRAISING_EVENT_T (EventTime, EmployeeID, VolunteerID)
SELECT DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY),
       FLOOR(RAND() * (SELECT MAX(EmployeeID) FROM EMPLOYEE_T)),
       FLOOR(RAND() * (SELECT MAX(VolunteerID) FROM VOLUNTEER_T))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate PAYMENT_T with random data
INSERT INTO PAYMENT_T (Amount, Date, DonatorID)
SELECT FLOOR(RAND() * 1000),
       DATE_ADD(NOW(), INTERVAL -FLOOR(RAND() * 365) DAY),
       FLOOR(RAND() * (SELECT MAX(DonatorID) FROM DONATOR_T))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate CHARITY_T with random data
INSERT INTO CHARITY_T (O_Name, O_Location, RecipientID)
SELECT CONCAT('Charity_', FLOOR(RAND() * 1000)),
       CONCAT('Location_', FLOOR(RAND() * 1000)),
       FLOOR(RAND() * (SELECT MAX(RecipientID) FROM RECIPIENT_T))
FROM INFORMATION_SCHEMA.TABLES;

-- Populate ENQUIRY_T with random data
INSERT INTO ENQUIRY_T (EnquiryType, DonatorID)
SELECT CONCAT('Enquiry_', FLOOR(RAND() * 1000)),
       FLOOR(RAND() * (SELECT MAX(DonatorID) FROM DONATOR_T))
FROM INFORMATION_SCHEMA.TABLES;
