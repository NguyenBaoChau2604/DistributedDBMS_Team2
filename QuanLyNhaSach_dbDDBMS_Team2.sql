create database QuanLyNhaSach
go

use QuanLyNhaSach
go

create table LoaiSanPham
(MaLoaiSP char(10) primary key,
TenLoaiSP nvarchar(100))

create table SanPham
(MaSP char(10) primary key,
TenSP nvarchar(100),
Gia  int,
MoTa nvarchar(100),
SL int,
MaLoaiSP char(10) references LoaiSanPham(MaLoaiSP) )

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

----------nhap lieu (trân)-----------------
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
go
INSERT  INTO ChiNhanh VALUES ('CN01', N'Đà Lạt')
,('CN02',N'Bảo Lộc')
go
INSERT  INTO NhanVien VALUES ('NV01', N'Nguyễn Thị Lợi','1997-03-03',N'Đà Lạt',N'Nhân viên',2000000,'1') 
,('NV02', N'Nguyễn Thị Lộc','1998-04-03',N'Đà Lạt',N'Nhân viên',2000000,'2')
,('NV03', N'Trần Văn Toàn','1999-03-05',N'Đà Lạt',N'Quản lý',5000000,'3')
go
INSERT INTO HoaDon VALUES ('01','KH01','NV02','S1','2021-07-08',45000)
,('02','KH02','NV01','S2','2021-08-08',50000)
,('03','KH03','NV03','S7','2021-07-12',25000)
go
INSERT INTO ChiTietHoaDon VALUES ('1','01',45000,1)
,('2','02',50000,1)
,('3','03',25000,1)
go
----------thu tuc
------------Thúy------------------
----Quan lý danh sách sản phẩm-----------
--------Xem thông tin danh sách sản phẩm-------
create procedure tt_SanPham
as
select * from SanPham
go
exec tt_SanPham
-----Thêm Sản Phẩm------

create procedure them_SanPham
@MaSP char(10), @TenSP nvarchar(100), @Gia int, @MoTa nvarchar(100), @SL int, @MaLoaiSP char(10)
as

If not exists(select * from SanPham where MaSP=@MaSP)
	Begin
	insert into SanPham values(@MaSP,@TenSP,@Gia,@MoTa,@SL,@MaLoaiSP)
	print N'Đã thêm sản phẩm thành công'
	End
Else
	print N'Mã sản phẩm cần thêm đã có trong CSDL'

go
 exec them_SanPham 'S13',N'SGK Văn Lớp 9',50.000,N'Sách văn lớp 9',17,'L1'
 select * from SanPham

 ----Sửa Sản Phẩm----
create procedure update_SanPham
 @MaSP char(10), @TenSP nvarchar(100), @Gia int, @MoTa nvarchar(100), @SL int, @MaLoaiSP char(10)
 As
If  exists(select * from SanPham where MaSP=@MaSP)
	Begin
		Update SanPham
		Set TenSP=@TenSP, Gia=@Gia, MoTa= @MoTa, SL= @SL, MaLoaiSP= @MaLoaiSP
		where MaSP=@MaSP
		print N'Đã cập nhật sản phẩm thành công'
	End
Else
	print N'Không có sản phẩm trong cơ sở dữ liệu'
Go
exec update_SanPham'S1',N'SGK Văn lớp 10',45.000,N'Sách văn lớp 10',15,'L2'

---Xóa Sản Phẩm---
create procedure xoaSanPham
@MaSP char(10)
as
if  not exists (select *from HoaDon where MaSP= @MaSP)
	Begin
	Delete from SanPham where MaSP=@MaSP
	print N'Đã xóa sản phẩm thành công'
	End
else
	print N'Không xóa được sản phẩm trong cơ sở dữ liệu'
go
exec xoaSanPham 'S10'

---Tìm kiếm Sản Phẩm theo MaSP---
create procedure tim_TheoMa
@MaSP char(10)
as
	select *from SanPham where MaSP=@MaSP
		
go

exec tim_TheoMa 'S13'

---Tìm kiếm Sản Phẩm theo TenSP---
create procedure tim_TheoTen
@TenSP nvarchar(100)
as
	select * from SanPham where TenSP=@TenSP
go
 exec tim_TheoTen N'SGK Văn Lớp 9'

 ---Tìm kiếm Sản Phẩm theo LoaiSP---
 create procedure tim_TheoLSP
 @MaLSP char(10)
 as
	select * from SanPham where MaLoaiSP=@MaLSP
go
exec tim_TheoLSP 'L1'
------------Thúy-------------------

------------Châu-------------------------
---------Tính tổng tiền của hóa đơn
create procedure sp_TongTienHD
@MaHD char(10),@TenSP nvarchar(100), @Tong int
as
	select hd.MaHD,sp.TenSP,sum(hd.Tongtien)
	from  SanPham sp,HoaDon hd
	where sp.MaSP=hd.MaSP and hd.MaHD=@MaHD
go

exec sp_TongTienHD '01';
------------Hiển thị nhân viên theo chi nhánh
create procedure sp_TtinNVCN
@MaCN char(10)
as
	select nv.*
	from NhanVien nv,ChiNhanh cn
	where MaCN=@MaCN
go

exec sp_TtinNVCN @MaCN = 'CN01';
--------Danh sách 3 mặt hàng bán chạy nhất theo doanh thu
create procedure sp_DSSPBanChay
as
	select top 3 sp.MaSP,sp.TenSP
	from SanPham sp,HoaDon hd
	where sp.MaSP=hd.MaSP
	order by hd.Tongtien desc
go

exec sp_DSSPBanChay;
-------Doanh thu hóa đơn theo ngày
create procedure sp_DoanhThuNgay
@NgayMua datetime
as
	select NgayMua, sum(Tongtien) as DoanhThuNgay
	from HoaDon
	where NgayMua=@NgayMua
	group by NgayMua
go

exec sp_DoanhThuNgay '2021-07-08';
-------Doanh thu theo tháng của năm 2021
create procedure sp_DoanhThuThanhTheoNam
@NgayMua datetime
as
	select month(hd.NgayMua) as Thang, sum(hd.Tongtien) as DoanhThuThang
	from HoaDon hd
	where YEAR(hd.NgayMua) = YEAR(@NgayMua)
	group by MONTH(hd.NgayMua)
go

exec sp_DoanhThuThanhTheoNam '2021';
------Tính tổng số lượng bán ra trong tháng 8/2021
create procedure sp_TinhTongSLBanRa
@MaSP char(10)
as
	select hd.MaSP,SUM(cthd.SL) as SLBanRa
	from ChiTietHoaDon cthd, HoaDon hd
	where cthd.MaHD=hd.MaHD 
		and MONTH(hd.NgayMua) = 8
		and YEAR(hd.NgayMua) = 2021
		and hd.MaSP = @MaSP
	group by hd.MaSP
go

exec sp_TinhTongSLBanRa 'S1';
-----Danh sách các sản phẩm không bán được
create procedure sp_DSSPKhongBan
as
	select sp.MaSP,sp.TenSP
	from SanPham sp
	where  not exists (select hd.MaSP from HoaDon hd where sp.MaSP = hd.MaSP)
go

exec sp_DSSPKhongBan ;
--------------------Châu------------------

