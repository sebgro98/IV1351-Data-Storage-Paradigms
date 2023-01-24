CREATE TABLE administrative_staff (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 availableTime TIMESTAMP(6),
 availableInstructor VARCHAR(100)
);

ALTER TABLE administrative_staff ADD CONSTRAINT PK_administrative_staff PRIMARY KEY (id);


CREATE TABLE email (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name VARCHAR(100) NOT NULL,
 zip_code VARCHAR(20) NOT NULL,
 street VARCHAR(100) NOT NULL,
 city VARCHAR(100) NOT NULL,
 last_name VARCHAR(100) NOT NULL,
 personal_number VARCHAR(12) UNIQUE NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE person_email (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,email_id);


CREATE TABLE phone_number (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_number VARCHAR(20) UNIQUE NOT NULL
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (id);


CREATE TABLE scheduled_timeslots (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 time_slot TIMESTAMP(6),
 time_and_date TIMESTAMP(6)
);

ALTER TABLE scheduled_timeslots ADD CONSTRAINT PK_scheduled_timeslots PRIMARY KEY (id);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level VARCHAR(100) NOT NULL,
 relative_name VARCHAR(100) NOT NULL,
 relative_phone_number VARCHAR(10) NOT NULL,
 number_of_rented_instruments INT,
 student_number VARCHAR(12) UNIQUE NOT NULL,
 number_of_lessons_taken INT,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(100)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE discount (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 discount_procent INT
);

ALTER TABLE discount ADD CONSTRAINT PK_discount PRIMARY KEY (student_id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(100),
 employ_id VARCHAR(12) UNIQUE,
 number_group_lessons INT,
 number_of_individual_lessons INT,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE leasings_instruments (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 leasing_period VARCHAR(100),
 number_of_instruments INT,
 price_for_instrument FLOAT(10),
 in_stock INT,
 delivery VARCHAR(100)
);

ALTER TABLE leasings_instruments ADD CONSTRAINT PK_leasings_instruments PRIMARY KEY (student_id);


CREATE TABLE lessons (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level VARCHAR(100) NOT NULL,
 time_and_date TIMESTAMP(6),
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE lessons ADD CONSTRAINT PK_lessons PRIMARY KEY (id);


CREATE TABLE person_phone (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (person_id,id);


CREATE TABLE prices (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 beginner_and_intermediate FLOAT(10) NOT NULL,
 advanced FLOAT(10) NOT NULL,
 group_lesson FLOAT(10) NOT NULL,
 individual_lesson FLOAT(10) NOT NULL
);

ALTER TABLE prices ADD CONSTRAINT PK_prices PRIMARY KEY (lesson_id);


CREATE TABLE siblings (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 relation VARCHAR(10),
 school_id VARCHAR(12) UNIQUE,
 number_of_siblings INT,
 instrument_type VARCHAR(10)
);

ALTER TABLE siblings ADD CONSTRAINT PK_siblings PRIMARY KEY (student_id,person_id);


CREATE TABLE ensambles (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre VARCHAR(100) NOT NULL,
 maximun_number_of_students INT NOT NULL,
 minimun_number_of_students INT NOT NULL
);

ALTER TABLE ensambles ADD CONSTRAINT PK_ensambles PRIMARY KEY (lesson_id);


CREATE TABLE group_lessons (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(100) NOT NULL,
 minimun_number_of_students INT NOT NULL,
 maximun_number_of_students INT NOT NULL
);

ALTER TABLE group_lessons ADD CONSTRAINT PK_group_lessons PRIMARY KEY (lesson_id);


CREATE TABLE individual_lessons (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 administrative_staff_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 intrument_type VARCHAR(100)
);

ALTER TABLE individual_lessons ADD CONSTRAINT PK_individual_lessons PRIMARY KEY (lesson_id,administrative_staff_id);


CREATE TABLE lesson_time (
 scheduled_timeslot_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE lesson_time ADD CONSTRAINT PK_lesson_time PRIMARY KEY (scheduled_timeslot_id,lesson_id);


ALTER TABLE person_email ADD CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_email ADD CONSTRAINT FK_person_email_1 FOREIGN KEY (email_id) REFERENCES email (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE discount ADD CONSTRAINT FK_discount_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE leasings_instruments ADD CONSTRAINT FK_leasings_instruments_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE lessons ADD CONSTRAINT FK_lessons_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE lessons ADD CONSTRAINT FK_lessons_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_1 FOREIGN KEY (id) REFERENCES phone_number (id);


ALTER TABLE prices ADD CONSTRAINT FK_prices_0 FOREIGN KEY (lesson_id) REFERENCES lessons (id);


ALTER TABLE siblings ADD CONSTRAINT FK_siblings_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE siblings ADD CONSTRAINT FK_siblings_1 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE ensambles ADD CONSTRAINT FK_ensambles_0 FOREIGN KEY (lesson_id) REFERENCES lessons (id);


ALTER TABLE group_lessons ADD CONSTRAINT FK_group_lessons_0 FOREIGN KEY (lesson_id) REFERENCES lessons (id);


ALTER TABLE individual_lessons ADD CONSTRAINT FK_individual_lessons_0 FOREIGN KEY (lesson_id) REFERENCES lessons (id);
ALTER TABLE individual_lessons ADD CONSTRAINT FK_individual_lessons_1 FOREIGN KEY (administrative_staff_id) REFERENCES administrative_staff (id);


ALTER TABLE lesson_time ADD CONSTRAINT FK_lesson_time_0 FOREIGN KEY (scheduled_timeslot_id) REFERENCES scheduled_timeslots (id);
ALTER TABLE lesson_time ADD CONSTRAINT FK_lesson_time_1 FOREIGN KEY (lesson_id) REFERENCES group_lessons (lesson_id);
ALTER TABLE lesson_time ADD CONSTRAINT FK_lesson_time_2 FOREIGN KEY (lesson_id) REFERENCES ensambles (lesson_id);


