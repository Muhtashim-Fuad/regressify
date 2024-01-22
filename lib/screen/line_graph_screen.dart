import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:regressify/appbar_group.dart';
import 'package:regressify/core/config_data.dart';
import 'package:regressify/core/regression_calculator.dart';

class LineGraph extends StatelessWidget {
  const LineGraph(
      {super.key,
      required this.interceptValue,
      required this.slopeValue,
      required this.coordinateList});

  final List<CoordinateData> coordinateList;
  final double interceptValue;
  final double slopeValue;

  @override
  Widget build(BuildContext context) {
    
    final double minX = coordinateList.map((coord) => coord.x).reduce((min, current) => current < min ? current : min);
    final double maxX = coordinateList.map((coord) => coord.x).reduce((max, current) => current > max ? current : max);
    final double minY = coordinateList.map((coord) => coord.y).reduce((min, current) => current < min ? current : min);
    final double maxY = coordinateList.map((coord) => coord.y).reduce((max, current) => current > max ? current : max);

    return Scaffold(
      appBar: AppBarGroup.infoAppBar(context, 'Line Graph'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: LineChart(
          LineChartData(
            minX: minX - ConfigData.graphLimitOffset,
            maxX: maxX + ConfigData.graphLimitOffset,
            minY: minY - ConfigData.graphLimitOffset,
            maxY: maxY + ConfigData.graphLimitOffset,
            titlesData: const FlTitlesData(
              topTitles: AxisTitles(sideTitles: SideTitles(interval: 25, showTitles: true)),
              bottomTitles: AxisTitles(sideTitles: SideTitles(interval: 25, showTitles: true)),
            ),
            lineBarsData: [
              LineChartBarData(
                barWidth: 0,
                color: Colors.red,
                spots: [
                  for (int i = 0; i < coordinateList.length; i++)
                    FlSpot(coordinateList[i].x, coordinateList[i].y)
                ],
              ),
              LineChartBarData(
                barWidth: 1.5,
                color: Colors.blueAccent,
                dotData: const FlDotData(show: false),
                spots: [
                  for (double i = minX - ConfigData.graphLimitOffset/2; i <= maxX + ConfigData.graphLimitOffset/2; i += 5)
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
