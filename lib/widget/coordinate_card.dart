import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/regression_calculator.dart';
import 'package:regressify/core/regression_data.dart';

class CoordinateCard extends StatelessWidget {
  const CoordinateCard({super.key, required this.coordinateData});

  final CoordinateData coordinateData;
  final TextStyle _textStyle = const TextStyle(fontFamily: 'Lato', fontSize: 15);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3.5),
      child: Container(
        padding: const EdgeInsets.only(left: 25, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: 
          [
            Text('X: ', style: _textStyle),
            Text(coordinateData.x.toString(), style: _textStyle),
            Text('Y: ', style: _textStyle),
            Text(coordinateData.y.toString(), style: _textStyle),
            IconButton(
              onPressed: () => { Provider.of<RegressionData>(context, listen: false).removeData(coordinateData) },
              icon: const Icon(Icons.delete)),
        ]),
      ),
    );
  }
}
