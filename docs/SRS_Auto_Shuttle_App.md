# SOFTWARE REQUIREMENTS SPECIFICATION (SRS)
## ỨNG DỤNG XE TRUNG CHUYỂN TỰ ĐỘNG

---

## 1. Giới thiệu
Ứng dụng hỗ trợ hành khách đặt xe trung chuyển, chọn điểm đón trên bản đồ và theo dõi xe theo thời gian thực.

---

## 2. Phạm vi hệ thống
- Mobile App: Flutter
- Backend: Node.js + Express
- Database: MongoDB (NoSQL)
- Realtime: Firebase Realtime Database

---

## 3. Đối tượng sử dụng
- Hành khách
- Tài xế

---

## 4. Yêu cầu chức năng

### 4.1 Hành khách
- Đăng nhập
- Xác định vị trí hiện tại realtime
- Chọn điểm đón / trả bằng bản đồ nhúng
- Đặt chuyến
- Theo dõi vị trí xe realtime

### 4.2 Tài xế
- Đăng nhập
- Nhận chuyến
- Xem lộ trình tổng quát trong app
- Chuyển sang Google Maps để dẫn đường từng chặng
- Cập nhật trạng thái chuyến

### 4.3 Hệ thống
- Phân xe tự động
- Ghép chuyến
- Cập nhật ETA

---

## 5. Yêu cầu phi chức năng
- Thời gian phản hồi < 5s
- Giao diện dễ sử dụng
- Bảo mật JWT + role

---

## 6. Công nghệ
- Flutter + Google Maps SDK
- Node.js + Express
- MongoDB
- Firebase Realtime Database
- Google Maps App Navigation

---

## 7. Giả định
- Có Internet
- 1 bến trung chuyển cố định

---

## 8. Kết luận
Hệ thống khả thi, dễ triển khai, phù hợp đồ án sinh viên.