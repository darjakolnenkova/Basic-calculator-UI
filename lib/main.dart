import 'package:flutter/material.dart';
import 'calculator_ui.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light();

    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.from(
        colorScheme: base.colorScheme.copyWith(
          primary: const Color(0xFF8B4513),
          secondary: Colors.orange,
          surface: const Color(0xFFB55C44),
        ),
        textTheme: base.textTheme.copyWith(
          bodyLarge: const TextStyle(color: Color(0xFF800000)),
          bodyMedium: const TextStyle(color: Color(0xFF800000)),
        ),
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFE4E1),
      ),
      home: const CalculatorUI(),
    );
  }
}