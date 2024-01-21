import 'package:flutter/material.dart';
import 'package:regressify/appbar_group.dart';
import 'package:regressify/core/regression_calculator.dart';
import 'package:regressify/style.dart';

class TableData extends StatelessWidget {
  TableData(
      {super.key,
      required this.interceptValue,
      required this.slopeValue,
      required this.coordinateData});

  //DATA
  final double errorMargin = 0.1;

  final List<CoordinateData> coordinateData;
  final double interceptValue;
  final double slopeValue;

  final TextStyle? mainTextStyle = StyleData.masterTheme.textTheme.titleMedium;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGroup.infoAppBar(context, "Predicted Values"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17.5, vertical: 20),
        child: ListView(
          children: [
            Table(
              border:
                  TableBorder.all(color: Color.fromARGB(255, 185, 185, 185)),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(5),
                1: FlexColumnWidth(5),
                2: FlexColumnWidth(2.5),
              },
              children: [
                TableRow(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 235, 235, 235)),
                    children: [
                      Container(
                        margin: StyleData.verticalMargin,
                        child: Text(
                          'Input Values',
                          textAlign: TextAlign.center,
                          style: mainTextStyle?.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: StyleData.verticalMargin,
                        child: Text(
                          'Predicted Values',
                          textAlign: TextAlign.center,
                          style: mainTextStyle?.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: StyleData.verticalMargin,
                        child: Text(
                          'Error',
                          textAlign: TextAlign.center,
                          style: mainTextStyle?.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                for (int i = 0; i < coordinateData.length; i++)
                  TableRow(children: [
                    Container(
                        margin: StyleData.verticalMargin,
                        child: Text(
                            'X: ${coordinateData[i].x}\nY: ${coordinateData[i].y}',
                            style: mainTextStyle,
                            textAlign: TextAlign.center)),
                    Container(
                      margin: StyleData.verticalMargin,
                      child: Text(
                          'X: ${coordinateData[i].x}\nY: ${(interceptValue + slopeValue * coordinateData[i].x).toStringAsFixed(5)}',
                          style: mainTextStyle,
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      margin: StyleData.verticalMargin,
                      child: Text(
                          (coordinateData[i].y -
                                  (interceptValue +
                                      slopeValue * coordinateData[i].x))
                              .toStringAsFixed(3),
                          style: mainTextStyle?.copyWith(
                            color: (coordinateData[i].y - (interceptValue + slopeValue * coordinateData[i].x)).abs() > errorMargin ?
                              const Color.fromARGB(255, 194, 13, 0) :
                              Colors.black,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
