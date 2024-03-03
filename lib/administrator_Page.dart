import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdministratorPage extends StatelessWidget {
  final List<String> topDistricts = ['Riyadh', 'Jeddah', 'Dammam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Earnings History'
                          ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle Weekly option
                            },
                            child: Text('Weekly'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle Monthly option
                            },
                            child: Text('Monthly'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle Yearly option
                            },
                            child: Text('Yearly'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      TotalEarningsChart(
                        _createSampleData(), // Replace this with your actual data
                        animate: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                SvgPicture.asset(
                  'assets/saudi_arabia_map.svg',
                  height: 200.0,
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildDataBox(
                        title: 'New Subscriptions',
                        value: '10',
                        percentage: '+2.5%',
                        color: Colors.red,
                        arrowIcon: Icons.arrow_downward,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: _buildDataBox(
                        title: 'Total Subscriptions',
                        value: '100',
                        percentage: '-1.8%',
                        color: Colors.green,
                        arrowIcon: Icons.arrow_upward,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Top Subscribers Locations',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.flag, color: Colors.black, size: 24.0),
                    SizedBox(width: 8.0),
                    Text(
                      'Our most Subscribers in Saudi Arabia',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Top District: Riyadh',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Total Subscribers: 50',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Other Districts:',
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: topDistricts.map((district) {
                            return Text(
                              district,
                              style: TextStyle(fontSize: 14.0),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataBox({
    required String title,
    required String value,
    required String percentage,
    required Color color,
    required IconData arrowIcon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(
                  arrowIcon,
                  color: color,
                  size: 16.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  percentage,
                  style: TextStyle(fontSize: 14.0, color: color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 25),
      LinearSales(2, 100),
      LinearSales(3, 75),
      LinearSales(4, 80),
      LinearSales(5, 45),
      LinearSales(6, 55),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Earnings',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TotalEarningsChart extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList;
  final bool animate;

  TotalEarningsChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: charts.LineChart(
        seriesList,
        animate: animate,
        defaultRenderer: charts.LineRendererConfig(includePoints: true),
      ),
    );
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

