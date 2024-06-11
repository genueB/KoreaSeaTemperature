import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const KoreaTemperatureApp());
}

class KoreaTemperatureApp extends StatelessWidget {
  const KoreaTemperatureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
