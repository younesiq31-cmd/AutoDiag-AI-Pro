import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const AutoDiagAIProApp());
}

class AutoDiagAIProApp extends StatelessWidget {
  const AutoDiagAIProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutoDiag AI Pro',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const DashboardPage(),
    );
  }
}
