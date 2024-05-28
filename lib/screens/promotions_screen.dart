import 'package:flutter/material.dart';

import 'CustomBottomNavigationBar.dart';

class PromotionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Promotions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: buildPromotionsList(context),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onTap: (index) {
          handleBottomNavigationTap(context, index);
        },
      ),
    );
  }

  Widget buildPromotionsList(BuildContext context) {
    return ListView(
      children: [
        buildPromotionCard(
          context,
          'Special Offer 1',
          'Get 20% off on all pizzas!',
          'assets/images/promotion1.jpg',
        ),
        buildPromotionCard(
          context,
          'Flash Sale 2',
          'Buy one burger, get one free!',
          'assets/images/promotion2.jpg',
        ),
        buildPromotionCard(
          context,
          'Limited Time Deal',
          'Combo meal at \$15.99 only!',
          'assets/images/combomeal.jpg',
        ),
        buildPromotionCard(
          context,
          'Weekend Delight',
          'Free dessert with every main course!',
          'assets/images/desserts.jpg',
        ),
        // Add more promotion cards as needed
      ],
    );
  }

  Widget buildPromotionCard(BuildContext context, String title, String description, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PromotionDetailsScreen(title: title, description: description, imagePath: imagePath),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromotionDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PromotionDetailsScreen({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Promotion Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16.0),
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
