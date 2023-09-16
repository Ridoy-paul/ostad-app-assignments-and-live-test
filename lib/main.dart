import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageActivity(),
    );
  }
}

class HomePageActivity extends StatelessWidget {
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
      body: HomePageActivity(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  final List<Map<String, dynamic>> shoppingItems = [
    {"name": "Apples", "icon": Icons.shopping_cart},
    {"name": "Bananas", "icon": Icons.shopping_cart},
    {"name": "Milk", "icon": Icons.shopping_cart},
    {"name": "Bread", "icon": Icons.shopping_cart},
    {"name": "Eggs", "icon": Icons.shopping_cart},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppingItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(shoppingItems[index]["icon"]),
          title: Text(shoppingItems[index]["name"]),
          onTap: () {

          },
        );
      },
    );
  }

}