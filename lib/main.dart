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
  @override
  Widget build(BuildContext context) {
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
                borderData: FlBorderData(
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 1), // y-axis
                    bottom: BorderSide(width: 1), // x-axis
                  ),
                ),
                barGroups: [
                  getBar(x: 1, y: 10),
                  getBar(x: 2, y: 9),
                  getBar(x: 3, y: 4),
                  getBar(x: 4, y: 2),
                  getBar(x: 5, y: 13),
                  getBar(x: 6, y: 17),
                  getBar(x: 7, y: 19),
                  getBar(x: 8, y: 21),
                ],
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
}
