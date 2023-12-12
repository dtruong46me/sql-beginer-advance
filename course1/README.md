## Mô tả dữ liệu nguồn

|Tên bảng|Ý nghĩa bảng|
|-|-|
|EMPLOYEES|Thông tin nhân viên bán hàng
|CUSTOMERS|Thông tin về khách hàng
|CONTACTS|Thông tin liên lạc của Khách hàng
|PRODUCTS|Thông tin về sản phẩm
|PRODUCT_CATEGORIES|Thông tin về nhóm sản phẩm(Liên kết với bảng PRODUCTS qua Product_ID)
|ORDERS|Thông tin về Đơn hàng: Đơn hàng, sale bán, Khách hàng, giá trị Tổng đơn hàng
|ORDER_ITEMS|Thông tin chi tiết của từng đơn hàng: Sản phẩm gì, số lượng, đơn giá(Liên kết với bảng ORDERS qua ORDER_ID)


**-- SELECT * FROM ONE TABLE ---**
1. Lấy tất cả thông tin có trong bảng EMPLOYEES

2. Lấy tất cả thông tin có trong bảng CUSTOMERS

3. Lấy tất cả thông tin có trong bảng ORDERS

4. Lấy tất cả thông tin có trong bảng PRODUCTS


**-- SELECT SPECIFIC COLUMNS in ONE TABLE--**
1. Lấy thông tin EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE trong bảng EMPLOYEES

2. Lấy thông tin CUSTOMER_ID, NAME, ADDRESS trong bảng CUSTOMERS

3. Lấy thông tin ORDER_ID, CUSTOMER_ID, ORDER_DATE, SALE_MAN_ID trong bảng ORDERS

4. Lấy thông tin PRODUCT_ID, PRODUCT_NAME, DESCRIPTION trong bảng PRODUCTS


**-- SELECT COLUMN ALIAS, TABLE ALIAS --**
1. Lấy thông tin EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE và đổi tên thành tiếng việt là MA_NHAN_VIEN, TEN_GOI, TEN_HO, THU_DIEN_TU, NGAY_NHAN_VIEC trong bảng EMPLOYEES

2. Lấy thông tin CUSTOMER_ID, NAME, ADDRESS và đổi tên thành tiếng Việt là MA_KHACH_HANG, TEN_KHACH_HANG, DIA_CHI_KHACH_HANG trong bảng CUSTOMERS

3. Lấy thông tin ORDER_ID, CUSTOMER_ID, ORDER_DATE, SALE_MAN và đổi tên thành tiếng Việt là MA_DON_HANG, MA_KHACH_HANG, NGAY_DAT_HANG, NGUOI_BAN trong bảng ORDERS

4. Lấy thông tin PRODUCT_ID, PRODUCT_NAME, DESCRIPTION và đổi tên thành tiếng Việt là MA_SAN_PHAM, TEN_SAN_PHAM, MO_TA trong bảng PRODUCTS


**-- SELECT DISTINCT --**
1. Lấy ra danh sách tất cả JOB_TITLE trong bảng EMPLOYEE, mỗi JOB_TITLE chỉ xuất hiện 1 lần

2. Lấy ra danh sách tất cả FIRST_NAME trong bảng EMPLOYEE và đảm bảo mỗi FIRST_NAME chỉ xuất hiện 1 lần

**-- WHERE Clause AND OR BETWEEN EQUAL, GREATER, LESS --**
1. Tìm thông tin nhân viên có mã nhân viên là 28

2. Tìm thông tin nhân viên có email nhân viên là "abigail.palmer@example.com" và SĐT là "650.505.4876"

3. Tìm thông tin nhân viên có tên là Elliot hoặc Họ là Cooper

4. Tìm thông tin khách hàng có CREDIT_LIMIT > 1000

5. Tìm thông tin khách hàng có CREDIT_LIMIT >= 2000

6. Tìm thông tin khách hàng có CREDIT_LIMIT < 3200

7. Tìm thông tin khách hàng có CREDIT_LIMIT <=2400

8. Tìm thông tin Order có ORDER_DATE sau ngày 1/1/2017 


**-- TO_DATE('2017-01-01', 'YYYY-MM-DD') --**

9. Tìm thông tin Order có ORDER trong khoảng 1/1/2017 và 1/1/2019 (Dùng 2 cách)



