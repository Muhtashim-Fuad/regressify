import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:regressify/appbar_group.dart';
import 'package:regressify/core/regression_calculator.dart';

class LineGraph extends StatelessWidget {
  const LineGraph(
      {super.key,
      required this.interceptValue,
      required this.slopeValue,
      required this.coordinateData});

  final List<CoordinateData> coordinateData;
  final double interceptValue;
  final double slopeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGroup.infoAppBar(context, 'Line Graph'),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: LineChart(
          LineChartData(
            minX: -100,
            maxX: 100,
            minY: -100,
            maxY: 100,
            lineBarsData: [
              LineChartBarData(
                barWidth: 0,
                color: Colors.red,
                spots: [
                  for (int i = 0; i < coordinateData.length; i++)
                    FlSpot(coordinateData[i].x, coordinateData[i].y)
                ],
              ),
              LineChartBarData(
                barWidth: 1.5,
                color: Colors.blueAccent,
                dotData: const FlDotData(show: false),
                spots: [
                  for (double i = -50; i <= 50; i += 5)
                    FlSpot(i, interceptValue + slopeValue * i)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
