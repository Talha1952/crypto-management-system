use cms;
create table users(
user_id varchar(20) primary key,
user_name varchar(20) not null,
phone_no varchar(20) unique,
age int check (age>18),
email varchar(30),
purchase_id int ,constraint fk1 foreign key (purchase_id) references purchase(purchase_id),
sell_id int ,constraint fk2 foreign key (sell_id) references sell(sell_id));

create table coins(
coin_name varchar(20),
coin_id varchar(20) primary key,
price varchar(20) not null,
quantity int );
 
 
create table purchase(
Purchase_id int primary key,
purchase_date date,
coin_id varchar(20),constraint fk3 foreign key (coin_id) references coins(coin_id),
purchase_quantity int);

create table sell(
sell_id int primary key,
sell_date date,
coin_id varchar(20),constraint fk4 foreign key (coin_id) references coins(coin_id),
 sell_quantity int);
insert into users(user_id,user_name,phone_no,age,email,purchase_id,sell_id) values
('01','Aarij Hussain','03322187873',20,'aarijhussain481@gmail.com',0101,001),
('02','Ammad Ali','03331598145',19,'ammadali43@gmail.com',0102,002),
('03','Subhan shakir','03312570150',20,'subhanshakir56@gmail.com',0103,003),
('04','Umair fareed','03325987655',22,'umairfareed35@gmail.com',0104,004),
('05','Basit ali','03156966555',21,'basitali001@gmail.com',0105,005),
('06','Arham khan','03334887625',19,'arhamkhan47@gmail.com',0106,006),
('07','Talha Haseeb','03645498735',25,'talhahaseeb30@gmail.com',0107,007),
('08','Ali ahmed','03310246445',26,'aliahmed55@gmail.com',0108,008),
('09','Ahmed khan','03152323100',23,'ahmedkhan007@gmail.com',0109,009),
('10','Umer mushtaq','03333032105',27,'umermushtaq96@gmail.com',0110,010);

insert into coins(coin_name,coin_id,price,quantity)values
('Bitcoin','BTC01','42,571.10 USD',102441),
('Ethereum','ETH01','2,356.86 USD',102800),
('Tether','USDT01','1.00 USD',87424),
('Dogecoin','DOGE01','0.092 USD',90169),
('Solana','SOL01','99.08 USD',236589);
                                     
insert into purchase(Purchase_id,purchase_date,coin_id,purchase_quantity) values
(0101,'2022-05-06','BTC01',55),
(0102,'2021-04-10','DOGE01',09),
(0103,'2019-11-03','ETH01',07),
(0104,'2015-07-25','USDT01',11),
(0105,'2017-09-16','DOGE01',220),
(0106,'2019-12-31','SOL01',10),
(0107,'2018-04-21','ETH01',03),
(0108,'2023-01-23','USDT01',21),
(0109,'2022-02-05','SOL01',15),
(0110,'2017-01-18','BTC01',04);

insert into sell(sell_id,sell_date,coin_id,sell_quantity) values
(001,'2023-01-15','BTC01',19),
(002,'2022-11-11','SOL01',25),
(003,'2021-07-30','USDT01',18),
(004,'2018-03-25','DOGE01',30),
(005,'2022-09-29','BTC01',05),
(006,'2020-12-16','ETH01',11),
(007,'2023-02-02','BTC01',02),
(008,'2023-09-17','USDT01',14),
(009,'2022-08-16','SOL01',08), 
(010,'2021-05-14','DOGE01',15);
 
 select * from users where purchase_id=0101;
 
 select sell_id,sell_quantity FROM sell order by sell_quantity desc; 
 
 select Purchase_id,purchase_date,sell_id,sell_date from purchase,sell where purchase_date in('2022-05-06','2019-11-03','2023-01-23','2018-04-21') and sell_date in('2021-05-14','2020-12-16','2022-11-11','2022-09-29');
 
select Purchase_id,purchase_date from purchase where purchase_date in('2022-05-06','2019-11-03','2023-01-23','2018-04-21');
select sell_id,sell_date from sell where sell_date in('2021-05-14','2020-12-16','2022-11-11','2022-09-29');

select coin_name,coin_id,quantity from coins order by quantity desc;

select purchase_id,coin_id,purchase_quantity from purchase where coin_id  in ('BTC01','SOL01') order by purchase_quantity desc;
 select coin_name,coin_id,price from coins where price=(select max(price) from coins);
 
 select coin_name,coin_id,price from coins where price=(select min(price) from coins);
 
 select user_name from users where user_name like'a%';
 select avg(sell_quantity)from sell;
 select sum(purchase_quantity)from purchase;

 select * from users  inner join purchase  on users.purchase_id = purchase.Purchase_id;
 select * from users  cross join purchase on users.purchase_id = purchase.Purchase_id;
 select * from users,purchase where users.purchase_id = purchase.Purchase_id;
 select *  from users,purchase where users.purchase_id = 0101 and purchase.purchase_id=0101;

 select * from users  inner join purchase  on users.purchase_id = purchase.Purchase_id inner join coins on purchase.coin_id=coins.coin_id;
 select * from users  inner join sell  on users.sell_id = sell.sell_id inner join coins on sell.coin_id=coins.coin_id;
 select user_name,purchase_date,coin_name from users  inner join purchase  on users.purchase_id = purchase.Purchase_id inner join coins on purchase.coin_id=coins.coin_id;
  select user_name,sell_date,coin_name from users  inner join sell  on users.sell_id = sell.sell_id inner join coins on sell.coin_id=coins.coin_id;
 select user_id,user_name,purchase_date,purchase_quantity,coin_id from users  inner join purchase  on users.purchase_id = purchase.Purchase_id;
 select user_id,user_name,sell_date,sell_quantity,coin_id from users  inner join sell  on users.sell_id = sell.sell_id;