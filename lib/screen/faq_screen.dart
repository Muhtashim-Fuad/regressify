import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/regression_calculator.dart';
import 'package:regressify/core/regression_data.dart';

class LinearHomeScreen extends StatelessWidget {
  LinearHomeScreen({super.key});
  final RegressionCalculator _calculator = RegressionCalculator();

  void calculateRegression(BuildContext context) {
    double xa = 0, xb = 0;
    (xa, xb) = _calculator.evaluate(
        Provider.of<RegressionData>(context, listen: false).getList, context);
    Provider.of<RegressionData>(context, listen: false).setResultValue(xa, xb);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