**-- WILDCARD --**
1. Tìm thông tin khách hàng có tên bắt đầu chính xác bằng "American"

2. Tìm thông tin khách hàng có tên kết thúc chính xác bằng "Corp."

3. Tìm thông tin khách hàng có tên chứa  "bank" hoặc "america"

4. Tìm thông tin khách hàng có tên bắt đầu bằng "I" và có 3 ký tự (3 ký tự bao gồm cả I)

5. Tìm thông tin khách hàng có tên kết thúc bằng "P" và có 2 ký tự (2 ký tự bao gồm cả P)

6. Tìm thông tin khách hàng có tên chứa "n" ở vị trí thứ 2 


**-- IN --**
1. Tìm thông tin sản phẩm có tên trong list
(
G.Skill Ripjaws V Series,
ASRock X99 Extreme11,
Intel Xeon E5-2697 V2
)

2. Tìm thông tin sản phẩm không có trong list
(
Corsair Vengeance LPX
Corsair Dominator Platinum
G.Skill Ripjaws V Series
Kingston
Supermicro X10SDV-8C-TLN4F
Intel DP35DPM
Asus X99-E-10G WS
Asus ROG MAXIMUS IX EXTREME
)


## BÀI TẬP VỀ NHÀ
Công ty A đang  cần xây dựng báo cáo cho quý 1/2021. Sử dụng lệnh SQL để lấy ra các báo cáo sau:

- Lấy ra tất cả các sản phẩm mà công ty đang có

- Lấy ra tên của sản phẩm có ID sản phẩm (PRODUCT_ID) = 225

- Lấy ra tất cả các sản phẩm có chi phi định mức (STANDARD_COST) lớn hơn 300

- Lấy ra tất cả các sản phẩm có chi phi định mức (STANDARD_COST) khác 500

- Lấy ra tất cả các sản phẩm có giá niêm yết (LIST_PRICE) trong khoảng từ 300 tới 700

- Lấy ra tất cả các sản phẩm có tên là ‘G.Skill Trident Z’ và có chi phi định mức (STANDARD_COST) lớn hơn 500 

- Lấy ra tất cả các sản phẩm có tên là ‘Corsair Dominator Platinum’ và có chi phi định mức (STANDARD_COST) lớn hơn hoặc bằng  600 và giá niêm yết (LIST_PRICE) > 700

- Lấy ra tất cả các sản phẩm có mã sản phẩm có giá nhỏ hơn 500 

- Lấy ra các sản phẩm có tên sản phẩm có chứa từ khóa là ‘Kingston’

- Lấy ra các sản phẩm có tên bắt đầu bằng ‘G.Skill’ và giá niêm yết (LIST_PRICE) > 650

- Lấy ra các sản phẩm có tên kết thúc bằng ‘Series’ và có mô tả sản phẩm (DESCRIPTION) có chứa từ khóa là ‘128GB’

- Lấy ra tất cả các sản phẩm bắt đầu bằng chữ ‘C’ và có 7 ký tự (Bao gồm cả chữ C) và giá niêm yết (LIST_PRICE) khác 700

- Lấy ra tất cả các sản phẩm có giá niêm yết (LIST_PRICE) lần lượt là 2200, 1850, 1756, 1249


**-- Sử dụng bảng ORDER --**

- Lấy ra tất cả những đơn hàng đã bán trong năm 2017

- Lấy ra tất cả những đơn hàng đã bán từ năm 2016 đến năm 2017	

- Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) lớn hơn ngày ‘2017-02-17’

- Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) là ngày ‘2017-02-17’ và trạng thái đơn hàng (STATUS) là ‘Shipped’

- Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) là ngày ‘2017-02-17’ sắp xếp theo tổng tiền hàng (TOTAL) theo thứ tự tăng dần 

- Lấy tất cả những đơn hàng có ngày đăt hàng (ORDER_DATE) khác ngày ‘2017-08-15’ sắp xếp theo tổng tiền hàng (TOTAL) theo thứ tự giảm dần 

- Lấy tất cả những đơn hàng mà có trạng thái đơn hàng (STATUS)  là ‘Pending’ và ‘Shipped’ và có tổng tiền hàng (TOTAL) lớn hơn 400000. Sắp xếp theo thứ tự tăng dần của ngày đặt hàng (ORDER_DATE).