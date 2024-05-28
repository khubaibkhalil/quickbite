import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'CustomBottomNavigationBar.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DatabaseReference _orderReference =
      FirebaseDatabase.instance.ref().child('orders');
  List<Order> allOrders = [];
  List<Order> userOrders = [];

  @override
  void initState() {
    super.initState();
    _orderReference.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final orders = (event.snapshot.value as Map<dynamic, dynamic>)
            ?.entries
            .map((entry) => Order.fromSnapshot(entry.key, entry.value))
            .toList() ?? [];

        setState(() {
          allOrders = orders;
          // Assume you have a specific user ID, replace 'specificUserId' with the actual user ID
          userOrders = orders.where((order) => order.userId == 'specificUserId').toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'All Orders'),
                Tab(text: 'User Orders'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrdersList(allOrders),
                  _buildOrdersList(userOrders),
                ],
              ),
            ),
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

  Widget _buildOrdersList(List<Order> orders) {
    return ListView(
      children: [
        DataTable(
          columns: const [
            DataColumn(label: Text('Order ID')),
            DataColumn(label: Text('Product Name')),
            DataColumn(label: Text('Quantity')),
            DataColumn(label: Text('Total Price')),
            DataColumn(label: Text('Delivery Address')),
            DataColumn(label: Text('Actions')),
          ],
          rows: orders.map((order) {
            return DataRow(cells: [
              DataCell(Text(order.orderId)),
              DataCell(Text(order.productName)),
              DataCell(Text(order.quantity.toString())),
              DataCell(Text('\$${order.totalPrice}')),
              DataCell(Text(order.deliveryAddress)),
              DataCell(
                IconButton(
                  onPressed: () => _deleteOrder(order.id),
                  icon: Icon(Icons.delete),
                ),
              ),
            ]);
          }).toList(),
        ),
      ],
    );
  }

  void _deleteOrder(String orderId) async {
    await _orderReference.child(orderId).remove();
  }
}

class Order {
  String id;
  String userId; // Add user ID to the Order model
  String orderId;
  String productName;
  int quantity;
  double totalPrice;
  String deliveryAddress;

  Order.fromJson(String id, Map<dynamic, dynamic> json)
      : id = id,
        userId = json['userId'] ?? '', // Assuming you have userId in your data
        orderId = json['orderId'] ?? '',
        productName = json['productName'] ?? '',
        quantity = json['quantity'] ?? 0,
        totalPrice = (json['totalPrice'] ?? 0.0).toDouble(),
        deliveryAddress = json['deliveryAddress'] ?? '';

  factory Order.fromSnapshot(String id, dynamic snapshotValue) {
    final Map<dynamic, dynamic>? data = snapshotValue as Map<dynamic, dynamic>?;

    return Order.fromJson(id, data ?? {});
  }
}

  