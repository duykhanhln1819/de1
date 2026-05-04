create database ClinicManagement;
use ClinicManagement;

create table Medicine(
	id int primary key auto_increment,
	name varchar(100) not null,
    unit_featureh enum ("vien","hop","chai"),
    price decimal(12,0) not null,
    stock int
);

create table Patient(
	id int primary key auto_increment,
    name varchar(100) not null,
    brith date not null,
    phone varchar(15),
    address varchar(100) not null
);

create table Medical_Record(
	id varchar(50),
    date_of_examination date not null,
    diagnosis_of_disease varchar(255)
);

create table Prescription_Detail(
	id int primary key auto_increment,
    medicine_id int,
    patient_id int,
    number_of_levels int,
    Dosage int,
    foreign key (medicine_id) references Medicine(id),
    foreign key (patient_id) references Patient(id)
);

alter table Patient
add id_BHYT text;

alter table Medicine
change unit_featureh Don_Vi int;

-- drop table Medical_Record;
-- drop table Prescription_Detail;

insert into Medicine(name,Don_Vi,price,stock)
values
('ho','1',20000,100),
('cam','2',500000,50),
('Amoxicillin','3',100000,10),
('so mui','1',5000,100),
('sot','1',10000,100);

insert into Patient(name,brith,phone,address)
values
('nguyen van a','1999-01-01',0987654321,'thu duc'),
('tran van b','2002-02-02',0989898909,'go vap'),
('ly thi c','2003-03-03',NULL,'binh thanh'),
('pham thanh d','2004-04-04',NULL,'quan 1'),
('phan thi e','2005-05-05',0111111111,'quan 9');

insert into Medical_Record(id,date_of_examination,diagnosis_of_disease)
values
('PK001','2026-05-05','cam'),
('PK002','2026-06-04','ho'),
('PK003','2026-05-03','so mui'),
('PK004','2026-06-02','nhuc dau'),
('PK005','2026-05-06','dau bung');

insert into Prescription_Detail(number_of_levels,Dosage)
values
(10,5),
(4,2),
(6,3),
(8,4),
(10,5);

update Medicine
set price = price * 1.05
where Don_Vi = '2';

delete from Patient
where phone = NULL;

select * from Medicine
where price between 50000 and 200000;

select P.name, M.id, M.date_of_examination
from Patient P
join Medical_Record M on P.id = P.id
where month(M.date_of_examination) = 6 and year (M.date_of_examination) = 2026;

select M.name
from Prescription_Detail PD
join Medicine M on PD.medicine_id = M.id
where PD.id ='PK001';


















