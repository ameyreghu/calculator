import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculatorProvider with ChangeNotifier {
  String _input = '';
  String _result = '';

  String get input => _input;
  String get result => _result;

  TextEditingController controller = TextEditingController();

  bool get inputHasOperators {
    if (_input.contains('+')) {
      return true;
    } else if (_input.contains('-')) {
      return true;
    } else if (_input.contains('÷')) {
      return true;
    } else if (_input.contains('X')) {
      return true;
    } else if (_input.contains('^')) {
      return true;
    } else {
      return false;
    }
  }

  setText(String val) {
    _input += val;
    if (inputHasOperators) evaluate();
    notifyListeners();
  }

  clear(String text) {
    if (text == 'AC') {
      _input = '';
      _result = '';
    } else {
      _input = _input.substring(0, _input.length - 1);
    }

    notifyListeners();
  }

  formatInput() {
    _input = _input.replaceAll('X', '*');

    _input = _input.replaceAll('÷', '/');
  }

  evaluate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_input);
      ContextModel cm = ContextModel();
      num eval = exp.evaluate(EvaluationType.REAL, cm);
      _result = eval.toString();
    } catch (e) {
      //
    }
  }

  void calculate() {
    formatInput();
    evaluate();
    _input = _result;
    _result = '';
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
