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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double historyBaseFont = isLandscape ? 16 : 24;
    final double currentBaseFont = isLandscape ? 36 : 56;
    final double pad = isLandscape ? 12 : 24;

    return Padding(
      padding: EdgeInsets.all(pad),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final totalH = constraints.maxHeight;
          // Fördela höjd (justera procentsatser vid behov)
          final historyH = totalH * (isLandscape ? 0.28 : 0.25);
          final spacerH = 4.0;
          final currentH = totalH - historyH - spacerH;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Historik-rad
              SizedBox(
                width: double.infinity,
                height: historyH,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      historyText,
                      maxLines: 1,
                      softWrap: false,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: historyBaseFont,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacerH),
              // Aktuellt värde-rad
              SizedBox(
                width: double.infinity,
                height: currentH,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      currentText,
                      maxLines: 1,
                      softWrap: false,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: currentBaseFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
