use master
go 
create database TTCSN_n13
go
use TTCSN_n13
go
create table ADMIN(
	MaAdmin nchar(10) not null primary key,
	TenAdmin nvarchar(40) not null,
	DiaChi nvarchar(40) not null,
	Email nchar(50) not null,
	SDT nchar(10) not null
)
create table KHACHHANG(
	MaKH nchar(10) not null primary key,
	HoTen nvarchar(60) not null,
	NgaySinh datetime not null,
	GioiTinh bit not null,
	SDT nchar(10) not null,
	DiaChi nvarchar(40) not null,
	Email nchar(50) not null
)
create table TAIKHOAN(
	MaTK nchar(10) not null primary key,
	MaKH nchar(10) not null, 
	MaAdmin nchar(10),
	TenTaiKhoan nvarchar(40) not null,
	MatKhau nchar(20) not null,
	Email nchar(50) not null,
	QuyenTruyCap nvarchar(50) not null,
	NgayLap datetime not null,
	constraint fk_TK_KH foreign key(MaKH) references  KHACHHANG(MaKH),
	constraint fk_TK_AD foreign key(MaAdmin) references  ADMIN(MaAdmin)
)
create table DANHMUC(
	MaDanhMuc nchar(10) not null primary key,
	TenDanhMuc nchar(50) not null,
	MoTa text,
)
create table SANPHAM(
	MaSP nchar(10) not null primary key,
	MaDanhMuc nchar(10) not null,
	TenSP nvarchar(50) not null,
	LoaiSP nvarchar(50) not null,
	HangSX nvarchar(30) not null,
	NgayTao datetime not null,
	constraint fk_SP_DM foreign key (MaDanhMuc) references DANHMUC(MaDanhMuc),
)
create table CHITIETSP(
	MaSP nchar(10) not null primary key, 
	Size nvarchar(10) not null,
	Giaban money not null,
	AnhSP text not null,
	Feedback text,
	Discount float,
	MoTa text,
	constraint fk_CT_SP foreign key (MaSP) references SANPHAM(MaSP)
)
create table DATHANG(
	MaDatHang nchar(10) not null primary key, 
	MaSP nchar(10) not null,
	MaKH nchar(10) not null,
	SoLuong int not null,
	TongTien money not null,
	NgayDat datetime not null,
	Ngaygiaodukien datetime not null,
	constraint fk_DH_SP foreign key (MaSP) references SANPHAM(MaSP),
	constraint fk_DH_KH foreign key (MaKH) references KHACHHANG(MaKH)
)
create table HOADON(
	MaHoaDon nchar(10) not null,
	MaDatHang nchar(10) not null,
	MaKH nchar(10) not null,
	TrangThai text not null,
	ThoiGianGiaoHang datetime not null,
	Feedback text,
	KhieuNai text,
	DiaChiGiaoHang nvarchar(60) not null,
	constraint pk_HD primary key(MaHoaDon, MaDatHang),
	constraint fk_HD_DH foreign key (MaDatHang) references DATHANG(MaDatHang),
	constraint fk_HD_KH foreign key (MaKH) references KHACHHANG(MaKH)
)
drop table CHITIETSP;