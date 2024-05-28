import 'package:flutter/material.dart';
import 'CustomBottomNavigationBar.dart';

class RestaurantMenuScreen extends StatefulWidget {
  @override
  _RestaurantMenuScreenState createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  int _currentIndex = 1; // Set the default index to 1 for the Menu screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Restaurant Banner
            buildRestaurantBanner(),

            // Menu Categories
            buildMenuCategories(),

            // Dish Items
            buildDishItems(),

            // Customization Options
            buildCustomizationOptions(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          handleBottomNavigationTap(context, index);
        },
      ),
    );
  }

  Widget buildRestaurantBanner() {
    return Container(
      height: 250,
      width: double.infinity,
      child: Image.asset(
        'assets/images/restaurant_banner.jpg', // Replace with the actual image file name
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildMenuCategories() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.orange[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Menu Categories',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCategoryItem('Appetizers'),
              buildCategoryItem('Main Course'),
              buildCategoryItem('Desserts'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDishItems() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.orange[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Dish Items',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          buildDishItem('Pizza', 'Delicious pizza with cheese and toppings', 'assets/images/pizza.jpg', 10.99),
          buildDishItem('Burger', 'Juicy burger with lettuce, tomato, and sauce', 'assets/images/burger.jpg', 8.99),
          buildDishItem('Pasta', 'Classic pasta with marinara sauce', 'assets/images/pasta.jpg', 12.99),
          buildDishItem('Sushi', 'Fresh sushi rolls with a variety of flavors', 'assets/images/sushi.jpeg', 25.99),
          buildDishItem('Vegetarian', 'Healthy and delicious vegetarian options', 'assets/images/vegetarian.jpg', 12.99),
          buildDishItem('Italian', 'Authentic Italian dishes to satisfy your cravings', 'assets/images/italian.jpg', 30.99),
          buildDishItem('Desserts', 'Indulge in sweet treats and delightful desserts', 'assets/images/desserts.jpg', 18.99),
          buildDishItem('Mexican', 'Spicy and flavorful Mexican dishes', 'assets/images/mexican.jpg', 14.99),
          buildDishItem('Seafood', 'Fresh and succulent seafood delights', 'assets/images/seafood.jpg', 8.99),
          buildDishItem('Combo Meal', 'Perfect combinations for a hearty meal', 'assets/images/combomeal.jpg', 22.99),
          buildDishItem('Chinese', 'Tantalizing Chinese dishes for a delightful experience', 'assets/images/chinese.jpg', 23.99),
        ],
      ),
    );
  }

  Widget buildCustomizationOptions() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.orange[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Customization Options',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          ExpansionTile(
            title: Text('Add-ons'),
            children: [
              buildCustomizationOption('Extra Cheese', 1.99),
              buildCustomizationOption('Bacon', 2.49),
            ],
          ),
          ExpansionTile(
            title: Text('Size Options'),
            children: [
              buildCustomizationOption('Regular', 0.00),
              buildCustomizationOption('Large', 2.99),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCategoryItem(String categoryName) {
    return GestureDetector(
      onTap: () {
        // Add functionality to filter the menu items based on category
        print('Tapped on category: $categoryName');
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.orange[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          categoryName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildDishItem(String name, String description, String imagePath, double price) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.orange[100],
      child: ListTile(
        leading: Image.asset(imagePath, width: 60.0, height: 60.0, fit: BoxFit.cover),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text('\$$price'),
        onTap: () {
          // Add functionality to show dish details or add to cart
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(name),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imagePath),
                  SizedBox(height: 10),
                  Text(description),
                  SizedBox(height: 10),
                  Text('Price: \$$price', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add to cart functionality
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$name added to cart')),
                    );
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildCustomizationOption(String optionName, double price) {
    return ListTile(
      title: Text(optionName),
      trailing: Text('\$$price'),
    );
  }

  void handleBottomNavigationTap(BuildContext context, int index) {
    setState(() {
      _currentIndex = index;
    });
    // Navigate to the respective screens
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/menu');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }
}
