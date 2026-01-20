import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CommonMap extends StatefulWidget {
  final bool isDriver; // Biến để phân biệt giao diện nếu cần sau này

  const CommonMap({super.key, this.isDriver = false});

  @override
  State<CommonMap> createState() => _CommonMapState();
}

class _CommonMapState extends State<CommonMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Tọa độ mặc định (Ví dụ: Bến xe Miền Đông mới hoặc vị trí trung tâm TP)
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(10.762622, 106.660172), // Tọa độ mặc định TP.HCM
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Lớp bản đồ nền
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition,
            myLocationEnabled: true, // Hiển thị chấm xanh vị trí hiện tại
            myLocationButtonEnabled:
                false, // Ẩn nút mặc định để tự custom nút đẹp hơn
            zoomControlsEnabled: false, // Ẩn nút zoom +/- mặc định
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),

          // 2. Các nút chức năng nổi lên trên bản đồ (Floating Buttons)
          Positioned(
            bottom: 100, // Đẩy lên cao để chừa chỗ cho BottomSheet sau này
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.my_location, color: Colors.blue),
                  onPressed: () {
                    // Logic quay về vị trí hiện tại sẽ code sau
                  },
                ),
              ],
            ),
          ),

          // 3. Hiển thị Role để debug (Tạm thời)
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(blurRadius: 5, color: Colors.black26),
                ],
              ),
              child: Text(
                widget.isDriver ? "Giao diện Tài Xế" : "Giao diện Khách Hàng",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
