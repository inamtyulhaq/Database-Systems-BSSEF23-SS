CREATE TABLE department (
    deptno NUMBER PRIMARY KEY,
    dname VARCHAR2(100) NOT NULL
);

CREATE TABLE student (
    rollno VARCHAR2(20) PRIMARY KEY,
    sname VARCHAR2(100) NOT NULL,
    dob DATE NOT NULL,
    deptno NUMBER REFERENCES department(deptno),
    program VARCHAR2(50) NOT NULL,
    batch VARCHAR2(20) NOT NULL
);

CREATE TABLE course (
    c_code VARCHAR2(20) PRIMARY KEY,
    cname VARCHAR2(100) NOT NULL,
    credits NUMBER NOT NULL,
    category VARCHAR2(50) NOT NULL
);

CREATE TABLE class (
    class_code VARCHAR2(20) PRIMARY KEY,
    c_code VARCHAR2(20) REFERENCES course(c_code),
    t_code VARCHAR2(20) NOT NULL,
    semester VARCHAR2(20) NOT NULL,
    start_date DATE NOT NULL
);

CREATE TABLE result (
    rollno VARCHAR2(20) REFERENCES student(rollno),
    c_code VARCHAR2(20) REFERENCES course(c_code),
    sessionals NUMBER,
    mid_marks NUMBER,
    final_marks NUMBER,
    PRIMARY KEY (rollno, c_code)
);

CREATE TABLE sessionals (
    class_id VARCHAR2(20) REFERENCES class(class_code),
    s_desc VARCHAR2(100) NOT NULL,
    s_category VARCHAR2(50) NOT NULL,
    max_marks NUMBER NOT NULL,
    PRIMARY KEY (class_id, s_desc)
);

CREATE TABLE class_enrollment (
    class_code VARCHAR2(20) REFERENCES class(class_code),
    rollno VARCHAR2(20) REFERENCES student(rollno),
    enrol_date DATE NOT NULL,
    PRIMARY KEY (class_code, rollno)
);

CREATE TABLE class_attendance (
    class_code VARCHAR2(20),
    rollno VARCHAR2(20),
    att_date DATE,
    att_status CHAR(1) CHECK (att_status IN ('P', 'A')),
    PRIMARY KEY (class_code, rollno, att_date),
    FOREIGN KEY (class_code, rollno) REFERENCES class_enrollment(class_code, rollno)
);

CREATE TABLE sessionals_result (
    class_code VARCHAR2(20),
    s_desc VARCHAR2(100),
    rollno VARCHAR2(20),
    obt_marks NUMBER,
    PRIMARY KEY (class_code, s_desc, rollno),
    FOREIGN KEY (class_code, s_desc) REFERENCES sessionals(class_id, s_desc),
    FOREIGN KEY (rollno) REFERENCES student(rollno)
);

INSERT INTO department (deptno, dname) VALUES (1, 'Dept. of IT');
INSERT INTO department (deptno, dname) VALUES (2, 'Dept. of CS');
INSERT INTO department (deptno, dname) VALUES (3, 'Dept. of SE');

INSERT INTO student (rollno, sname, dob, deptno, program, batch) VALUES ('BITF22M001', 'FARIHA RAZA', TO_DATE('12-Apr-2003', 'DD-MON-YYYY'), 1, 'BS(IT)', 'Fall-22');
INSERT INTO student (rollno, sname, dob, deptno, program, batch) VALUES ('BCSF22M033', 'MAJEED HASSAN', TO_DATE('10-Jan-2002', 'DD-MON-YYYY'), 2, 'BS(CS)', 'Fall-22');
INSERT INTO student (rollno, sname, dob, deptno, program, batch) VALUES ('BSEF22M022', 'BILAL OMER', TO_DATE('31-Oct-2004', 'DD-MON-YYYY'), 3, 'BS(SE)', 'Spr-22');
INSERT INTO student (rollno, sname, dob, deptno, program, batch) VALUES ('BITF22M002', 'RAZA SUBHAN', TO_DATE('13-Feb-2003', 'DD-MON-YYYY'), 1, 'BS(IT)', 'Fall-22');
INSERT INTO student (rollno, sname, dob, deptno, program, batch) VALUES ('BCSF22M034', 'HASSAN ALI', TO_DATE('10-Mar-2002', 'DD-MON-YYYY'), 2, 'BS(CS)', 'Fall-22');
INSERT INTO student (rollno, sname, dob, deptno, program, batch) VALUES ('BSEF22M023', 'HASEEB ARIF', TO_DATE('31-Dec-2004', 'DD-MON-YYYY'), 3, 'BS(SE)', 'Spr-22');

