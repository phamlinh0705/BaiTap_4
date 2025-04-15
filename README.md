# BaiTap_4
Bài tập 04 của SV: K225480106037 - Phạm Khắc Linh - Môn Hệ Quản trị Cơ sở dữ liệu
Yêu cầu bài toán:
Tạo csdl cho hệ thống TKB (đã nghe học, đã xem cách làm)
Nguồn dữ liệu: TMS.tnut.edu.vn
Tạo các bảng tuỳ ý (3nf)
Tạo truy vấn ra thông tin gồm 4 cột: họ tên gv, môn dạy, giờ vào lớp, giờ ra. trả lời câu hỏi: trong khoảng thời gian từ datetime1 tới datetime2 thì có những gv nào đang bận giảng dạy.
Các bước thực hiện:
Tạo mới repo github: đặt tên tùy ý (có liên quan đến bài tập này)
Tạo file readme.md, chỉnh sửa trực tuyến:
dán những ảnh chụp màn hình
gõ mô tả văn bản cho hình ảnh đó
Gợi ý:
sử dụng tms => dữ liệu thô => tiền xử lý => dữ liệu như ý (3nf)
tạo các bảng phù hợp với cấu trúc
chèn nhiều hàng từ excel vào cửa sổ chỉnh sửa bảng dữ liệu 1 (quan sát thì sẽ làm được)
Bài làm
1. Tạo CSDL TKB
 ![image](https://github.com/user-attachments/assets/1704a470-0ad0-451a-ad2b-5ebd61d7d0de)
Tạo bảng GIAOVIEN
![image](https://github.com/user-attachments/assets/e026f8cc-33ed-424e-89b3-8c9760f8a52e)
Tạo bảng MONHOC
![image](https://github.com/user-attachments/assets/f05fbd19-1e39-46db-8cd5-3bc128e3fec4)
Tạo bảng LOPHOCPHAN
![image](https://github.com/user-attachments/assets/99fa5711-ae19-4237-854e-a5b5ce457aab)
Tạo bảng TKB
![image](https://github.com/user-attachments/assets/588fd6ce-f562-4c1c-a468-5b871acfae61)
2. Khóa cài đặt ngoại lệ
   ![image](https://github.com/user-attachments/assets/7c18943c-d835-4273-909d-37557affcb55)
   Tại bảng lớp học, thiết lập khóa ngoại (FK)
Khóa cài đặt ngoại trừ bảng ( TKB ) và bảng ( GIAOVIEN ) thông qua MaGV
Khóa thiết lập ngoại trừ bảng ( TKB ) và bảng ( MONHOC ) thông qua MaMH
Khóa thiết lập ngoại trừ bảng ( TKB ) và bảng ( LOPHOCPHAN ) thông qua MaLop
3. Thêm demo thông tin cho bảng GIAOVIEN
Bước 1: Truy cập nguồn dữ liệu TMS.tnut.edu.vn
![image](https://github.com/user-attachments/assets/27958ac6-c295-4445-afa2-33846adf2fde)
Bảng GiaoVien
![image](https://github.com/user-attachments/assets/97d74a42-27f8-4eec-959b-c408c8f893dd)
Bảng MonHoc
![image](https://github.com/user-attachments/assets/728a981b-fe11-4bb6-97dc-c4c533d49e6b)
Bảng LopHP
![image](https://github.com/user-attachments/assets/9fd0d480-53da-4b9e-b69b-2218f3583c23)
Bảng TKB
![image](https://github.com/user-attachments/assets/3ff55f66-b01b-468b-86b1-73ed3180fe1b)
4. Truy vấn SQL để ra thông tin gồm 4 cột: họ tên gv, môn dạy, giờ vào lớp, giờ ra.
![image](https://github.com/user-attachments/assets/75f37ff7-8a17-4e86-8315-0c94c2741149)
CODE lệnh truy vấn
DECLARE @datetime1 DATETIME = '2025-03-17 15:30:00';
DECLARE @datetime2 DATETIME = '2025-03-19 18:30:00';

SELECT 
    GV.HoTen AS HoTenGV,
    MH.TenMonHoc AS TenMonDay,
    TKB.GioVao,
    TKB.GioRa
FROM TKB
JOIN GIAOVIEN GV ON TKB.MaGV = GV.MaGV
JOIN MONHOC MH ON TKB.MaMH = MH.MaMH
WHERE 
    (TKB.GioVao BETWEEN CAST(@datetime1 AS TIME) AND CAST(@datetime2 AS TIME)) 
    OR
    (TKB.GioRa BETWEEN CAST(@datetime1 AS TIME) AND CAST(@datetime2 AS TIME)) 
    OR
    (CAST(@datetime1 AS TIME) BETWEEN TKB.GioVao AND TKB.GioRa)
    OR
    (CAST(@datetime2 AS TIME) BETWEEN TKB.GioVao AND TKB.GioRa);






