import 'package:flutter/material.dart';
import 'CustomBottomNavigationBar.dart';
import 'checkout_screen.dart';

class ProductListScreen extends StatelessWidget {
  // Dummy product data for demonstration
  final List<Map<String, dynamic>> products = [
    {'name': 'Pizza', 'price': 10.99, 'image': 'assets/images/pizza.jpg'},
    {'name': 'Burger', 'price': 15.99, 'image': 'assets/images/burger.jpg'},
    {'name': 'Pasta', 'price': 20.99, 'image': 'assets/images/pasta.jpg'},
    {'name': 'Sushi', 'price': 25.99, 'image': 'assets/images/sushi.jpeg'},
    {'name': 'Vegetarian', 'price': 12.99, 'image': 'assets/images/vegetarian.jpg'},
    {'name': 'Italian', 'price': 30.99, 'image': 'assets/images/italian.jpg'},
    {'name': 'Desserts', 'price': 18.99, 'image': 'assets/images/desserts.jpg'},
    {'name': 'Maxican', 'price': 14.99, 'image': 'assets/images/mexican.jpg'},
    {'name': 'Sea Food', 'price': 8.99, 'image': 'assets/images/seafood.jpg'},
    {'name': 'Combo Meal', 'price': 22.99, 'image': 'assets/images/combomeal.jpg'},
    {'name': 'chinese', 'price': 23.99, 'image': 'assets/images/chinese.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Product List',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.white,),),centerTitle: true,backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return buildProductItem(product, context);
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          handleBottomNavigationTap(context, index);
        },
      ),
    );
  }

  Widget buildProductItem(Map<String, dynamic> product, BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.orange,
      child: ListTile(
        leading: Image.network(
          product['image'],
          width: 60.0,
          height: 60.0,
          fit: BoxFit.cover,
        ),
        title: Text(product['name']),
        subtitle: Text('\$${product['price']}'),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () async {
            int quantity = await showEditQuantityDialog(1, context);
            if (quantity > 0) {
              // Pass product and quantity to CheckoutScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(
                    product: product,
                    quantity: quantity,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<int> showEditQuantityDialog(int initialQuantity, BuildContext context) async {
    int quantity = initialQuantity;

    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Quantity'),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: TextEditingController(text: quantity.toString()),
            onChanged: (value) {
              quantity = int.tryParse(value) ?? quantity;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, initialQuantity);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, quantity);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

}
