# [cite_start]TÀI LIỆU ĐẶC TẢ YÊU CẦU PHẦN MỀM (SRS) [cite: 1]

[cite_start]**Tên dự án:** Hệ thống Quản lý và Điều phối Xe Trung chuyển Thông minh (Smart Shuttle Dispatch System) [cite: 2]  
[cite_start]**Phiên bản:** 1.0 [cite: 3]  
[cite_start]**Ngày lập:** 11/01/2026 [cite: 4]

---

## [cite_start]1. GIỚI THIỆU (INTRODUCTION) [cite: 5]

### 1.1. [cite_start]Mục đích [cite: 6]
* [cite_start]Xây dựng một nền tảng ứng dụng di động và backend hỗ trợ giải quyết bài toán vận tải "Last Mile" (chặng cuối) cho xe trung chuyển[cite: 7].
* [cite_start]Hệ thống tập trung vào việc tự động hóa tối ưu lộ trình đón/trả khách, giám sát thời gian thực (real-time) và hỗ trợ hoạt động ngoại tuyến (offline) cho tài xế[cite: 8].

### 1.2. [cite_start]Phạm vi dự án [cite: 9]
* [cite_start]**Ứng dụng Mobile (Flutter):** Một source code build cho 2 đối tượng (Tài xế và Khách hàng)[cite: 10].
* [cite_start]**Backend Server (Node.js + Express):** Xử lý logic nghiệp vụ, tính toán lộ trình[cite: 11].
* [cite_start]**Database:** MongoDB (Lưu trữ dữ liệu tĩnh), Firebase Realtime Database (Đồng bộ vị trí/trạng thái thời gian thực)[cite: 12].
* [cite_start]**Tích hợp:** Google Maps API (Routing & Navigation)[cite: 13].

### 1.3. [cite_start]Định nghĩa thuật ngữ [cite: 14]
* [cite_start]**Booking:** Đơn đặt xe của khách hàng[cite: 15].
* [cite_start]**Trip (Chuyến đi):** Một lộ trình được hệ thống gom từ nhiều Booking trong cùng một khung giờ[cite: 16].
* [cite_start]**Waypoint (Điểm dừng):** Các điểm đón hoặc trả khách trên lộ trình[cite: 17].
* [cite_start]**Deep Link:** Cơ chế mở trực tiếp ứng dụng Google Maps từ ứng dụng nội bộ[cite: 18].

---

## [cite_start]2. YÊU CẦU CHỨC NĂNG (FUNCTIONAL REQUIREMENTS) [cite: 19]

### 2.1. [cite_start]Phân hệ Khách hàng (Customer App) [cite: 20]

[cite_start]**CN-KH-01: Đăng ký/Đăng nhập** [cite: 21]
* [cite_start]Khách hàng đăng nhập bằng số điện thoại (Sử dụng Firebase Auth OTP)[cite: 22].
* [cite_start]Quản lý thông tin cá nhân (Tên, địa chỉ nhà mặc định)[cite: 23].

[cite_start]**CN-KH-02: Đặt xe (Booking)** [cite: 24]
* [cite_start]Người dùng chọn loại hành trình: "Từ Bến về Nhà" hoặc "Từ Nhà ra Bến"[cite: 25].
* [cite_start]Hệ thống hiển thị các khung giờ cố định (Ví dụ: 08:00, 09:00, 10:00)[cite: 26].
* [cite_start]**Ràng buộc:** Khách chỉ được đặt trước giờ khởi hành ít nhất X phút (Cut-off time) để hệ thống kịp xếp xe[cite: 27].
* [cite_start]Chọn điểm đón/trả trên bản đồ hoặc nhập địa chỉ (Google Places Autocomplete)[cite: 28].

[cite_start]**CN-KH-03: Theo dõi chuyến đi (Real-time Tracking)** [cite: 29]
* [cite_start]Sau khi tài xế bắt đầu chuyến, khách hàng xem được vị trí xe di chuyển mượt mà trên bản đồ (lắng nghe từ Firebase)[cite: 30].
* [cite_start]Hiển thị thông tin tài xế (Tên, Biển số xe, SĐT)[cite: 31].
* [cite_start]Hiển thị thời gian dự kiến đến (ETA)[cite: 32].

