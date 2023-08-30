-- drop schema lab4;
create schema lab4;
use lab4;

CREATE TABLE department 
(ID			int NOT NULL,
 Dept_Name  varchar(20) NOT NULL,
 Budget     int,
PRIMARY KEY (ID)
) ENGINE=InnoDB;


CREATE TABLE course 
(ID 		 int NOT NULL,
 Course_Name varchar(20) NOT NULL,
 Dept_ID 	 int,
 Credit 	 int,
PRIMARY KEY (ID),
FOREIGN KEY (Dept_ID) REFERENCES department(ID)
) ENGINE=InnoDB;

CREATE TABLE course_offering 
(Course_ID int NOT NULL,
 Course_Year decimal(4,0) NOT NULL,
 Course_Semester decimal(1,0) NOT NULL,
 Section_ID int NOT NULL,
 Delivery_Method varchar(20) DEFAULT NULL,
PRIMARY KEY (Course_ID, Course_Year, Course_Semester, Section_ID),
FOREIGN KEY (Course_ID) REFERENCES course(ID)
) ENGINE=InnoDB;

CREATE TABLE student 
(ID int NOT NULL,
 Student_Name varchar(20) NOT NULL,
 phone_number varchar(20),
 Dept_ID int,
PRIMARY KEY (ID),
FOREIGN KEY (Dept_ID) REFERENCES department(ID)
) ENGINE=InnoDB;

CREATE TABLE takes 
(Student_ID int NOT NULL,
 Course_ID int NOT NULL,
 Course_Year decimal(4,0) NOT NULL,
 Course_Semester decimal(1,0) NOT NULL,
 Section_ID int NOT NULL,
 grade decimal(3,0),
PRIMARY KEY (Student_ID, Course_ID, Course_Year, Course_Semester, Section_ID),
FOREIGN KEY (Course_ID, Course_Year, Course_Semester, Section_ID) REFERENCES course_offering(Course_ID, Course_Year, Course_Semester, Section_ID),
FOREIGN KEY (Student_ID) REFERENCES student(ID)
) ENGINE=InnoDB;

use lab4;

INSERT INTO Department (ID, Dept_Name, Budget) 
VALUES
(101,'Computer Science',13000),
(102,'Economics',12000),
(103,'Law',9000),
(104,'History',9400),
(105,'Medicine',16500),
(106,'Data Science',NULL);

INSERT INTO Course (ID,Course_Name,Dept_ID,Credit)
VALUES
(10102,'Databases 1',101,2),
(10103,'Databases 2',101,3),
(10402,'Modern Hisory',104,3),
(10405,'Middle East',104,3),
(10503,'OS',101,3),
(10504,'Java',NULL,4),
(10601,'Anatomy',105,3),
(10604,'Microbiology',105,4),
(10671,'Genetics',105,2);

INSERT INTO Course_Offering (Course_ID, Course_Year, Course_Semester, Section_ID, Delivery_Method) 
VALUES 
(10102,2014,1,1,'In Person'),
(10102,2014,1,2,'In Person'),
(10102,2015,1,1,'In Person'),
(10102,2015,1,2,'In Person'),
(10103,2014,1,1,'In Person'),
(10103,2014,1,2,'Online'),
(10103,2015,1,1,'In Person'),
(10103,2015,2,1,'In Person'),
(10402,2015,2,1,'Online'),
(10402,2015,2,2,'Online'),
(10405,2014,1,1,'Hybrid'),
(10405,2015,1,1,'Hybrid'),
(10503,2015,2,1,'In Person'),
(10504,2015,1,1,'Online'),
(10504,2015,1,2,'Online'),
(10504,2015,2,1,'Online'),
(10504,2015,2,2,'Online'),
(10604,2014,1,1,'In Person'),
(10604,2014,2,1,'Hybrid'),
(10604,2015,1,1,'Hybrid'),
(10604,2015,2,1,'Hybrid'),
(10604,2015,2,2,'Hybrid'),
(10671,2014,1,1,'Online'),
(10671,2014,2,1,'Online'),
(10604,2014,2,2,'In Person');

INSERT INTO Student (ID,Student_Name,Phone_Number,Dept_ID)
VALUES 
(11,'Amir Rama ',NULL,101),
(15,'Gil Sol',95254945611,105),
(21,'Aviv Shoham',97235473310,101),
(23,'Noam Admon',NULL,104),
(33,'Asaf Segev',952523332210,101),
(34,'Aharon Shalom',972532214364,NULL),
(40,'Dan Aharon',97252314451,104);

INSERT INTO Takes (Student_ID,Course_ID,Course_Year,Course_Semester,Section_ID, grade)
VALUES 
(11,10102,2014,1,1,90),
(15,10102,2014,1,1,74),
(21,10102,2014,1,1,85),
(23,10102,2014,1,1,76),
(40,10102,2014,1,1,85),
(33,10102,2014,1,2,90),
(34,10102,2014,1,2,84),
(15,10102,2015,1,1,94),
(11,10103,2015,1,1,96),
(21,10103,2015,1,1,84),
(23,10103,2015,1,1,74),
(33,10103,2015,1,1,90),
(11,10402,2015,2,1,84),
(15,10402,2015,2,1,70),
(21,10402,2015,2,1,70),
(40,10402,2015,2,1,85),
(23,10402,2015,2,2,88),
(15,10405,2014,1,1,78),
(33,10405,2014,1,1,86),
(23,10503,2015,2,1,NULL),
(21,10503,2015,2,1,NULL),
(23,10504,2015,1,1,78),
(33,10504,2015,1,1,82),
(21,10504,2015,1,2,84),
(40,10504,2015,1,2,82);
