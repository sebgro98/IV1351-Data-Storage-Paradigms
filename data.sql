INSERT INTO person (first_name,street,personal_number_UNIQUE,city,zip_code,last_name)
VALUES
  ('Oliver','Ap #455-6882 Ut Road','1234567891','Lutsel K''e','79095','Andersson');
  
  INSERT INTO instructor (employ_id_UNIQUE,number_group_lessons,number_of_individual_lessons,instrument_type)
VALUES
  ('43','3','45','drums');
  
INSERT INTO student (skill_level,relative_name, relative_phone_number,number_of_rented_instruments,student_number_UNIQUE,number_of_lessons_taken,instrument_type)
VALUES
  ('beginner','Carl','0123345678','1','012334456','4','drums');
  
INSERT INTO discount (discount_procent)
VALUES
  ('10');
INSERT INTO siblings (relation, student_id_UNIQUE, number_of_siblings,instrument_type)

VALUES
  ('2','9421412','3','drums');
INSERT INTO phone_number (phone_number_UNIQUE)
VALUES
  ('789421904');
  
INSERT INTO email (email_UNIQUE)
VALUES
  ('FJHASKFDAS@GMAIL.COM');
  
INSERT INTO lessons (skill_level,time_and_date)
VALUES
  ('intermediate', '1000-01-01');
    INSERT INTO scheduled_timeslots (time_slot,time_and_date)
VALUES
  ('1000-01-01', '1000-01-01');
  
   INSERT INTO administrative_staff (availableTime,availableInstructor)
VALUES
  ('1000-01-01', 'Carl');
  
  INSERT INTO prices (beginner_and_intermediate,advanced,group_lesson,individual_lesson)
VALUES
  ('100','200','500','80');
  
  INSERT INTO ensambles (genre,maximun_number_of_students,minimun_number_of_students)
VALUES
  ('rock','50','5');
  
  INSERT INTO group_lessons (instrument_type,minimun_number_of_students,maximun_number_of_students)
VALUES
  ('rock','50','5');
  
  INSERT INTO individual_lessons (intrument_type)
VALUES
  ('drums');