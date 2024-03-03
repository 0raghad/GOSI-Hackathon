import 'package:flutter/material.dart';

class AdministratorHomePage extends StatelessWidget {
  final String userName = 'John Doe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Administrator',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildDataBox(
                    title: 'New Subscriptions',
                    value: '10',
                    color: Colors.red,
                    arrowIcon: Icons.arrow_downward,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: _buildDataBox(
                    title: 'Total Subscriptions',
                    value: '100',
                    color: Colors.green,
                    arrowIcon: Icons.arrow_upward,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Customer Growth',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
        color: Colors.grey.shade200,
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
                color: Colors.white,
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
        Text(label),
      ],
    );
  }
}