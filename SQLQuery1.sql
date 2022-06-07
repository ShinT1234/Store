CREATE DATABASE Store
USE Store
GO
CREATE TABLE Customer(
	cusID int PRIMARY KEY NOT NULL,
	name nvarchar(40) NOT NULL,
	address nvarchar(50) NOT NULL,
	tel int NOT NULL,
	status nvarchar(40)
)
GO
CREATE TABLE Product(
	productID int PRIMARY KEY NOT NULL,
	name nvarchar(40) NOT NULL,
	description nvarchar(40),
	unit nvarchar(40),
	price money,
	qty int
)
GO
CREATE TABLE Oder(
	orderID int PRIMARY KEY,
	cusID int CONSTRAINT cus FOREIGN KEY(cusID) REFERENCES Customer(cusID),
	orderdate date,
	status nvarchar(40)
)
CREATE TABLE OderDetails(
	orderID int CONSTRAINT oderID FOREIGN KEY(orderID) REFERENCES Oder(orderID),
	productID int CONSTRAINT productID FOREIGN KEY(productID) REFERENCES Product(productID),
	price money,
	qty int NOT NULL
)
GO
SELECT * FROM Customer
SELECT * FROM Product
SELECT * FROM Oder
SELECT * FROM OderDetails

GO
INSERT INTO Product(productID,name,description,unit,price,qty) VALUES (1,N'Máy Tính T450',N'Máy Nhập Mới',N'Chiếc',1000,1)
INSERT INTO Product(productID,name,description,unit,price,qty) VALUES (2,N'Điện Thoại Nokia 5670',N'Điện Thoại Đang Hot',N'Chiếc',400,2)
INSERT INTO Product(productID,name,description,unit,price,qty) VALUES (3,N'Máy In SamSung 450',N'Máy in đang ế',N'Chiếc',100,1)
INSERT INTO Customer(cusID,name,address,tel,status) VALUES (1,N'Nguyễn Văn An',N'111 Nguyễn Trãi,Thanh Xuân,Hà Nội',987654321,N'Khách Hàng Thân Thiết')
INSERT INTO Oder(orderID,cusID,orderdate,status) VALUES (1,1,'04-06-2022',N'Quá Hạn Hơi lâu')
INSERT INTO OderDetails(orderID,productID,price,qty) VALUES (1,2,200,4)