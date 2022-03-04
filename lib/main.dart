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
  final xTitles = ['Mark', 'Tami', 'Amanda', 'Jeremy'];
  final yValues = <double>[6, 5, 10, 8];

  @override
  Widget build(BuildContext context) {
    final barGroups =
        yValues.mapIndexed((index, y) => getBar(x: index, y: y)).toList();
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
                  bottomTitle: getAxisTitle('Person', 5),
                  leftTitle: getAxisTitle('Score'),
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
                // This hides the faint, dashed grid lines.
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: (index) => xTitles[index.toInt()],
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    // Only show titles with no decimal places.
                    getTitles: (value) =>
                        value % 1 == 0 ? '${value.toInt()}' : '',
                  ),
                  topTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(showTitles: false),
                ),
                //TODO: How can you make the bars rectangles instead of ovals?
                //TODO: How can you rotate the x-axis labels 90 degrees?
              ),
            ).padding(20).expanded,
          ],
        ),
      ),
    );
  }

  BarChartGroupData getBar({required int x, required double y}) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(y: y, width: 15, colors: [Colors.blue]),
    ]);
  }

  AxisTitle getAxisTitle(String title, [double margin = 0.0]) {
    return AxisTitle(showTitle: true, titleText: title, margin: margin);
  }
}
