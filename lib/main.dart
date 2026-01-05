import 'package:flutter/material.dart';
import 'calculator/calculator_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 360,
            maxWidth: 600,
            minHeight: 500,
            maxHeight: 1000,
          ),
          child: const CalculatorScreen(),
        ),
      ),
    );
  }
}
