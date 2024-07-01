import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Our Products'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: screenWidth * 0.08,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView(
                children: [
                  ProductItem(
                    imageUrl: 'assets/image1.png', // Replace with actual image path
                    title: '500ml Bottle Pet',
                    description: 'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.220/-',
                  ),
                  ProductItem(
                    imageUrl: 'assets/image2.png', // Replace with actual image path
                    title: '1.5LTR Bottle Pet',
                    description: 'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.200/-',
                  ),
                  ProductItem(
                    imageUrl: 'assets/image3.png', // Replace with actual image path
                    title: '6LTR Bottle',
                    description: 'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.80/-',
                  ),
                  ProductItem(
                    imageUrl: 'assets/image4.png', // Replace with actual image path
                    title: '19LTR Bottle',
                    description: 'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.1200/-',
                  ),
                ],
              ),
            ),
          ],
        ),
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

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  ProductItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            fit: BoxFit.cover,
          ),
          SizedBox(width: screenWidth * 0.05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  'Price $price',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}