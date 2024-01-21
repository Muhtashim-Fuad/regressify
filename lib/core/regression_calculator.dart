import 'package:flutter/material.dart';

class RegressionCalculator {
  (double, double) evaluate(
      List<CoordinateData> coordinateList, BuildContext context) {
    int n = coordinateList.length;
    double sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0;

    for (int i = 0; i < n; i++) {
      sumX += coordinateList[i].x;
      sumY += coordinateList[i].y;
      sumXY += coordinateList[i].x * coordinateList[i].y;
      sumX2 += coordinateList[i].x * coordinateList[i].x;
    }

    //b = SLOPE
    //a = INTERCEPT
    double b = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX);
    double a = (sumY - b * sumX) / n;

    if (a.isNaN || b.isNaN) {
      const String errorMessage = 'Something went wrong!\nPlease make sure there are two or more coordinate values in the table.';
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(errorMessage)));
      return (0, 0);
    }

    return (
      double.parse(a.toStringAsFixed(5)),
      double.parse(b.toStringAsFixed(5))
    );
  }
}

class CoordinateData {
  final double x;
  final double y;

  CoordinateData({required this.x, required this.y});
  CoordinateData operator +(CoordinateData coordinateData) =>
      CoordinateData(x: x + coordinateData.x, y: y + coordinateData.y);
}
