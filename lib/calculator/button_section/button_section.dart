import 'package:flutter/material.dart';
import 'calculator_button.dart';
import 'button_type.dart';

class ButtonsSection extends StatelessWidget {
  final Function(String) onNumberPressed;
  final Function(String) onOperatorPressed;
  final VoidCallback onEqualsPressed;
  final VoidCallback onClearPressed;
  final VoidCallback onDecimalPressed;

  const ButtonsSection({
    super.key,
    required this.onNumberPressed,
    required this.onOperatorPressed,
    required this.onEqualsPressed,
    required this.onClearPressed,
    required this.onDecimalPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Rad 1: C och operatorer
          Expanded(
            child: Row(
              children: [
                CalculatorButton(
                  text: 'C',
                  type: ButtonType.function,
                  onPressed: onClearPressed,
                ),
                const Spacer(),
                const Spacer(),
                CalculatorButton(
                  text: '÷',
                  type: ButtonType.operator,
                  onPressed: () => onOperatorPressed('÷'),
                ),
              ],
            ),
          ),
          // Rad 2: 7, 8, 9
          Expanded(
            child: Row(
              children: [
                CalculatorButton(
                  text: '7',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('7'),
                ),
                CalculatorButton(
                  text: '8',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('8'),
                ),
                CalculatorButton(
                  text: '9',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('9'),
                ),
                CalculatorButton(
                  text: 'x',
                  type: ButtonType.operator,
                  onPressed: () => onOperatorPressed('x'),
                ),
              ],
            ),
          ),
          // Rad 3: 4, 5, 6
          Expanded(
            child: Row(
              children: [
                CalculatorButton(
                  text: '4',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('4'),
                ),
                CalculatorButton(
                  text: '5',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('5'),
                ),
                CalculatorButton(
                  text: '6',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('6'),
                ),
                CalculatorButton(
                  text: '-',
                  type: ButtonType.operator,
                  onPressed: () => onOperatorPressed('-'),
                ),
              ],
            ),
          ),
          // Rad 4: 1, 2, 3
          Expanded(
            child: Row(
              children: [
                CalculatorButton(
                  text: '1',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('1'),
                ),
                CalculatorButton(
                  text: '2',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('2'),
                ),
                CalculatorButton(
                  text: '3',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('3'),
                ),
                CalculatorButton(
                  text: '+',
                  type: ButtonType.operator,
                  onPressed: () => onOperatorPressed('+'),
                ),
              ],
            ),
          ),
          // Rad 5: 0 och decimal
          Expanded(
            child: Row(
              children: [
                CalculatorButton(
                  text: '0',
                  type: ButtonType.number,
                  onPressed: () => onNumberPressed('0'),
                  flex: 2,
                ),
                CalculatorButton(
                  text: '.',
                  type: ButtonType.number,
                  onPressed: onDecimalPressed,
                ),
                CalculatorButton(
                  text: '=',
                  type: ButtonType.equals,
                  onPressed: onEqualsPressed,
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
