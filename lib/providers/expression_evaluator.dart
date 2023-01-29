import 'dart:math';

double evaluateExpression(String expression) {

  var exp = expression.replaceAll('X', '*');
  exp = exp.replaceAll('÷', '/');

  // Tokenize 
  var tokens = tokenizeExpression(exp);
  print(tokens);
  // Stack for numbers
  var numbers = <double>[];

  // Stack for operators
  var operators = <String>[];

 
  for (var token in tokens) {
    
    if (double.tryParse(token) != null) {
     
      numbers.add(double.parse(token));
    } else {
   
      while (operators.isNotEmpty
        
          ) {
       
        var num2 = numbers.removeLast();
        var num1 = numbers.removeLast();

       
        var op = operators.removeLast();

      
        var result = performOperation(num1, num2, op);

        
        numbers.add(result);
      }
    
      operators.add(token);
    }
  }

 
  while (operators.isNotEmpty) {
    
    var num2 = numbers.removeLast();
    var num1 = numbers.removeLast();

   
    var op = operators.removeLast();

   
    var result = performOperation(num1, num2, op);
    print(result);
   
    numbers.add(result);
  }

  
  print(numbers.single);
  return numbers.single;
}



double performOperation(double num1, double num2, String op) {
  switch (op) {
    case '^':
      return pow(num1, num2).toDouble();
    case '*':
      return num1 * num2;
    case '/':
      return num1 / num2;
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    default:
      throw FormatException('Invalid operator: $op');
  }
}



List<String> tokenizeExpression(String expression) {
  var tokens = <String>[];

  var numStr = expression.split(RegExp(r'(\s|[+\-*/^()])'));

  var opStr = expression.split(RegExp(r'\d+(\.\d+)?'));

  opStr.removeAt(0);
  opStr.removeAt(opStr.length - 1);

  tokens = combineLists(numStr, opStr);

  return tokens;
}

List<String> combineLists(List<String> numbers, List<String> operators) {
  
  var result = <String>[];

 
  var length = min(numbers.length, operators.length);

  
  for (var i = 0; i < length; i++) {
    result.add(numbers[i]);
    result.add(operators[i]);
  }

  
  if (numbers.length > length) {
    result.addAll(numbers.getRange(length, numbers.length));
  }

 
  if (operators.length > length) {
    result.addAll(operators.getRange(length, operators.length));
  }

  return result;
}
