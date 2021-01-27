

CREATE DATABASE University;
USE University;


CREATE TABLE Staff (
  StaffID int NOT NULL IDENTITY(1,1),
  First_Name varchar(MAX) NOT NULL,
  Last_Name varchar(MAX) NOT NULL,
  Region varchar(MAX) NOT NULL,
  PRIMARY KEY (StaffID)
);


CREATE TABLE Student (
  StudentNo int NOT NULL IDENTITY(1,1),
  First_Name varchar(MAX) NOT NULL,
  Last_Name varchar(MAX) NOT NULL,
  Registration_Date datetime NOT NULL,
  Region varchar(MAX) NOT NULL,
  StaffID int NOT NULL,
  CONSTRAINT fk1_staff_id FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
  PRIMARY KEY (StudentNo)
);


CREATE TABLE Course (
  CourseID int NOT NULL IDENTITY(1,1),
  Course_Name varchar(MAX) NOT NULL,
  Course_Credit int NOT NULL CONSTRAINT check_credit CHECK (Course_Credit=15 OR Course_Credit=30),
  Course_Quota int NOT NULL,
  StaffID int NULL,
  CONSTRAINT fk2_staff_id FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
  PRIMARY KEY (CourseID)
);



CREATE TABLE Enrollment (
  StudentNo int NOT NULL,
  CourseID int NOT NULL,
  Enrollemnt_Date datetime NOT NULL,
  Final_Grade int,
  CONSTRAINT fk1_student_no FOREIGN KEY (StudentNo) REFERENCES Student (StudentNo),
  CONSTRAINT fk1_course_id FOREIGN KEY (CourseID) REFERENCES Course (CourseID),
  PRIMARY KEY (StudentNo, CourseID)
);


CREATE TABLE Assignment (
  StudentNo int NOT NULL,
  CourseID int NOT NULL,
  AssignmentNo int NOT NULL,
  Grade int NOT NULL CONSTRAINT check_grade CHECK (Grade BETWEEN 0 AND 100),
  CONSTRAINT fk_student_assignment FOREIGN KEY (StudentNo, CourseID) REFERENCES Enrollment (StudentNo, CourseID),
  PRIMARY KEY (StudentNo, CourseID, AssignmentNo)
);

