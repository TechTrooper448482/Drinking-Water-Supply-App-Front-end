import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_supply_app/supplier_screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserHomePage(),
    );
  }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  late List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    print("Debug...");
    // Replace with your actual API endpoint
    final url = Uri.parse('http://192.168.2.1:3333/products/all');

    // Replace with your actual token retrieval logic
    final token = await getTokenFromSharedPrefs(); // Implement this method

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 200) {
      // Successful response, parse JSON

      final List<dynamic> productsJson =
          jsonData['data']; // Assuming 'data' contains the array of products
      setState(() {
        products = productsJson.map((json) => Product.fromJson(json)).toList();
      });
    } else {
      // Handle errors
      print('Failed to fetch products: ${response.statusCode}');
      // Optionally handle errors in UI
    }
  }

  Future<String> getTokenFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 235, 237, 100),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Deliver fresh water at your doorstep!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryCard('Gallon'),
                  _buildCategoryCard('1.5Ltr'),
                  _buildCategoryCard('6 pcs'),
                  _buildCategoryCard('500 ml'),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Popular now',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                physics: const NeverScrollableScrollPhysics(),
                children: products.map((product) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            imageUrl: product.image,
                            title: product.name,
                            description: product.description,
                            price: 'Rs ${product.price}',
                            productId: product.id,
                          ),
                        ),
                      );
                    },
                    child: _buildPopularItemCard(
                        product.name, 'Rs ${product.price}', product.image),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Center(child: Icon(Icons.local_drink)),
        ),
        const SizedBox(height: 8.0),
        Text(title),
      ],
    );
  }

  Widget _buildPopularItemCard(String title, String subtitle, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl, // Use the imageUrl from the product object
              height: 36,
              width: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String price;
  final String image;
  final String capacity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.capacity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'].toString(),
      image: json['image'] as String,
      capacity: json['capacity'] as String,
    );
  }
}
