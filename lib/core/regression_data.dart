import 'package:flutter/material.dart';
import 'package:regressify/core/regression_calculator.dart';

class RegressionData extends ChangeNotifier {
  RegressionData() {
    _coordinateList = _sampleList.toList();
    notifyListeners();
  }

  List<CoordinateData> _coordinateList = [];

  final List<CoordinateData> _sampleList =
  [
    CoordinateData(x: -30, y: -5),
    CoordinateData(x: -20, y: 0),
    CoordinateData(x: -10, y: 3),
    CoordinateData(x: 0, y: 5),
    CoordinateData(x: 10, y: 8),
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

  void reloadData() {
    _coordinateList = _sampleList.toList();
    notifyListeners();
  }
}
