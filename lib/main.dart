import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageActivity(),

    );
  }
}

class HomePageActivity extends StatelessWidget {
  const HomePageActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
    );
  }

}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Photo Gallery'),
      //centerTitle: true,
    );

  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}