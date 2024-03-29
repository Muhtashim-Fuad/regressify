import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/regression_calculator.dart';
import 'package:regressify/core/regression_data.dart';
import 'package:regressify/style.dart';

class CoordinateInput extends StatefulWidget {
  const CoordinateInput({super.key});

  @override
  State<StatefulWidget> createState() => CoordinateInputState();
}

class CoordinateInputState extends State<CoordinateInput> {
  final int truncateValue = 2;

  CoordinateData _data = CoordinateData(x: 0, y: 0);

  final TextEditingController xController = TextEditingController();
  final TextEditingController yController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: StyleData.horizontalMargin,
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: xController,
            onChanged: (value) => setState(() {
              if (value == '') return;
              _data = CoordinateData(
                  x: double.parse(double.parse(value).toStringAsFixed(truncateValue)),
                  y: _data.y);
            }),
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Value of X'),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: TextField(
            controller: yController,
            onChanged: (value) => setState(() {
              if (value == '') return;
              _data = CoordinateData(
                  x: _data.x,
                  y: double.parse(double.parse(value).toStringAsFixed(truncateValue)));
            }),
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Value of Y'),
          ),
        ),
        const SizedBox(width: 15),
        ElevatedButton(
          onPressed: (xController.text == '' || yController.text == '')
              ? null
              : () => setState(() {
                    Provider.of<RegressionData>(context, listen: false)
                        .addData(_data);
                    xController.text = '';
                    yController.text = '';
                  }),
          child: const Icon(Icons.add, size: 25),
        ),
      ]),
    );
  }
}
