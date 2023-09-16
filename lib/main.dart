import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping BD",
      debugShowCheckedModeBanner: false,
      home: HomePageActivity(),
    );
  }
}

class HomePageActivity extends StatelessWidget {
  final List<Map<String, dynamic>> shoppingItems = [
    {"name": "Apples", "icon": Icons.shopping_cart},
    {"name": "Bananas", "icon": Icons.add_shopping_cart_rounded},
    {"name": "Milk", "icon": Icons.shopping_cart_outlined},
    {"name": "Bread", "icon": Icons.shopping_cart},
    {"name": "Eggs", "icon": Icons.shopping_cart},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'My Shopping List',
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
        itemCount: shoppingItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(shoppingItems[index]["icon"]),
            title: Text(shoppingItems[index]["name"]),
            onTap: () {

            },
          );
        },
      ),
    );
  }
}