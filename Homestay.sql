
CREATE DATABASE Homestay;

use Homestay;
CREATE TABLE Manager(
	id_user INT,
	username VARCHAR(20)  NOT NULL,
	password VARCHAR(20) NOT NULL,
	role VARCHAR(10) NOT NULL,
	more_detail VARCHAR(100),
	PRIMARY KEY (id_user)
)
INSERT INTO Manager
VALUES (4844,'thanhnt','123456','admin','none'),
(4843,'thuanbq','123456','admin','none'),
(4845,'dungtt','123456','admin','none'),
(4430,'tuankieu','123123','staff','new staff'),
(4425,'tien','123','staff','new staff'),
(4400,'dai','123','staff','old staff')

CREATE TABLE Destination(
	id_location INT,
	name_location VARCHAR(30) NOT NULL,
	address VARCHAR(100) NOT NULL,
	more_detail VARCHAR(100),
	PRIMARY KEY (id_location)
)
INSERT INTO Destination
VALUES (2901,'Hanoi','14A1 Ly Nam De, Hang Ma, Hoan Kiem, Hanoi','none'),
(2902,'Hanoi','91B Ly Thuong Kiet, Cua Nam, Hoan Kiem, Hanoi','none'),
(4901,'Da Lat','26B Trieu Viet Vuong, Da Lat','none'),
(2903,'Hanoi','2F Quang Trung, quan Hoan Kiem, Hanoi','none'),
(5001,'TP. Ho Chi Minh','ap 1 xa Phong Phu, huyen Binh Chanh, Hồ Chí Minh','none'),
(1501,'Hai Phong','So 350 Ha Sen, Cat Ba, Hai Phong','none')

CREATE TABLE Room(
	id_room INT,
	id_location INT,
	id_user INT,
	type_of_room VARCHAR(10) NOT NULL,
	max_people INT NOT NULL CHECK (max_people >0) ,
	cost_per_day FLOAT NOT NULL CHECK (cost_per_day>0),
	state INT NOT NULL,
	other_information VARCHAR(100),
	PRIMARY KEY (id_room),
	FOREIGN KEY (id_location) REFERENCES Destination(id_location),
	FOREIGN KEY (id_user) REFERENCES Manager(id_user)
	ON DELETE SET NULL

)
INSERT INTO Room
VALUES 
(202211,2901,4844,'single',1,20,1,'Amazing stay- homestay, city view, near center Hanoi'),
(202212,2901,4844,'double',2,35,0,'Amazing stay- homestay, city view, near center Hanoi'),
(202213,2901,4844,'triple',1,90,1,'Amazing stay- homestay, city view, near center Hanoi'),

(202221,2902,4843,'single',1,20,1,'Located 1.6 km from West Lake, Vitamin Home West Lake'),
(202222,2902,4843,'double',2,40,1,'Located 1.6 km from West Lake, Vitamin Home West Lake'),

(202231,4901,4845,'single',1,30,0,'Ngoc Lan Villa Dalat offers accommodation in Da Lat.'),

(202241,2903,4430,'single',1,29,1,'The homestay comes with a flat-screen TV. '),
(202242,2903,4430,'group',5,120,1,'The homestay comes with a flat-screen TV. '),


(202251,5001,4425,'single',1,25,0,'Cochin Zen Homestay equips a special system'),

(202261,1501,4400,'group',7,200,0,'Located in the center of city')

CREATE TABLE Service(
	id_service INT,
	name_service VARCHAR(30) NOT NULL,
	cost FLOAT NOT NULL CHECK (cost >0),
	more_detail VARCHAR(100),
	PRIMARY KEY (id_service)
)
INSERT INTO Service
VALUES (1, 'breakfast buffet', 20, 'A breakfast buffet is provided every morning'),
(2, 'dinner barbecue', 30, 'One dinner is served as barbecue'),
(3, 'massage', 20, 'none'),
(4, 'motobike hiring', 10, 'Customers hire motorbikes to go around'),
(5, 'coffee garden', 15, 'Coffe with sightseeing')

CREATE TABLE Customer(
	id_customer INT,
	fullname VARCHAR(50) NOT NULL,
	age INT NOT NULL check(age>0), 
	gender VARCHAR(1) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL,
	address VARCHAR(100) NOT NULL,
	PRIMARY KEY (id_customer)
)
INSERT INTO Customer
VALUES (20224844,'Tran Hoang Nam',20,'M','0972546013','namth@gmail.com','Hai Ba Trung, Ha Noi'),
(20223529,'Nguyen Trong Hoang',25,'M','0354167124','hoang@gmail.com','An Thi, Hung Yen'),
(20225385,'Tran Nhat Quynh',21,'F','0346912751','quynhtranjp@gmail.com','Cau Giay, Ha Noi'),
(20226365,'Le Xuan Huy',46,'M','0865123488','huyle123@gmail.com','Ba Dinh, Ha Noi'),
(20224563,'Nguyen Thi Loi',50,'F','0845613055','loi12@gmail.com','Thanh Xuan, Ha Noi'),
(20222353,'Tran Thi Ngoc Lan',30,'F','0844512379','lantran@gmail.com','Viet Tri, Phu Tho')

CREATE TABLE Statistical(
	id_stt INT,
	total FLOAT NOT NULL CHECK(total>0),
	id_room INT,
	id_service INT,
	id_customer INT,
	PRIMARY KEY (id_stt),
	FOREIGN KEY (id_room) REFERENCES Room(id_room),
	FOREIGN KEY (id_service) REFERENCES Service(id_service),
	FOREIGN KEY (id_customer) REFERENCES Customer(id_customer) ON DELETE SET NULL
)
INSERT INTO Statistical
VALUES
(1001,20,202211,1,20224844),
(1002,30,202211,2,20224844),
(1003,15,202212,5,20224844),
(1004,20,202213,1,20224844),
(1005,20,202221,3,20225385),
(1006,10,202222,4,20225385)
