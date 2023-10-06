import 'package:flutter/material.dart';
import 'constants/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      home: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),

        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: tdBgColor,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: const Icon(Icons.search, color: Colors.black,),
        )
      ],
    );
  }


}

