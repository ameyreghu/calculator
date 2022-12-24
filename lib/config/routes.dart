import 'package:calculator/screens/simple_calculator.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static  Map<String, Widget Function(BuildContext context)> appRoutes = {
    SimpleCalculator.routeName: (context) =>const SimpleCalculator(),
  };
}
