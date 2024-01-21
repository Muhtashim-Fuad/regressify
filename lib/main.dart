import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressify/appbar_group.dart';
import 'package:regressify/core/regression_data.dart';
import 'package:regressify/screen/home_screen.dart';
import 'package:regressify/style.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({super.key});

  final RegressionData _regressionData = RegressionData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegressionData>(
      create: (context) => _regressionData,
      child: const MaterialApp(
        title: 'Regressify',
        home: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: StyleData.masterTheme,
      home: Scaffold(
        appBar: AppBarGroup.homeAppBar(context),
        body: LinearHomeScreen(),
      ),
    );
  }
}
