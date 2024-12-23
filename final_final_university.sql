create database University;

use Final_university;

create table department(
   
   dep_id int IDENTITY(1,1) primary key , 
    dep_name varchar(50) not null ,
	dep_location varchar(100) not null ,
	budget   decimal(10,2) not null 
);

create table instructor(
   inst_id int IDENTITY(1,1) primary key ,
   frist_name varchar(50) not null ,
  last_name varchar(50) not null ,
  phone_number varchar(20) ,
  sex  varchar(10) check(sex in('male' , 'female') ),
   salary decimal(10,2) ,
   Dep_id  int foreign key (Dep_id) references department(dep_id)
);

create table student(
  Stud_id int IDENTITY(1,1) primary key ,
  frist_name varchar(50) not null ,
  last_name varchar(50) not null ,
  phone_number varchar(20) ,
  sex  varchar(10) check(sex in('male' , 'female') ),
  tot_credit int not null ,
  Dep_id int foreign key (Dep_id) references department(Dep_id)
);

create table course(
    course_id int primary key ,
	title varchar(50) not null ,
	credit int not null 
);

create table classroom(
    class_num int IDENTITY(1,1)primary key ,
	building  varchar(20)  not null ,
	capacity int not null
);


create table section(
    section_id int IDENTITY(1,1) primary key ,
	year int  not null ,
	semester int  not null ,
	course_ID int foreign key(course_id) references course(course_id),
	day varchar(20),
	period_id int ,
	constraint fk_day foreign key(day , period_id)references[time slot](day , period_id),
	class_num int foreign key(class_num) references classroom(class_num),
	inst_id int foreign key(inst_id)references instructor(inst_id)
);


create table [time slot](
    day varchar(20)  check(day in ('saturday','sunday','monday','tuesday','wednesday','thursday','friday')),
	period_id int foreign key(period_id)references period(period_id),
	primary key(day , period_id)
);

create table period(

    period_id int IDENTITY(1,1) primary key ,
	start_time time not null ,
	end_id time not null
);



create table  [department offers courses](
    dep_id int foreign key(dep_id)references department(dep_id),
	course_id int foreign key(course_id)references course(course_id)
);

create table [instructor advises students](
     inst_id int foreign key(inst_id)references instructor(inst_id),
	 stud_id int foreign key(stud_id)references student(stud_id)
);

create table [instructors teaches sections](
    inst_id int foreign key(inst_id)references instructor(inst_id),
	section_id int foreign key(section_id)references section(section_id),
	course_id int foreign key(course_id)references course(course_id)
);

create table [students takes sections](
        section_id int foreign key(section_id)references section(section_id),
		stud_id int foreign key(stud_id)references student(stud_id),
		course_id int foreign key(course_id)references course(course_id),

);


insert into period 
values ('8:30','10:30'),('10:30','12:30'),('12:30','14:30'),('14:30','16:30'),('16:30','18:30'),('18:30','20:30');


-- Saturday
INSERT INTO [time slot] (day, period_id) VALUES ('saturday', 1);
INSERT INTO [time slot] (day, period_id) VALUES ('saturday', 2);
INSERT INTO [time slot] (day, period_id) VALUES ('saturday', 3);
INSERT INTO [time slot] (day, period_id) VALUES ('saturday', 4);
INSERT INTO [time slot] (day, period_id) VALUES ('saturday', 5);
INSERT INTO [time slot] (day, period_id) VALUES ('saturday', 6);

-- Sunday
INSERT INTO [time slot] (day, period_id) VALUES ('sunday', 1);
INSERT INTO [time slot] (day, period_id) VALUES ('sunday', 2);
INSERT INTO [time slot] (day, period_id) VALUES ('sunday', 3);
INSERT INTO [time slot] (day, period_id) VALUES ('sunday', 4);
INSERT INTO [time slot] (day, period_id) VALUES ('sunday', 5);
INSERT INTO [time slot] (day, period_id) VALUES ('sunday', 6);

-- Monday
INSERT INTO [time slot] (day, period_id) VALUES ('monday', 1);
INSERT INTO [time slot] (day, period_id) VALUES ('monday', 2);
INSERT INTO [time slot] (day, period_id) VALUES ('monday', 3);
INSERT INTO [time slot] (day, period_id) VALUES ('monday', 4);
INSERT INTO [time slot] (day, period_id) VALUES ('monday', 5);
INSERT INTO [time slot] (day, period_id) VALUES ('monday', 6);

-- Tuesday
INSERT INTO [time slot] (day, period_id) VALUES ('tuesday', 1);
INSERT INTO [time slot] (day, period_id) VALUES ('tuesday', 2);
INSERT INTO [time slot] (day, period_id) VALUES ('tuesday', 3);
INSERT INTO [time slot] (day, period_id) VALUES ('tuesday', 4);
INSERT INTO [time slot] (day, period_id) VALUES ('tuesday', 5);
INSERT INTO [time slot] (day, period_id) VALUES ('tuesday', 6);

-- Wednesday
INSERT INTO [time slot] (day, period_id) VALUES ('wednesday', 1);
INSERT INTO [time slot] (day, period_id) VALUES ('wednesday', 2);
INSERT INTO [time slot] (day, period_id) VALUES ('wednesday', 3);
INSERT INTO [time slot] (day, period_id) VALUES ('wednesday', 4);
INSERT INTO [time slot] (day, period_id) VALUES ('wednesday', 5);
INSERT INTO [time slot] (day, period_id) VALUES ('wednesday', 6);

-- Thursday
INSERT INTO [time slot] (day, period_id) VALUES ('thursday', 1);
INSERT INTO [time slot] (day, period_id) VALUES ('thursday', 2);
INSERT INTO [time slot] (day, period_id) VALUES ('thursday', 3);
INSERT INTO [time slot] (day, period_id) VALUES ('thursday', 4);
INSERT INTO [time slot] (day, period_id) VALUES ('thursday', 5);
INSERT INTO [time slot] (day, period_id) VALUES ('thursday', 6);








