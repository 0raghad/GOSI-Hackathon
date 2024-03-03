import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SalesPredictionPage extends StatefulWidget {
  @override
  _SalesPredictionPageState createState() => _SalesPredictionPageState();
}

class _SalesPredictionPageState extends State<SalesPredictionPage> {
  String selectedTime = 'Weekly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Sales Predictions'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sales Prediction Report',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement save functionality here
                    // You can display a snackbar or perform any other action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Report saved!')),
                    );
                  },
                  child: Text('Save'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'Total Sales: \$5000',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTime = 'Weekly';
                    });
                  },
                  child: Text('Weekly'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectedTime == 'Weekly' ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTime = 'Monthly';
                    });
                  },
                  child: Text('Monthly'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectedTime == 'Monthly' ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTime = 'Yearly';
                    });
                  },
                  child: Text('Yearly'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectedTime == 'Yearly' ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: LineChartWidget(selectedTime: selectedTime),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Product Sales Predictions',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Quantity Sold',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        _buildProductRow('Product A', 100, 10.0),
                        _buildProductRow('Product B', 200, 20.0),
                        // Add more product rows based on your sales predictions
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductRow(String productName, int quantitySold, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(productName),
        Text(quantitySold.toString()),
        Text('\$${price.toStringAsFixed(2)}'),
      ],
    );
  }
}

class LineChartWidget extends StatelessWidget {
  final String selectedTime;

  LineChartWidget({required this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      _createSampleData(),
      animate: true,
    );
  }

  List<charts.Series<LineChartData, DateTime>> _createSampleData() {
    final data = [
      LineChartData(DateTime(2022, 1, 1), 100),
      LineChartData(DateTime(2022, 2, 1), 200),
      LineChartData(DateTime(2022, 3, 1), 150),
      // Add more data points based on your sales data
    ];

    return [
      charts.Series<LineChartData, DateTime>(
        id: 'Sales',
        domainFn: (LineChartData sales, _) => sales.date,
        measureFn: (LineChartData sales, _) => sales.amount,
        data: data,
      ),
    ];
  }
}

class LineChartData {
  final DateTime date;
  final int amount;

  LineChartData(this.date, this.amount);
}