[cite_start]**CN-KH-04: Vé điện tử (E-Ticket)** [cite: 33]
* [cite_start]Hệ thống tạo mã QR Code cho mỗi lần đặt vé thành công[cite: 34].
* [cite_start]Dùng để đưa tài xế quét khi lên xe (Check-in)[cite: 35].

### 2.2. [cite_start]Phân hệ Tài xế (Driver App) [cite: 36]

[cite_start]**CN-TX-01: Nhận chuyến & Lộ trình (Trip Management)** [cite: 37]
* [cite_start]Tài xế nhận danh sách các điểm dừng (Stop List) đã được thuật toán sắp xếp tối ưu (ngắn nhất)[cite: 38].
* [cite_start]Danh sách hiển thị rõ: Điểm số 1, Điểm số 2,... Loại (Đón hay Trả), Tên khách, SĐT[cite: 39].
* [cite_start]Hỗ trợ chế độ hoạt động offline (khi mất mạng vẫn xem được danh sách điểm dừng đã tải)[cite: 40].

[cite_start]**CN-TX-02: Điều hướng thông minh (Navigation)** [cite: 41]
* [cite_start]Tại mỗi điểm dừng, có nút "Chỉ đường"[cite: 42].
* [cite_start]Khi bấm, App tự động mở Google Maps App (hoặc Google Maps Go) với chế độ dẫn đường đã điền sẵn toạ độ điểm đến[cite: 43].
* [cite_start]Khi đến nơi, tài xế quay lại ứng dụng để xác nhận[cite: 44].

[cite_start]**CN-TX-03: Quản lý khách hàng (Passenger Handling)** [cite: 45]
* [cite_start]**Check-in (Đón):** Quét QR của khách hoặc bấm nút "Đã đón" thủ công[cite: 46].
* [cite_start]**Check-out (Trả):** Bấm nút "Hoàn thành" khi khách xuống xe[cite: 47].
* [cite_start]**Báo cáo sự cố (Exception):** Đánh dấu "Khách vắng mặt" (No-show) nếu khách không ra đón sau thời gian quy định[cite: 48].

[cite_start]**CN-TX-04: Cập nhật trạng thái (Location Reporting)** [cite: 49]
* [cite_start]App tự động gửi toạ độ GPS lên Firebase Realtime Database (chu kỳ 5s/lần khi xe di chuyển)[cite: 50].
* [cite_start]Tự động đồng bộ trạng thái chuyến đi khi có kết nối mạng trở lại (nếu trước đó bị mất mạng)[cite: 51].

### 2.3. [cite_start]Phân hệ Quản trị (Admin Web Portal) [cite: 52]

[cite_start]**CN-QT-01: Dashboard điều phối** [cite: 53]
* [cite_start]Bản đồ nhiệt (Heatmap) hiển thị vị trí tất cả các xe đang hoạt động[cite: 54].
* [cite_start]Danh sách các chuyến đi trong ngày và trạng thái (Đang chờ, Đang chạy, Hoàn thành)[cite: 55].

[cite_start]**CN-QT-02: Quản lý lộ trình & Can thiệp** [cite: 56]
* [cite_start]Xem chi tiết lộ trình của từng xe[cite: 57].
* [cite_start]Tính năng gán thủ công (Manual Dispatch): Admin có thể chuyển khách từ xe A sang xe B trong trường hợp xe A bị hỏng[cite: 58].

[cite_start]**CN-QT-03: Cấu hình hệ thống** [cite: 59]
* [cite_start]Thiết lập các khung giờ chạy xe[cite: 60].
* [cite_start]Cài đặt thời gian chốt đơn (Cut-off time)[cite: 61].

---

## [cite_start]3. LOGIC HỆ THỐNG & THUẬT TOÁN (SYSTEM LOGIC) [cite: 62]

[cite_start]**CN-HT-01: Thuật toán Tối ưu hóa (Route Optimization)** [cite: 63]
* [cite_start]**Input:** Danh sách N địa chỉ khách hàng trong một khung giờ + 1 địa chỉ Bến xe[cite: 64].
* [cite_start]**Process:** [cite: 65]
    * [cite_start]Node.js gom các đơn hàng[cite: 66].
    * [cite_start]Gọi Google Routes API (Compute Routes) với tham số `optimizeWaypointOrder: true`[cite: 67].
    * [cite_start]Giải quyết bài toán Traveling Salesman Problem (TSP) để tìm đường đi ngắn nhất qua tất cả các điểm[cite: 68].
