import 'package:calculator/providers/simple_calculator_provider.dart';
import 'package:calculator/screens/simple_calculator/simple_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static const defaultRoute = SimpleCalculator.routeName;
  static Map<String, Widget Function(BuildContext context)> appRoutes = {
    //'/': (context) => const SimpleCalculator(),
    SimpleCalculator.routeName: (context) => ChangeNotifierProvider(
          create: (context) => SimpleCalculatorProvider(),
          child: const SimpleCalculator(),
        ),
  };
}
