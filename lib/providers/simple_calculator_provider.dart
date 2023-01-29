import 'package:flutter/cupertino.dart';
import './expression_evaluator.dart' ;

class SimpleCalculatorProvider with ChangeNotifier {
  String _input = '';
  String _result = '';

  String get input => _input;
  String get result => _result;


 

  bool isOperator(String val) {
    if (val == 'X' || val == '/' || val == '+' || val == '-' || val == '^') {
      return true;
    }
    return false;
  }

  bool get isLastCharAnOperator {
    if (_input.isEmpty) return false;
    if (_input.characters.last == 'X' ||
        _input.characters.last == '/' ||
        _input.characters.last == '+' ||
        _input.characters.last == '-' ||
        _input.characters.last == '^') return true;
    return false;
  }

  setText(String val) {
    if (isLastCharAnOperator && isOperator(val)) return;
    _input += val;
    if (!isLastCharAnOperator && !isOperator(val)) evaluate();
    notifyListeners();
  }

  clear() {
    if (_input.isEmpty) {
      return;
    } else {
      _input = _input.substring(0, _input.length - 1);
    }

    notifyListeners();
  }

  clearAll() {
    _input = '';
    _result = '';
    notifyListeners();
  }


  evaluate() {
    try {
      _result = evaluateExpression(_input).toString();
      print(_result);
    } catch (e) {
      //
    }
  }

  void calculate() {
    evaluate();
    _input = _result;
    _result = '';
    notifyListeners();
  }

}