* [cite_start]**Output:** Một mảng các điểm dừng đã được sắp xếp thứ tự (Ordered Waypoints)[cite: 69].

[cite_start]**CN-HT-02: Cơ chế Real-time (Firebase)** [cite: 70]
* [cite_start]Sử dụng Firebase Realtime Database làm trung gian[cite: 71].
* [cite_start]Node `drivers_location`: Lưu toạ độ mới nhất, ghi đè liên tục để giảm dung lượng[cite: 72].
* [cite_start]Node `trips_status`: Lưu trạng thái từng điểm dừng, sync giữa Driver và Admin[cite: 73].

---

## [cite_start]4. YÊU CẦU PHI CHỨC NĂNG (NON-FUNCTIONAL REQUIREMENTS) [cite: 74]

### 4.1. [cite_start]Hiệu năng (Performance) [cite: 75]
* [cite_start]**Độ trễ vị trí (Latency):** Việc cập nhật vị trí xe từ Tài xế đến Khách hàng không được trễ quá 5 giây trong điều kiện mạng 4G ổn định[cite: 76].
* [cite_start]**Thời gian tính lộ trình:** Hệ thống phải trả về lộ trình tối ưu trong vòng dưới 10 giây cho một chuyến xe có < 20 điểm dừng[cite: 77].

### 4.2. [cite_start]Độ tin cậy (Reliability & Availability) [cite: 78]
* [cite_start]**Offline First:** App Tài xế PHẢI hoạt động được các chức năng cơ bản (xem lộ trình, xác nhận đón khách) ngay cả khi mất kết nối Internet[cite: 79]. [cite_start]Dữ liệu sẽ được đồng bộ (Sync) ngay khi có mạng[cite: 80].
* [cite_start]**Tỷ lệ hoạt động (Uptime) của Server:** 99.5%[cite: 81].

### 4.3. [cite_start]Khả năng mở rộng (Scalability) [cite: 82]
* [cite_start]Backend Node.js được thiết kế theo mô hình Microservices (hoặc Modular Monolith) để dễ dàng scale khi lượng đơn hàng tăng[cite: 83].
* [cite_start]Database MongoDB thiết kế schema chuẩn để query GeoSpatial (truy vấn không gian) nhanh chóng[cite: 84].

### 4.4. [cite_start]Bảo mật (Security) [cite: 85]
* [cite_start]Dữ liệu đường đi và thông tin khách hàng phải được mã hoá khi truyền tải (HTTPS)[cite: 86].
* [cite_start]API phải có cơ chế xác thực (JWT Token) để ngăn chặn truy cập trái phép[cite: 87].
* [cite_start]Dữ liệu vị trí lịch sử của khách hàng cần được ẩn danh hoặc xoá sau một khoảng thời gian nhất định (Privacy)[cite: 88].

### 4.5. [cite_start]Tính khả dụng (Usability) [cite: 89]
* [cite_start]**Giao diện Tài xế:** Phải tối giản, nút bấm lớn, ít thao tác chạm (Touch) để đảm bảo an toàn khi lái xe[cite: 90]. [cite_start]Chữ phải to, rõ ràng[cite: 91].
* [cite_start]**Giao diện Khách hàng:** Bản đồ trực quan, dễ thao tác đặt xe trong 3 bước[cite: 92].

---

## [cite_start]5. YÊU CẦU KỸ THUẬT (TECHNICAL STACK) [cite: 93]

| Thành phần | Công nghệ | Ghi chú |
| :--- | :--- | :--- |
| **Mobile App** | Flutter (Dart) | Build Android & iOS. [cite_start]Sử dụng GetX hoặc Bloc để quản lý State. [cite: 94] |
| **Backend API** | Node.js + Express | [cite_start]RESTful API. [cite: 94] |
| **Database 1** | MongoDB | Lưu User, Trip History, Logs. [cite_start]Dùng Mongoose ODM. [cite: 94] |
| **Database 2** | Firebase Realtime DB | [cite_start]Lưu Location, Live Status. [cite: 94] |
| **Maps Service** | Google Maps Platform | [cite_start]Maps SDK (Mobile), Routes API (Backend), Places API. [cite: 94] |
| **Server** | Linux (Ubuntu/CentOS) | [cite_start]Triển khai trên Docker Container. [cite: 94] |