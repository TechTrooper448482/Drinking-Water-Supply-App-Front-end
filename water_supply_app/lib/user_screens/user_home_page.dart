import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Deliver fresh water at your doorstep!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryCard('Gallon'),
                  _buildCategoryCard('1.5Ltr'),
                  _buildCategoryCard('6 pcs'),
                  _buildCategoryCard('500 ml'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Popular now',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildPopularItemCard('Gallon', 'Rs 350'),
                  _buildPopularItemCard('Rs 150', ''),
                  _buildPopularItemCard('6 pcs', 'Rs 539'),
                  _buildPopularItemCard('500 ml', 'Rs 35'),
                ],
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
          child: Center(child: Icon(Icons.local_drink)),
        ),
        SizedBox(height: 8.0),
        Text(title),
      ],
    );
  }

  Widget _buildPopularItemCard(String title, String subtitle) {
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
            Icon(Icons.local_drink),
            SizedBox(height: 8.0),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
