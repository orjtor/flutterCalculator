import 'package:flutter/material.dart';

class DisplaySection extends StatelessWidget {
  final String historyText;
  final String currentText;

  const DisplaySection({
    super.key,
    required this.historyText,
    required this.currentText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Historik-display (mindre text)
          Text(
            historyText,
            style: const TextStyle(fontSize: 24, color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Nuvarande display (stor text)
          Text(
            currentText,
            style: const TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
