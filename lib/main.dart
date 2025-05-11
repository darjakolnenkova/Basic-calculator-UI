import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light();

    return MaterialApp(
      title: 'Calculator',
      theme: _buildTheme(base),
      home: const CalculatorUI(),
    );
  }

  ThemeData _buildTheme(ThemeData base) {
    return ThemeData.from(
      colorScheme: base.colorScheme.copyWith(
        primary: Color(0xFF8B4513),
        secondary: Colors.orange,
        surface: const Color(0xFFB55C44),
      ),
      textTheme: base.textTheme.copyWith(
        bodyLarge: const TextStyle(color: Color(0xFF800000)),
        bodyMedium: const TextStyle(color: Color(0xFF800000)),
      ),
    ).copyWith(
      scaffoldBackgroundColor: const Color(0xFFFFE4E1),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String display = '0';

  final List<String> buttons = const [
    '7', '8', '9', '/',
    '4', '5', '6', 'x',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  void buttonPressed(String buttonText) {
    setState(() {
      display = _calculateDisplay(buttonText);
    });
  }

  String _calculateDisplay(String buttonText) {
    if (buttonText == 'C') {
      return '0';
    } else if (buttonText == '=') {
      return '0';
    } else {
      return display == '0' ? buttonText : display + buttonText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: [
          _buildDisplay(),
          _buildButtonGrid(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(24),
        child: Text(
          display,
          style: const TextStyle(fontSize: 56),
        ),
      ),
    );
  }

  Widget _buildButtonGrid() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: buttons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return _buildButton(buttons[index]);
      },
    );
  }

  Widget _buildButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => buttonPressed(label),
        child: Text(
          label,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}