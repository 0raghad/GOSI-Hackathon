import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdministratorPage extends StatelessWidget {
  final List<String> topDistricts = ['Riyadh', 'Jeddah', 'Dammam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earnings History',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 200.0,
                      child: TotalEarningsChart(
                        _createSampleData(), // Replace this with your actual data
                        animate: true,
                      ),
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
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildDataBox(
                        title: 'New Subscriptions',
                        value: '10',
                        percentage: '+2.5%',
                        color: Color.fromARGB(255, 255, 255, 255),
                        arrowIcon: Icons.arrow_downward,
                        
                      
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: _buildDataBox(
                        title: 'Total Subscriptions',
                        value: '100',
                        percentage: '-1.8%',
                        color: Color.fromARGB(255, 255, 255, 255),
                        arrowIcon: Icons.arrow_upward,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 16.0),
                    Text(
                      'Top Subscribers Locations',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.flag, color: Colors.white, size: 24.0),
                        SizedBox(width: 8.0),
                        Text(
                          'Our most Subscribers in Saudi Arabia',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
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
                            'Top City: Riyadh',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Total Subscribers: 50',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Other Cities:',
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
            ],
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
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF9C3FE4)),
              ),
              SizedBox(width: 4.0),
              Icon(arrowIcon, color:Color(0xFF9C3FE4) ),
              SizedBox(width: 4.0),
              Text(
                percentage,
                style: TextStyle(fontSize: 14.0, color: Color(0xFF9C3FE4)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TotalEarningsChart extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList; // Add <LinearSales, int> here
  final bool animate;

  TotalEarningsChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
        includePoints: true,
        includeArea: true,
        stacked: false,
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          desiredTickCount: 5,
        ),
      ),
    );
  }
}

List<charts.Series<LinearSales, int>> _createSampleData() {
  final data = [
    LinearSales(0, 5),
    LinearSales(1, 25),
    LinearSales(2, 100),
    LinearSales(3, 75),
    LinearSales(4, 80),
    LinearSales(5, 45),
    LinearSales(6, 20),
  ];

  return [
    charts.Series<LinearSales, int>(
      id: 'Earnings',
      colorFn: (_, __) => charts.Color.fromHex(code: '#9C3FE4'),
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      data: data,
    ),
  ];
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}