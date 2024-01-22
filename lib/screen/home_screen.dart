import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/core/navigation_driver.dart';
import 'package:regressify/core/regression_calculator.dart';
import 'package:regressify/core/regression_data.dart';
import 'package:regressify/style.dart';
import 'package:regressify/widget/coordinate_input.dart';
import 'package:regressify/widget/coordinate_table.dart';
import 'package:regressify/widget/result_card.dart';

class LinearHomeScreen extends StatelessWidget {
  LinearHomeScreen({super.key});
  final RegressionCalculator _calculator = RegressionCalculator();

  void calculateRegression(BuildContext context) {
    double xa = 0, xb = 0;
    (xa, xb) = _calculator
        .evaluate(Provider.of<RegressionData>(context, listen: false).getList, context);
    Provider.of<RegressionData>(context, listen: false).setResultValue(xa, xb);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 15),
        Container(padding: StyleData.horizontalMargin, child: ResultCard()),
        const SizedBox(height: 15),
        const CoordinateInput(),
        const SizedBox(height: 15),
        const ButtonGroup(),
        const SizedBox(height: 15),
        Container(
            padding: StyleData.horizontalMargin,
            child: TableGroup()),
        Container(
          padding: const EdgeInsets.only(left: 17.5, right: 17.5, top: 10),
          child: ElevatedButton(
            onPressed: Provider.of<RegressionData>(context).isValidList() ? () => calculateRegression(context) : null,
            child: Text('Calculate Regression Data'.toUpperCase())
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class ButtonGroup extends StatelessWidget
{
  const ButtonGroup({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Container(
        padding: StyleData.horizontalMargin,
        child: Row(children: 
        [
          Expanded(child: ElevatedButton(onPressed: Provider.of<RegressionData>(context).recalculatedResult ? () => NavigatorDriver.showGraph(context) : null, child: const Icon(Icons.timeline, size: 25))),
          const SizedBox(width: 7.5),
          Expanded(child: ElevatedButton(onPressed: Provider.of<RegressionData>(context).recalculatedResult ? () => NavigatorDriver.showPredictedTable(context) : null, child: const Icon(Icons.table_chart_outlined, size: 25))),
          const SizedBox(width: 7.5),
          Expanded(child: ElevatedButton(onPressed: () => Provider.of<RegressionData>(context).reloadData(), child: const Icon(Icons.refresh, size: 25))),
          const SizedBox(width: 7.5),
          Expanded(child: ElevatedButton(onPressed: Provider.of<RegressionData>(context).getLength() > 0 ? () => { Provider.of<RegressionData>(context, listen: false).clearData() } : null, child: const Icon(Icons.delete_forever, size: 25))),
        ],
      ),
    );
  }

}