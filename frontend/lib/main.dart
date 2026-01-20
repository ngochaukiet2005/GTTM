import 'package:flutter/material.dart';
import 'widgets/common_map.dart'; // Import file vừa tạo

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auto Shuttle App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // Tạm thời set home là CommonMap để test hiển thị
      home: const CommonMap(isDriver: false),
    );
  }
}
