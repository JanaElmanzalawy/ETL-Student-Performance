CREATE DATABASE StudentPerformance;
GO
use StudentPerformance;
GO
CREATE TABLE dbo.Students (
    student_id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    age INT NULL,
    city NVARCHAR(100),
    gpa DECIMAL(3,2),
    email NVARCHAR(255),
    phone NVARCHAR(30),
    gender NVARCHAR(30),
    level NVARCHAR(50)
);

CREATE TABLE dbo.Grades (
    student_id INT NOT NULL,
    subject NVARCHAR(50) NOT NULL,
    grade INT NOT NULL,

    PRIMARY KEY (student_id, subject),
    FOREIGN KEY (student_id)
        REFERENCES dbo.Students(student_id),

    CHECK (grade BETWEEN 0 AND 100)
);

CREATE TABLE dbo.Attendance (
    student_id INT NOT NULL,
    date DATE NOT NULL,
    status NVARCHAR(20) NOT NULL,
    note NVARCHAR(255) NULL,

    PRIMARY KEY (student_id, date),
    FOREIGN KEY (student_id)
        REFERENCES dbo.Students(student_id)
);

USE StudentPerformance;
GO

SELECT COUNT(*) AS TotalStudents FROM dbo.Students;
SELECT COUNT(*) AS TotalGrades FROM dbo.Grades;
SELECT COUNT(*) AS TotalAttendance FROM dbo.Attendance;