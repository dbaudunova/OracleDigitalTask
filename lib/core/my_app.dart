import 'package:flutter/material.dart';
import 'package:oracle_digital_task/presentation/pages/cities_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CitiesScreen(),
    );
  }
}
