import 'package:assignment/service_locator.dart';
import 'package:assignment/ui/screens/homepage_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator(); // Call setupLocator to initialize GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Homepage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomepageScreen(),
    );
  }
}