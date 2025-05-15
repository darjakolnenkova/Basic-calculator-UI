import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Упростим вычисление выражений

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

  void clear() => display = '0';

  void append(String value) =>
      display = (display == '0') ? value : display + value;

  String eval(String expression) {
    try {
      expression = expression.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
    } catch (_) {
      return 'Error';
    }
  }

  void buttonPressed(String text) {
    setState(() {
      switch (text) {
        case 'C':
          clear();
          break;
        case '=':
          display = eval(display);
          break;
        default:
          append(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                display,
                style: const TextStyle(fontSize: 56),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: buttons.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () => buttonPressed(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}