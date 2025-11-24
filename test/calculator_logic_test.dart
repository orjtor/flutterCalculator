import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/calculator/calculator_logic.dart';

void main() {
  late CalculatorLogic logic;

  setUp(() {
    logic = CalculatorLogic();
  });

  group('performOperation', () {
    test('addering fungerar korrekt', () {
      expect(logic.performOperation(2, 3, '+'), equals(5));
    });

    test('subtraktion fungerar korrekt', () {
      expect(logic.performOperation(10, 3, '-'), equals(7));
    });

    test('multiplikation fungerar korrekt', () {
      expect(logic.performOperation(4, 5, 'x'), equals(20));
    });

    test('division fungerar korrekt', () {
      expect(logic.performOperation(10, 2, '÷'), equals(5));
    });

    test('division med noll ger oändlighet', () {
      expect(logic.performOperation(10, 0, '÷'), equals(double.infinity));
    });
    test('kedjeberäkning 2 + 3 - 1 = ger 4', () {
      double result = 2; // första operand
      result = logic.performOperation(result, 3, '+');
      result = logic.performOperation(result, 1, '-');
      expect(result, equals(4));
    });
  });

  group('formatResult', () {
    test('formaterar heltal utan decimaler', () {
      expect(logic.formatResult(5.0), equals('5'));
    });

    test('formaterar decimaler och tar bort onödiga nollor', () {
      expect(logic.formatResult(3.100), equals('3.1'));
    });

    test('addering med decimaler ger korrekt resultat och format', () {
      expect(logic.performOperation(10.100, 2.0000, '+'), equals(12.1));
    });

    test('formaterar stora heltal korrekt', () {
      expect(logic.formatResult(123456789012345.0), equals('123456789012345'));
    });
  });
}
