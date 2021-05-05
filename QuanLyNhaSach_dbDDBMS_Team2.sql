create database QuanLyNhaSach
go

use QuanLyNhaSach
go

create table LoaiSanPham
(MaLoaiSP char(10) primary key,
TenLoaiSP nvarchar(30))

create table SanPham
(MaSP char(10) primary key,
TenSP nvarchar(100),
Gia  int,
MoTa nvarchar(100),
SL int,
MaLoaiSP char(10) references LoaiSanPham(MaLoaiSp) )

create table KhachHang
(MaKH char(10) primary key,
TenKH nvarchar(100),
SDT char(9),
DiaChi nvarchar(100))

create table ChiNhanh
(MaCN char(10) primary key,
TenCN nvarchar(100))

create table NhanVien
(MaNV char(10) primary key,
TenNV nvarchar(100),
NgSinh datetime,
DiaChi nvarchar(100),
ChucVu nvarchar(100),
Luong float,
CaLV tinyint
)

create table HoaDon
(MaHD char(10) primary key,
MaKH char(10) references KhachHang(MaKH),
MaNV char(10) references NhanVien(MaNV),
MaSP char (10) references SanPham(MaSP),
NgayMua datetime,
Tongtien int)

create table ChiTietHoaDon
(MaCTHD char(10),
MaHD char(10) references HoaDon(MaHD),
Giaban int,
SL int
)

----------nhap lieu--------------
INSERT INTO LoaiSanPham VALUES ('L1',N'SACHGIAOKHOA')
,('L2',N'TIEUTHUYET')
,('L3',N'TRUYENTRANH')
,('L4',N'VANPHONGPHAM')
go
INSERT INTO SanPham VALUES ('S1',N'SGK Toán Lớp 7',45.000,N'Sách toán lớp 7',15,'L1')
,('S2',N'SGK Văn Lớp 7',50.000,N'Sách văn lớp 7',17,'L1')
,('S3',N'SGK Tiếng Anh Lớp 7',55.000,N'Sách Anh lớp 7',11,'L1')
,('S4',N'Yêu em từ cái nhìn đầu tiên',125.000,N'Tiểu thuyết tình yêu lứa đôi',13,'L2')
,('S5',N'Thượng Ẩn',145.000,N'Tiểu thuyết nước ngoài',16,'L2')
,('S6',N'Ma Đạo Tổ Sư',255.000,N'Văn học nước ngoài',30,'L2')
,('S7',N'Trạng Tí',25.000,N'Truyện tranh Việt Nam',20,'L3')
,('S8',N'Cậu bé bút chì - Shin',45.000,N'Truyện tranh nước ngoài',20,'L3')
,('S9',N'Bút dạ quang',35.000,N'Bút dạ quang màu vàng',50,'L4')
,('S10',N'Bút bi Thiên Long',5.000,N'Bút bi màu xanh',60,'L4')
,('S11',N'Cục tẩy',6.000,N'Tẩy xóa bút chì',40,'L1')
go
INSERT INTO KhachHang VALUES ('KH01',N'Nguyễn Bảo Châu',0898345768,N'Đà Lạt')
,('KH02',N'Ngô Thị Trân',0898394758,N'Nha Trang')
,('KH03',N'Nguyễn Thị Thúy',0898387238,N'Đà Lạt')
,('KH04',N'Trần Văn Sơn',0898213452,N'Đơn Dương')
,('KH05',N'Lại Hữu Kỳ',0898387458,N'Bảo Lộc')
,('KH06',N'Ngô Thị Trâm',0890394758,N'Hải Dương')
,('KH07',N'Nguyễn Thị Trang',0898387788,N'Hà Nội')
,('KH08',N'Trần Kỳ Sơn',0878213452,N'Nam Định')
,('KH09',N'Lâm Anh',0890987458,N'Sơn Tây')
,('KH10',N'Bùi Văn Chiến',0898387008,N'Bảo Lộc')
go
INSERT  INTO ChiNhanh VALUES ('CN01', N'Đà Lạt')
,('CN02',N'Bảo Lộc')
go
INSERT  INTO NhanVien VALUES ('NV01', N'Nguyễn Thị Lợi','1997-03-03',N'Đà Lạt',N'Nhân viên',2000000,'1') 
,('NV02', N'Nguyễn Thị Lộc','1998-04-03',N'Đà Lạt',N'Nhân viên',2000000,'2')
,('NV03', N'Trần Văn Toàn','1999-03-05',N'Đà Lạt',N'Quản lý',5000000,'3')
go
INSERT INTO HoaDon VALUES ('01','KH01','NV02','S1','2021-07-08',45.000)
,('02','KH02','NV01','S2','2021-07-09',50.000)
,('03','KH03','NV03','S7','2021-07-12',25.000)
,('04','KH04','NV03','S9','2021-07-13',35.000)
,('05','KH05','NV02','S3','2021-07-15',55.000)
,('06','KH06','NV02','S5','2021-07-16',145.000)
,('07','KH07','NV01','S4','2021-07-17',125.000)
,('08','KH08','NV01','S6','2021-07-18',255.000)
,('09','KH09','NV02','S8','2021-07-19',45.000)
,('10','KH010','NV02','S10','2021-07-20',5.000)
,('11','KH011','NV03','S5','2021-07-21',145.000)
,('12','KH012','NV01','S8','2021-07-22',45.000)
,('13','KH013','NV03','S11','2021-07-25',6.000)
go
INSERT INTO ChiTietHoaDon VALUES ('1','01',45.000,1)
,('2','02',50.000,1)
,('3','03',25.000,1)
,('4','04',70.000,2)
,('5','05',55.000,1)
,('6','06',145.000,1)
,('7','07',125.000,1)
,('8','08',255.000,1)
,('9','09',90.000,2)
,('10','10',15.000,5)
,('11','11',145.000,1)
,('12','12',45.000,1)
,('13','13',18.000,3)
go

