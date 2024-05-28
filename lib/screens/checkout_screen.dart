import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'CustomBottomNavigationBar.dart';

class CheckoutScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _orderReference =
  FirebaseDatabase.instance.ref().child('orders');

  final Map<String, dynamic> product;
  final int quantity;
  TextEditingController _deliveryAddressController = TextEditingController();

  CheckoutScreen({required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildProductDetails(),
            buildDeliveryAddressForm(),
            buildOrderSummary(),
            buildDeliveryTimeEstimate(),
            buildPlaceOrderButton(context),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 6,
        onTap: (index) {
          handleBottomNavigationTap(context, index);
        },
      ),
    );
  }

  Widget buildProductDetails() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                product['image'],
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product['name'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Quantity: $quantity'),
            Text('One Quantity Price: \$${product['price']}'),
            Text(
              'Total Price: \$${quantity * product['price']}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget buildDeliveryAddressForm() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Table Number',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _deliveryAddressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Enter Table Number',
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget buildOrderSummary() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Product: ${product['name']}'),
            Text('Quantity: $quantity'),
            Text(
              'Total Price: \$${quantity * product['price']}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget buildDeliveryTimeEstimate() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Delivery Time Estimate',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Your order will be delivered within 30 minutes.'),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget buildPlaceOrderButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        saveOrderDetails();
        Navigator.pushReplacementNamed(context, '/home');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple, // Customize button color
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        'Place Order',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }

  void saveOrderDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DatabaseReference userOrderRef = _orderReference.child(user.uid).push();

        // Generate a unique order ID
        String orderId = userOrderRef.key ?? '';

        await userOrderRef.set({
          'orderId': orderId,
          'productId': product['productId'], // Assuming your product has a unique ID
          'productName': product['name'],
          'quantity': quantity,
          'totalPrice': product['price'] * quantity,
          'deliveryAddress': _deliveryAddressController.text,
        });

        print('Order details saved successfully. Order ID: $orderId');
      } else {
        print('User not signed in. Cannot save order details.');
      }
    } catch (error) {
      print('Error saving order details: $error');
    }
  }
}
