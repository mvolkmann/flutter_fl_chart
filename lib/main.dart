import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import './extensions/widget_extensions.dart';

const title = 'My App';

void main() => runApp(
      MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final yValues = <double>[10, 9, 4, 2, 13, 17, 19, 21];
  @override
  Widget build(BuildContext context) {
    final barGroups =
        yValues.mapIndexed((index, y) => getBar(x: index + 1, y: y)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('My Chart'),
            BarChart(
              BarChartData(
                axisTitleData: FlAxisTitleData(
                  topTitle: getAxisTitle('top', 10),
                  rightTitle: getAxisTitle('right'),
                  bottomTitle: getAxisTitle('bottom', 20),
                  leftTitle: getAxisTitle('left'),
                ),
                borderData: FlBorderData(
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 1), // y-axis
                    bottom: BorderSide(width: 1), // x-axis
                  ),
                ),
                barGroups: barGroups,
              ),
            ).padding(20).expanded,
          ],
        ),
      ),
    );
  }

  BarChartGroupData getBar({required int x, required double y}) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(y: y, width: 15, colors: [Colors.amber]),
    ]);
  }

  AxisTitle getAxisTitle(String title, [double margin = 0.0]) {
    return AxisTitle(showTitle: true, titleText: title, margin: margin);
  }
}
