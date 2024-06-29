import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //static
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Order History',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildOrderItem(
            //   'Aquafina 1.5 litres 6 pcs',
            //   'Rs 539',
            //   'assets/aquafina.png', // replace with your actual image path
            // ),
            SizedBox(height: 10),
            // _buildOrderItem(
            //   'Nestle Pure Life 5 litres',
            //   'Rs 275',
            //   'assets/nestle.png', //
            // ),
            SizedBox(height: 20),
            _buildOrderSummary(),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(

                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'ORDER FROM WHATSAPP',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String title, String price, String imagePath) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 50), // replace with your actual image path
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(price, style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Aquafina 1.5 litres x 1', style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        Text('Rs 539', style: TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 10),
        Text('Nestle 5 litres x 1', style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        Text('Rs 275', style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}