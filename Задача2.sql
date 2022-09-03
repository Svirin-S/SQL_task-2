  create table if not exists department(
  	department_id serial primary key,
  	title_department varchar (60) not null,
  	description text not null 
  );
 
 
 create table if not exists chief(
 	chief_id serial primary key,
 	name_employee varchar (60) not null,
 	department_id integer not null references department(department_id),
 	number integer not null,
 	description text not null
 );
  

create table if not exists employee(
	employee_id serial primary key,
	name_employee varchar (60) not null,
	chief_id integer not null references chief(chief_id),
	department_id integer not null references department(department_id),
	number integer not null,
	description text not null
);
 
 