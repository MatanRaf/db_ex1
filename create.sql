
create table country_entity(
    countrycode char(3) PRIMARY KEY,
    country     varchar not null,
    region      varchar not null,
    incomegroup varchar not null
);

create table university(
	iau_id1 varchar(32) primary key,
    countrycode char(3) not null,
	eng_name varchar not null,
	orig_name varchar not null,
	foundedyr integer not null,
	private01 boolean not null,
	latitude double precision,
	longitude double precision,
	phd_granting boolean not null,
	divisions integer,
	specialized boolean not null,
    foreign key (countrycode)
    	references country_entity(countrycode) on delete cascade
);

create table Enrollment_year(
    year integer not null,
    iau_id1 char(12),
    students5_estimated integer,
    foreign key (iau_id1)
        references university(iau_id1) on delete cascade,
    PRIMARY KEY(year,iau_id1)
);


create table closed_university(
    iau_id1 char(12) primary key,
	yr_closed integer not null,
	foreign key (iau_id1)
	    references university(iau_id1) on delete cascade
);