import 'package:calculator/screens/simple_calculator/components/calculator_button.dart';
import 'package:calculator/screens/simple_calculator/components/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleCalculator extends StatelessWidget {
  static const routeName = '/simpleCalculator';
  const SimpleCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            children: [
              const Flexible(flex: 2, child: Display()),
              Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          children: const [
                            ClearButton('AC'),
                            ClearButton('C'),
                            NumberButton('^2'),
                            OperatorButton('÷'),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            NumberButton('7'),
                            NumberButton('8'),
                            NumberButton('9'),
                            OperatorButton('X'),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            NumberButton('4'),
                            NumberButton('5'),
                            NumberButton('6'),
                            OperatorButton('-'),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            NumberButton('1'),
                            NumberButton('2'),
                            NumberButton('3'),
                            OperatorButton('+'),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: const [
                            NumberButton('0'),
                            NumberButton('.'),
                            NumberButton('^'),
                            EqualsButton('=')
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
