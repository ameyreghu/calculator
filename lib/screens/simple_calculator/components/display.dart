import 'package:calculator/providers/simple_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<SimpleCalculatorProvider>();
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        print('swipe detected');
        context.read<SimpleCalculatorProvider>().clear();
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              vm.input,
              style: TextStyle(fontSize: 100.sp, fontWeight: FontWeight.w400),
            ),
            Text(
              vm.result,
              style: TextStyle(fontSize: 160.sp, fontWeight: FontWeight.w300),
            ),
            // TextField(
            //   controller: context.read<SimpleCalculatorProvider>().controller,
            //   decoration: InputDecoration(),
            // ),
          ],
        ),
      ),
    );
  }
}
