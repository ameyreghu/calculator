import 'package:calculator/config/app_colors.dart';
import 'package:calculator/providers/simple_calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  const CalculatorButton(
      {required this.text,
      required this.color,
      this.textColor = AppColors.buttonTextColor,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 100.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String text;
  const NumberButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
        text: text,
        color: AppColors.numberButtonColor,
        onTap: () => context.read<SimpleCalculatorProvider>().setText(text));
  }
}

class OperatorButton extends StatelessWidget {
  final String text;
  const OperatorButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
        text: text,
        color: AppColors.operationButtonColor,
        onTap: () => context.read<SimpleCalculatorProvider>().setText(text));
  }
}

class ClearButton extends StatelessWidget {
  final String text;
  const ClearButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
        text: text,
        color: AppColors.fnButtonColor,
        textColor: AppColors.fnButtonTextColor,
        onTap: () {
          text == 'AC'
              ? context.read<SimpleCalculatorProvider>().clearAll()
              : context.read<SimpleCalculatorProvider>().clear();
        });
  }
}

class EqualsButton extends StatelessWidget {
  final String text;
  const EqualsButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
        text: text,
        color: AppColors.fnButtonColor,
        onTap: () => context.read<SimpleCalculatorProvider>().calculate());
  }
}
