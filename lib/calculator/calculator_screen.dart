import 'package:flutter/material.dart';
import 'display_section/display_section.dart';
import 'button_section/button_section.dart';
import 'package:flutter_calculator/calculator/calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // STATE - Håll koll på hela beräkningen
  String _currentDisplay = '0';
  String _expression = ''; // Hela uttrycket t.ex "2+3+5-7"
  double _result = 0; // Löpande resultat
  String? _pendingOperator; // Nästa operation att utföra
  bool _shouldResetDisplay = false;
  bool _isNewCalculation = true;

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
      _isNewCalculation = false;
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      final currentValue = double.tryParse(_currentDisplay) ?? 0;
      final formattedValue = CalculatorLogic().formatResult(currentValue);

      if (_isNewCalculation || _pendingOperator == null) {
        // Börja ny beräkning eller första operatorn
        _result = currentValue;
        _expression = '$formattedValue $operator';
        _currentDisplay = formattedValue;
      } else {
        // Utför föregående operation
        _result = CalculatorLogic().performOperation(
          _result,
          currentValue,
          _pendingOperator!,
        );
        _expression += ' $formattedValue $operator';
        _currentDisplay = CalculatorLogic().formatResult(_result);
      }

      _pendingOperator = operator;
      _shouldResetDisplay = true;
    });
  }

  void _onEqualsPressed() {
    if (_pendingOperator == null) return;

    setState(() {
      final currentValue = double.tryParse(_currentDisplay) ?? 0;
      _result = CalculatorLogic().performOperation(
        _result,
        currentValue,
        _pendingOperator!,
      );

      // Kontrollera om resultatet är infinity eller NaN
      if (_result.isInfinite) {
        _currentDisplay = '∞';
      } else if (_result.isNaN) {
        _currentDisplay = 'Error';
      } else {
        _currentDisplay = CalculatorLogic().formatResult(_result);
      }

      _expression += ' ${CalculatorLogic().formatResult(currentValue)} =';
      _pendingOperator = null;
      _shouldResetDisplay = true;
      _isNewCalculation = true;
    });
  }

  void _onClearPressed() {
    setState(() {
      _currentDisplay = '0';
      _expression = '';
      _result = 0;
      _pendingOperator = null;
      _shouldResetDisplay = false;
      _isNewCalculation = true;
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
    final orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: isLandscape ? 1 : 2,
              child: DisplaySection(
                historyText: _expression,
                currentText: _currentDisplay,
              ),
            ),
            Expanded(
              flex: isLandscape ? 4 : 5,
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
