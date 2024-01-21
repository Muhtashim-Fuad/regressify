import 'package:flutter/material.dart';
import 'package:regressify/core/regression_calculator.dart';

class RegressionData extends ChangeNotifier {
  final List<CoordinateData> _coordinateList = [
    CoordinateData(x: -35, y: -36),
    CoordinateData(x: -30, y: -28),
    CoordinateData(x: -25, y: -24),
    CoordinateData(x: -20, y: -18),
    CoordinateData(x: 0, y: 2),
    CoordinateData(x: 20, y: 22),
    CoordinateData(x: 25, y: 27),
    CoordinateData(x: 30, y: 32),
    CoordinateData(x: 35, y: 37),
  ];

  bool _recalculatedResult = false;
  double _a = 0;
  double _b = 0;

  double get a => _a;
  double get b => _b;

  bool get recalculatedResult => _recalculatedResult;
  List<CoordinateData> get getList => _coordinateList;
  int getLength() => _coordinateList.length;

  bool isValidList() => (_coordinateList.length > 1);

  void setResultValue(double a, double b) {
    _a = a;
    _b = b;
    _recalculatedResult = true;
    notifyListeners();
  }

  void addData(CoordinateData coordinateData) {
    _coordinateList.add(coordinateData);
    _recalculatedResult = false;
    notifyListeners();
  }

  void removeData(CoordinateData coordinateData) {
    _coordinateList.remove(coordinateData);
    _recalculatedResult = false;
    notifyListeners();
  }

  void clearData() {
    _coordinateList.clear();
    _recalculatedResult = false;
    notifyListeners();
  }
}
