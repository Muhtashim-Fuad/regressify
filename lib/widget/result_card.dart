import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/regression_data.dart';

class ResultCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RegressionData _data = Provider.of<RegressionData>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.5),
            child: Column(
              children: [
                Text('Linear Equation'.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text('y = ${_data.a} + ${_data.b}x', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ResultCardWidget(label: 'Intercept (a)', value: _data.a.toString()),
            const SizedBox(width: 10),
            ResultCardWidget(label: 'Slope (b)', value: _data.b.toString()),
          ],
        ),
      ],
    );
  }
}

class ResultCardWidget extends StatelessWidget {
  const ResultCardWidget({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(children: [
            Text(label.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 3.5),
            Text(value.toString(), textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }
}
