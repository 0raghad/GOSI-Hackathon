import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdministratorHomePage extends StatelessWidget {
  final String userName = 'Ali';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Administrator Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, $userName!',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Administrator',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildDataBox(
                    title: 'New Subscriptions',
                    value: '10',
                    color: Color.fromARGB(255, 236, 222, 246),
                    arrowIcon: Icons.arrow_downward,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: _buildDataBox(
                    title: 'Total Subscriptions',
                    value: '100',
                    color: Color.fromARGB(59, 159, 236, 196),
                    arrowIcon: Icons.arrow_upward,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Customer Growth',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                _buildLegendItem('Male', Colors.red),
                SizedBox(width: 8.0),
                _buildLegendItem('Female', Colors.purple),
                SizedBox(width: 8.0),
                _buildLegendItem('New Customer', Colors.grey),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: charts.BarChart(
                  _createSampleData(),
                  animate: true,
                  barGroupingType: charts.BarGroupingType.stacked,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataBox({
    required String title,
    required String value,
    required Color color,
    required IconData arrowIcon,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Icon(
                arrowIcon,
                color: Color.fromARGB(255, 104, 56, 134),
                size: 18.0,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            value,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4.0),
        Text(label, style: TextStyle(color: Colors.white))
      ],
    );
  }

  List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final maleData = [
      OrdinalSales('Jan', 5),
      OrdinalSales('Feb', 10),
      OrdinalSales('Mar', 8),
      // Add more data points as needed
    ];

    final femaleData = [
      OrdinalSales('Jan', 7),
      OrdinalSales('Feb', 12),
      OrdinalSales('Mar', 6),
      // Add more data points as needed
    ];

    final newData = [
      OrdinalSales('Jan', 3),
      OrdinalSales('Feb', 5),
      OrdinalSales('Mar', 4),
      // Add more data points as needed
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Male',
        domainFn: (OrdinalSales sales, _) => sales.month,
       measureFn: (OrdinalSales sales, _) => sales.sales,
        data: maleData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Female',
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: femaleData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.purple),
      ),
      charts.Series<OrdinalSales, String>(
        id: 'New Customer',
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: newData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.grey),
      ),
    ];
  }
}

class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}