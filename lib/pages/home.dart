import 'package:expanse_tracker/component/bottom-bar.dart';
import 'package:expanse_tracker/component/side-bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: SideBar(),
        body: Column(
          children: <Widget>[
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <SplineSeries<SalesData, String>>[
                SplineSeries<SalesData, String>(
                  dataSource: <SalesData>[
                    SalesData('Jan', 56),
                    SalesData('Feb', 40),
                    SalesData('Mar', 69),
                    SalesData('Apr', 70),
                    SalesData('May', 70),
                    SalesData('Jun', 70),
                    SalesData('Jul', 67),
                    SalesData('Aug', 72),
                    SalesData('Sep', 71),
                    SalesData('Oct', 70),
                    SalesData('Nov', 70),
                    SalesData('Dec', 70),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Sales',
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomBar());
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;
}
