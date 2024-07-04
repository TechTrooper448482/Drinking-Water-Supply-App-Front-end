import 'package:flutter/material.dart';

class CustomerOrderDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Order Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Contact Info',
              style: TextStyle(
                  fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              '• Ali Ahmed\n• Call Us : 03361842353\n• E-Mail : Ali90@Gmail.Com\n• Address: House#566 DHA Karachi',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Order Info',
              style: TextStyle(
                  fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '500 ml Bottle pac',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      iconSize: screenWidth * 0.06,
                      onPressed: () {},
                    ),
                    Text(
                      '2',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      iconSize: screenWidth * 0.06,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Supplier Info',
              style: TextStyle(
                  fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Boondh Mineral Water',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryRow(
                    label: 'Subtotal',
                    amount: 'Rs 500',
                    screenWidth: screenWidth,
                  ),
                  SummaryRow(
                    label: 'Delivery',
                    amount: 'Rs 100',
                    screenWidth: screenWidth,
                  ),
                  Divider(color: Colors.black),
                  SummaryRow(
                    label: 'Total',
                    amount: 'Rs 600',
                    screenWidth: screenWidth,
                    isBold: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final double screenWidth;
  final bool isBold;

  SummaryRow({
    required this.label,
    required this.amount,
    required this.screenWidth,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
