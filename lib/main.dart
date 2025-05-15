import 'package:flutter/material.dart';
import 'calculator_ui.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.light();

    final customColorScheme = baseTheme.colorScheme.copyWith(
      primary: const Color(0xFF8B4513),
      secondary: Colors.orange,
      surface: const Color(0xFFB55C44),
    );

    final customTextTheme = baseTheme.textTheme.copyWith(
      bodyLarge: const TextStyle(color: Color(0xFF800000)),
      bodyMedium: const TextStyle(color: Color(0xFF800000)),
    );

    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.from(
        colorScheme: customColorScheme,
        textTheme: customTextTheme,
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xFFFFE4E1),
      ),
      home: const CalculatorUI(),
    );
  }
}
