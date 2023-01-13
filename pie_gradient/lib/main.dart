import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<Color> colors = <Color>[
    const Color.fromRGBO(75, 135, 185, 1),
    const Color.fromRGBO(192, 108, 132, 1),
    const Color.fromRGBO(246, 114, 128, 1),
    const Color.fromRGBO(248, 177, 149, 1),
    const Color.fromRGBO(116, 180, 155, 1)
  ];

  List<double> stops = <double>[
    0.2,
    0.4,
    0.6,
    0.8,
    1,
  ];

  List<_SalesData> chartData = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
            child: Container(
          height: 500,
          width: 320,
          //Initialize the chart widget
          child: SfCircularChart(
              onCreateShader: (ChartShaderDetails chartShaderDetails) {
                return ui.Gradient.linear(chartShaderDetails.outerRect.topRight,
                    chartShaderDetails.outerRect.centerLeft, colors, stops);
              },
              backgroundColor: Colors.white,
              series: <CircularSeries<_SalesData, String>>[
                PieSeries<_SalesData, String>(
                  dataSource: chartData,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'Sales',
                )
              ]),
        )));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

