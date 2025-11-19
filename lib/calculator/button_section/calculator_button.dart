import 'package:flutter/material.dart';
import 'button_type.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final ButtonType type;
  final VoidCallback onPressed;
  final int flex;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.type,
    required this.onPressed,
    this.flex = 1,
  });

  Color _getButtonColor() {
    switch (type) {
      case ButtonType.number:
        return Colors.grey[850]!;
      case ButtonType.operator:
        return Colors.orange[400]!;
      case ButtonType.function:
        return Colors.grey[700]!;
      case ButtonType.equals:
        return Colors.green[400]!;
      case ButtonType.placeholder:
        return Colors.grey[950]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _getButtonColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(24),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
