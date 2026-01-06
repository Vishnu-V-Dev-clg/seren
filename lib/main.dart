import 'package:flutter/material.dart';
import 'pages/stress_home.dart';

void main() {
  runApp(const StressApp());
}

class StressApp extends StatelessWidget {
  const StressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StressHome(),
    );
  }
}
