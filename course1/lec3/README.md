## Lec 3: CẤU TRÚC VÀ THAO TÁC DỮ LIỆU

**Thao tác cấu trúc dữ liệu**

- `CREATE TABLE`: Tạo bảng
    + Fields:
        + column_name
        + datatype
        + constraint *(optional)*
    + Constraints:
        + `NOT NULL`
        + `NULL`
        + `IDENTITY`
        + `DEFAULT`
        + `PRIMARY KEY`
        + `FOREIGN KEY .. REFERENCES`
        + `CHECK`

- `DROP TABLE`: Xóa bảng

- `ALTER TABLE .. RENAME TO ..`: Chỉnh sửa tên bảng

- `ALTER TABLE`
    + `ADD`: Thêm cột 
    + `DROP COLUMN`: Xóa cột
    + `RENAME COLUMN .. TO ..`: Đổi tên cột
    + `MODIFY`: Chỉnh sửa cột (Datatype)

**Thao tác dữ liệu**

- `INSERT INTO .. VALUES`: Thêm 1 record vào bảng

- `INSERT INTO .. SELECT`: Thêm dữ liệu vào bảng bằng dữ liệu có sẵn ở bảng khác

- `UPDATE .. SET .. (WHERE..)`: Cập nhật dữ liệu

- `DELETE FROM .. (WHERE..)`: Xóa dữ liệu với điều kiện nào đó

- `TRUNCATE TABLE`: Xóa toàn bộ bản ghi (Không có `WHERE`)

**Kiểu dữ liệu Oracle**

- `CHAR`: Độ dài cố định, tối đa 255

- `VARCHAR`: Độ dài thay đổi, khi khai báo phải nêu số lượng ký tự tối đa
- `VARCHAR2`: Giống `VARCHAR`, khuyên dùng kiểu dữ liệu này
- `NUMBER`: Tương ứng số thực
- `INTEGER`: Số nguyên
- `FLOAT`: 
- `DATE`: 
- `TIMESTAMP`: 