INSERT INTO course VALUES('GE-163','Islamic Studies',2,'General Education');
INSERT INTO course VALUES('CC-212','Software Engineering',3,'Computing');
INSERT INTO course VALUES('CC-215','Database System',3,'Computing');
INSERT INTO course VALUES('CC-211','OOP',3,'Computing');
INSERT INTO course VALUES('CC-213','DSA',3,'Computing');

INSERT INTO class (Class_Code, C_code, T_code, Semester, Start_date) VALUES
('CL-006', 'GE-163', 'T006', 'Fall-1', TO_DATE('01-Sep-2024', 'DD-MON-YYYY'));

INSERT INTO class (Class_Code, C_code, T_code, Semester, Start_date) VALUES
('CL-005', 'CC-212', 'T005', 'Fall-3', TO_DATE('01-Sep-2025', 'DD-MON-YYYY'));

INSERT INTO class (Class_Code, C_code, T_code, Semester, Start_date) VALUES
('CL-004', 'CC-215', 'T004', 'Fall-2', TO_DATE('01-Feb-2025', 'DD-MON-YYYY'));

INSERT INTO class (Class_Code, C_code, T_code, Semester, Start_date) VALUES
('CL-002', 'CC-211', 'T002', 'Spr-2', TO_DATE('01-Sep-2024', 'DD-MON-YYYY'));
INSERT INTO class (Class_Code, C_code, T_code, Semester, Start_date) VALUES
('CL-001', 'CC-213', 'T001', 'Spr-1', TO_DATE('01-Sep-2024', 'DD-MON-YYYY'));

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BITF22M001', 'GE-163', 8, 23, 32);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BITF22M001', 'CC-212', 19, 29, 40);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BSEF22M022', 'CC-211', 14, 27, 32);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BSEF22M022', 'CC-213', 10, 20, 25);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BCSF22M033', 'CC-211', 8, 15, 20);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BCSF22M033', 'CC-213', 12, 24, 30);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BITF22M002', 'CC-213', 23, 25, 30);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BCSF22M034', 'CC-213', 23, 25, 30);

INSERT INTO result (RollNo, C_Code, Sessionals, Mid_Marks, Final_Marks) VALUES
('BSEF22M023', 'CC-213', 23, 25, 30);

INSERT INTO sessionals (Class_ID, S_Desc, S_Category, Max_Marks) VALUES ('CL-006', 'Quiz1', 'Quiz', 10);
INSERT INTO sessionals (Class_ID, S_Desc, S_Category, Max_Marks) VALUES ('CL-005', 'Quiz2', 'Quiz', 10);
INSERT INTO sessionals (Class_ID, S_Desc, S_Category, Max_Marks) VALUES ('CL-004', 'Assignment1', 'Assignment', 20);
INSERT INTO sessionals (Class_ID, S_Desc, S_Category, Max_Marks) VALUES ('CL-002', 'Assignment2', 'Assignment', 20);
INSERT INTO sessionals (Class_ID, S_Desc, S_Category, Max_Marks) VALUES ('CL-001', 'Project1', 'Project', 30);

INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-006', 'BITF22M001', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));
INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-006', 'BITF22M002', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));
INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-005', 'BCSF22M033', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));
INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-004', 'BSEF22M022', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));
INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-001', 'BSEF22M022', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));
INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-002', 'BCSF22M034', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));
INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-002', 'BSEF22M023', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));
INSERT INTO class_enrollment (Class_code, RollNo, Enrol_Date) VALUES ('CL-005', 'BITF22M002', TO_DATE('01-Aug-2024', 'DD-MON-YYYY'));

INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-006', 'BITF22M001', SYSDATE, 'P');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-006', 'BITF22M002', SYSDATE, 'P');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-005', 'BCSF22M033', SYSDATE, 'P');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-004', 'BSEF22M022', SYSDATE, 'A');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-001', 'BITF22M001', SYSDATE, 'P');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-001', 'BSEF22M022', SYSDATE, 'P');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-002', 'BCSF22M034', SYSDATE, 'P');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-002', 'BSEF22M023', SYSDATE, 'A');
INSERT INTO class_attendance (Class_code, RollNo, Att_Date, Att_Status) VALUES ('CL-005', 'BITF22M002', SYSDATE, 'P');

INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-006', 'Quiz1', 'BITF22M001', 9.50);
INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-006', 'Quiz1', 'BITF22M002', 8.75);
INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-005', 'Quiz2', 'BCSF22M033', 7.00);
INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-004', 'Assignment1', 'BSEF22M022', 18.00);
INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-002', 'Assignment2', 'BCSF22M034', 16.50);
INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-002', 'Assignment2', 'BSEF22M023', 17.75);
INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-001', 'Project1', 'BITF22M001', 28.00);
INSERT INTO sessionals_result (Class_CODE, S_Desc, RollNo, Obt_Marks) VALUES ('CL-001', 'Project1', 'BSEF22M022', 25.50);