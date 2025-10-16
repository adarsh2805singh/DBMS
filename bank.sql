create database if not exists bank;
use bank;

create table branch (
branchname varchar(50) primary key,
branchcity varchar(50),
assets varchar(50));

create table bankAccount (
Accno varchar(50) primary key,
branchname varchar(50),
balance real,
foreign key(branchname) references branch(branchname)); 

create table bankcustomer(
customername varchar(50) primary key,
customerstreet varchar(50),
city varchar(50));

create table depositer(
customername varchar(50),
Accno varchar(50),
primary key(customername,Accno),
foreign key(customername) references bankcustomer(customername));

create table loan(
Loannumber varchar(50) primary key,
branchname varchar(50),
amount real,
foreign key(branchname) references branch(branchname));

insert into branch(branchname,branchcity,assets) values
('SBI_Chamrajpet','bangalore','50000'),
('SBI_Residencyroad','bangalore','10000'),
('SBI_Shivajiroad','bombay','20000'),
('SBI_ParlimentRoad','delhi','10000'),
('SBI_Jantarmantar','delhi','20000');

select * from branch;

insert into bankAccount(Accno,branchname,balance) values
('1','SBI_Chamrajpet',2000),
('2','SBI_Residencyroad',5000),
('3','SBI_Shivajiroad',6000),
('4','SBI_ParlimentRoad',9000),
('5','SBI_Jantarmantar',8000),
('6','SBI_Shivajiroad',4000),
('7','SBI_Residencyroad',4000),
('8','SBI_ParlimentRoad',3000),
('9','SBI_Residencyroad',5000),
('10','SBI_Jantarmantar',2000);

select * from bankAccount;

insert into bankcustomer(customername,customerstreet,city) values
('Avinash','bull_temple_road','bangalore'),
('Dinesh','Bannergatta_road','bangalore'),
('mohan','Nationalcollege_road','bangalore'),
('Nikil','Akbar_Road','delhi'),
('Ravi','Prithviraj_road','delhi');

select * from bankcustomer;

insert into depositer(customername,Accno) values
('Avinash','1'),
('Dinesh','2'),
('Nikil','4'),
('Ravi','5'),
('Avinash','8'),
('Nikil','9'),
('Dinesh','10'),
('Nikil','7');

insert into loan(Loannumber,branchname,amount) values
('1','SBI_Chamrajpet', 1000),
('2','SBI_Residencyroad', 2000),
('3','SBI_Shivajiroad', 3000),
('4','SBI_ParlimentRoad', 4000),
('5','SBI_Jantarmantar', 5000);

select branchname, (assets/100000) as assetslakhs
from branch;

select d.customername
from depositer d
join bankAccount a on d.Accno= a.Accno
where a.branchname='SBI_Residencyroad'
group by d.customername
having count(a.accno)>=2;

create view Loannumber
as select branchname , amount
from loan;

select * from Loannumber;