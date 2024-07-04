import 'package:flutter/material.dart';
import '/supplier_screens/product_detail.dart';

class SupplierHome extends StatelessWidget {
  const SupplierHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:
            const Text('Our Products', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
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
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.blue),
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  ProductItem(
                    imageUrl: 'assets/waterbottle_500ml.png',
                    title: '500ml Bottle Pet',
                    description:
                        'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.220/-',
                  ),
                  ProductItem(
                    imageUrl: 'assets/waterbottle_1500ml.png',
                    title: '1.5LTR Bottle Pet',
                    description:
                        'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.200/-',
                  ),
                  ProductItem(
                    imageUrl: 'assets/waterbottle_6lit.png',
                    title: '6LTR Bottle',
                    description:
                        'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.80/-',
                  ),
                  ProductItem(
                    imageUrl: 'assets/waterbottle_19lit.png',
                    title: '19LTR Bottle',
                    description:
                        'Boondh Mineral Water Bottle\nPure Drinking Mineral Water',
                    price: 'Rs.1200/-',
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

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  const ProductItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              imageUrl: imageUrl,
              title: title,
              description: description,
              price: price,
              productId: 1,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(description),
                  const SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(color: Colors.blue),
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