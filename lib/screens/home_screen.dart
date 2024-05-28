import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CustomBottomNavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the user is logged in
    if (FirebaseAuth.instance.currentUser == null) {
      // User is not logged in, navigate to the login page
      Navigator.pushReplacementNamed(context, '/login');
      return Container(); // Empty container as we're navigating away
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quick Bites',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Featured Restaurants Carousel
            buildSectionHeader('Featured Restaurants'),
            buildCarousel(),

            // Popular Cuisines Grid
            buildSectionHeader('Popular Cuisines'),
            buildCuisineGrid(context),

            // Current Promotions Banner
            buildSectionHeader('Current Promotions'),
            buildPromotionsBanner(),

            // Bottom Navigation
            // buildBottomNavigation(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          handleBottomNavigationTap(context, index);
        },
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        //color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildCarousel() {
    List<String> carouselItems = [
      'assets/images/restaurant1.jpg',
      'assets/images/restaurant2.jpg',
      'assets/images/restaurant3.jpg',
      'assets/images/restaurant4.jpg',
      'assets/images/restaurant5.jpg',
      'assets/images/restaurant6.jpg',
      'assets/images/restaurant7.jpg',
      'assets/images/restaurant8.jpg',
      'assets/images/restaurant9.jpg',
    ];

    return Container(
      height: 400,
      //color: Colors.orange,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400,
          enableInfiniteScroll: true,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: carouselItems.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(item),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget buildCuisineGrid(BuildContext context) {
    List<Map<String, dynamic>> cuisines = [
      {'name': 'Pizza', 'image': 'assets/images/pizza.jpg', 'description': 'Authentic Italian flavors'},
      {'name': 'Burgers', 'image': 'assets/images/burger.jpg', 'description': 'Juicy beef patties in freshly baked buns'},
      {'name': 'Sushi', 'image': 'assets/images/sushi.jpeg', 'description': 'Delightful Japanese delicacies'},
      {'name': 'Italian', 'image': 'assets/images/italian.jpg', 'description': 'Exquisite pasta and risotto dishes'},
      {'name': 'Mexican', 'image': 'assets/images/mexican.jpg', 'description': 'Spicy and flavorful Mexican cuisine'},
      {'name': 'Chinese', 'image': 'assets/images/chinese.jpg', 'description': 'Savor the taste of China'},
      {'name': 'Desserts', 'image': 'assets/images/desserts.jpg', 'description': 'Indulge in sweet treats'},
      {'name': 'Seafood', 'image': 'assets/images/seafood.jpg', 'description': 'Fresh seafood delights'},
      {'name': 'Vegetarian', 'image': 'assets/images/vegetarian.jpg', 'description': 'Healthy and delicious vegetarian options'},
      {'name': 'Pasta', 'image': 'assets/images/pasta.jpg', 'description': 'Classic pasta dishes for every palate'},
    ];

    return Container(
      height: 500,
      color: Colors.orange,
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: cuisines.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Show pop-up with cuisine description
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(cuisines[index]['name']),
                    content: Text(cuisines[index]['description']),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage(cuisines[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Center(
                  child: Text(
                    cuisines[index]['name'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildPromotionsBanner() {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/promotions_banner.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Center(
          child: Text(
            '50% OFF on all orders!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
