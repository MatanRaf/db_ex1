
create table country_entity(
    countrycode char(3) PRIMARY KEY,
    country     varchar(50) not null,
    region      varchar(50) not null,
    incomegroup varchar(50) not null
);

create table university(
	iau_id1 varchar(32) primary key,
    countrycode char(3) not null,
	eng_name varchar(255) not null,
	orig_name varchar(255) not null,
	foundedyr integer not null,
	private01 boolean not null,
	latitude double precision,
	longitude double precision,
	phd_granting boolean not null,
	divisions integer,
	specialized boolean not null,
    foreign key (countrycode)
    	references country_entity(countrycode),
    check(foundedyr < 2026)
);

create table Enrollment_year(
    year integer not null,
    iau_id1 varchar(32) not null,
    students5_estimated integer,
    foreign key (iau_id1)
        references university(iau_id1),
    PRIMARY KEY(year,iau_id1),
    check(year < 2026)
);


create table closed_university(
    iau_id1 varchar(32) primary key,
	yr_closed integer not null,
	foreign key (iau_id1)
	    references university(iau_id1),
    check(year < 2026)
);