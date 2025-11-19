import 'package:flutter/material.dart';
import 'display_section/display_section.dart';
import 'button_section/button_section.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // STATE - All data som kan ändras
  String _currentDisplay = '0';
  String _historyDisplay = '';
  double? _firstOperand;
  String? _operator;
  bool _shouldResetDisplay = false;

  // ============================================
  // LOGIK - Hantera knapptryckningar
  // ============================================

  void _onNumberPressed(String number) {
    setState(() {
      if (_shouldResetDisplay || _currentDisplay == '0') {
        _currentDisplay = number;
        _shouldResetDisplay = false;
      } else {
        _currentDisplay += number;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      _firstOperand = double.tryParse(_currentDisplay);
      _operator = operator;
      _historyDisplay = '$_currentDisplay $operator';
      _shouldResetDisplay = true;
    });
  }

  void _onEqualsPressed() {
    if (_firstOperand == null || _operator == null) return;

    setState(() {
      final secondOperand = double.tryParse(_currentDisplay);
      if (secondOperand == null) return;

      double result = 0;
      switch (_operator) {
        case '+':
          result = _firstOperand! + secondOperand;
          break;
        case '-':
          result = _firstOperand! - secondOperand;
          break;
        case 'x':
          result = _firstOperand! * secondOperand;
          break;
        case '÷':
          result = secondOperand != 0 ? _firstOperand! / secondOperand : 0;
          break;
      }

      _historyDisplay = '$_historyDisplay $_currentDisplay =';
      _currentDisplay = result.toString();
      _firstOperand = null;
      _operator = null;
      _shouldResetDisplay = true;
    });
  }

  void _onClearPressed() {
    setState(() {
      _currentDisplay = '0';
      _historyDisplay = '';
      _firstOperand = null;
      _operator = null;
      _shouldResetDisplay = false;
    });
  }

  void _onDecimalPressed() {
    setState(() {
      if (!_currentDisplay.contains('.')) {
        _currentDisplay += '.';
      }
    });
  }

  // ============================================
  // UI - Bygga gränssnittet
  // ============================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // DISPLAY-SEKTION (Historik + Nuvarande)
            Expanded(
              flex: 2,
              child: DisplaySection(
                historyText: _historyDisplay,
                currentText: _currentDisplay,
              ),
            ),

            // KNAPPAR-SEKTION
            Expanded(
              flex: 5,
              child: ButtonsSection(
                onNumberPressed: _onNumberPressed,
                onOperatorPressed: _onOperatorPressed,
                onEqualsPressed: _onEqualsPressed,
                onClearPressed: _onClearPressed,
                onDecimalPressed: _onDecimalPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
