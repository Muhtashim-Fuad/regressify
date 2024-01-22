import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/regression_data.dart';
import 'package:regressify/screen/line_graph_screen.dart';
import 'package:regressify/screen/analysis_screen.dart';

class NavigatorDriver
{
  static void showPredictedTable(BuildContext context)
  {
    RegressionData data = Provider.of<RegressionData>(context, listen: false);
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TableData(interceptValue: data.a, slopeValue: data.b, coordinateData: data.getList),),);
  }

  static void showGraph(BuildContext context)
  {
    RegressionData data = Provider.of<RegressionData>(context, listen: false);
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LineGraph(interceptValue: data.a, slopeValue: data.b, coordinateList: data.getList),),);
  }
}