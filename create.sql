create table enrollment(
	country varchar, 
	countrycode varchar, 
	region varchar, 
	incomegroup varchar, 
	iau_id1 varchar, 
	eng_name varchar, 
	orig_name varchar, 
	foundedyr varchar, 
	yrclosed varchar, 
	private01 varchar, 
	latitude varchar, 
	longitude varchar, 
	phd_granting varchar, 
	divisions varchar, 
	specialized varchar, 
	year varchar, 
	students5_estimated varchar
);


create table country_entity
(
    countrycode varchar PRIMARY KEY,
    country     varchar not null,
    region      varchar not null,
    incomegroup varchar not null,
);

create table Enrollment_year(
    year varchar not null,
    iau_id1 char(12),
    students5_estimated integer,
    foreign key (iau_id1)
        references university(iau_id1)
);


create table university(
	iau_id1 char(12) primary key,
	eng_name varchar(100) not null,
	orig_name varchar(100) not null,
	foundedyr integer not null,
	private01 boolean not null,
	latitude double precision,
	longitude double precision,
	phd_granting boolean not null,
	divisions integer,
	specialized boolean not null,
);

create table closed_university(
	yr_closed integer not null,
	iau_id1 char(12) not null,	
	foreign key (iau_id1) references university(iau_id1) on delete cascade,
)