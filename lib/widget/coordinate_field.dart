import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/regression_calculator.dart';
import 'package:regressify/core/regression_data.dart';

class CoordinateField extends StatelessWidget {
  const CoordinateField({super.key, required this.vector});
  final CoordinateData vector;

  void onCoordinateRemoved(RegressionData regressionData) {
    regressionData.removeData(vector);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Row(children: [
        Expanded(
          child: TextField(
            onSubmitted: (value) {
              //vector.x = double.parse(value);
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'X:'),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: TextField(
            onSubmitted: (value) {
              //vector.y = double.parse(value);
            },
            
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Y:'),
          ),
        ),
        IconButton(
          onPressed: () => { Provider.of<RegressionData>(context, listen: false).removeData(vector) }, 
          icon: const Icon(Icons.delete))
      ]),
    );
  }
}
