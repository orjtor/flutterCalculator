class CalculatorLogic {
  double performOperation(double first, double second, String operator) {
    switch (operator) {
      case '+':
        return first + second;
      case '-':
        return first - second;
      case 'X':
      case 'x':
        return first * second;
      case '÷':
        return first / second;
      default:
        return second;
    }
  }

  String formatResult(double value) {
    // Heltal utan decimaler
    if (value == value.toInt() && value.abs() < 1e15) {
      return value.toInt().toString();
    }

    // Har decimaler - visa dem utan onödiga nollor
    String result = value.toString();

    // Ta bort trailing zeros efter decimalpunkt
    if (result.contains('.')) {
      // Ta bort nollor i slutet
      result = result.replaceAll(RegExp(r'0+$'), '');
      // Ta bort punkt om bara nollor finns
      result = result.replaceAll(RegExp(r'\.$'), '');
    }

    return result;
  }
}
