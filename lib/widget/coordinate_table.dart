import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/regression_calculator.dart';
import 'package:regressify/core/regression_data.dart';
import 'package:regressify/style.dart';

class TableGroup extends StatelessWidget {
  TableGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Color.fromARGB(255, 185, 185, 185)),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(3.5),
        1: FlexColumnWidth(3.5),
        2: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Color.fromARGB(255, 235, 235, 235)),
          children: [
          Container(
              margin: StyleData.verticalMargin,
              child: const Text('X', textAlign: TextAlign.center)),
          Container(
            margin: StyleData.verticalMargin,
            child: const Text('Y', textAlign: TextAlign.center),
          ),
          const Text('')
        ]),
        for (CoordinateData data
            in Provider.of<RegressionData>(context).getList)
          TableRow(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
            children: [
            Text(data.x.toString(),
                textAlign: TextAlign.center),
            Text(data.y.toString(),
                textAlign: TextAlign.center),
            InkWell(
              onTap: () => { Provider.of<RegressionData>(context, listen: false).removeData(data) },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete, color: Colors.black,),
              ),
            ),
            
          ])
      ],
    );
  }
}
