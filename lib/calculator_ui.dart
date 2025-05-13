import 'package:flutter/material.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  _CalculatorUIState createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {   // класс, где описывается логика и ui
  String display = '0';    // текущий текст

  final List<String> buttons = const [    // список кнопок
    '7', '8', '9', '/',
    '4', '5', '6', 'x',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  void buttonPressed(String buttonText) {   // обработка нажатия на кнопку
    setState(() {
      if (buttonText == 'C') {
        display = '0';
      } else if (buttonText == '=') {
        display = '0';
      } else {
        display = display == '0' ? buttonText : display + buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор')),  // заголовок
      body: Column(   // основной столбец с экраном калькулятора + кнопки
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,   // выравнивание  по нижнему правому краю
              padding: const EdgeInsets.all(24),  // отступы
              child: Text(
                display,   // вывод калькулятора
                style: const TextStyle(fontSize: 56),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,  // - виджет будет сжиматься под размер содержимого
            itemCount: buttons.length,   // кол-во кнопок
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),  // кол-во столбцов в сетке (4 кнопки в ряд)
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),  // отступы между кнопками
                child: ElevatedButton(
                  onPressed: () => buttonPressed(buttons[index]),  // обработка нажатия на кнопку
                  child: Text(
                    buttons[index],     // текст на кнопке
                    style: const TextStyle(fontSize: 24),   // размер текста на кнопке
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
