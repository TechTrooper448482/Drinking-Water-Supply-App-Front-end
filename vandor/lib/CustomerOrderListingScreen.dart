import 'package:flutter/material.dart';
//set with api
class CustomerOrderListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Order Listing'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          OrderItem(
            imageUrl: 'assets/image1.png', // Replace with actual image path
            code: 'C101',
            description: '500 ml Bottle pac\nBoonthi Mineral Water',
            price: 500,
            initialQuantity: 2,
          ),
          OrderItem(
            imageUrl: 'assets/image2.png', // Replace with actual image path
            code: 'C102',
            description: '1.5 LTR Bottle pac\nBoonthi Mineral Water',
            price: 1000,
            initialQuantity: 4,
          ),
          OrderItem(
            imageUrl: 'assets/image3.png', // Replace with actual image path
            code: 'C103',
            description: '1.5 LTR Bottle\nAquafina Mineral Water',
            price: 600,
            initialQuantity: 6,
          ),
          OrderItem(
            imageUrl: 'assets/image4.png', // Replace with actual image path
            code: 'C104',
            description: 'Gallon\nNestle Mineral Water',
            price: 1200,
            initialQuantity: 4,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatefulWidget {
  final String imageUrl;
  final String code;
  final String description;
  final int price;
  final int initialQuantity;

  OrderItem({
    required this.imageUrl,
    required this.code,
    required this.description,
    required this.price,
    required this.initialQuantity,
  });

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.01,
      ),
      child: ListTile(
        leading: Image.asset(
          widget.imageUrl,
          width: screenWidth * 0.1,
          height: screenHeight * 0.1,
          fit: BoxFit.cover,
        ),
        title: Text(
          widget.code,
          style: TextStyle(fontSize: screenWidth * 0.04),
        ),
        subtitle: Text(
          widget.description,
          style: TextStyle(fontSize: screenWidth * 0.035),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total: Rs${widget.price}',
              style: TextStyle(fontSize: screenWidth * 0.035),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  iconSize: screenWidth * 0.05,
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) quantity--;
                    });
                  },
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  iconSize: screenWidth * 0.05,
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}