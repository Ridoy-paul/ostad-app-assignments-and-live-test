import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation screenOrientation = MediaQuery.orientationOf(context);
    print(screenOrientation);
    return Scaffold(
      appBar: AppBar(
        title: Text("News Feed"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _BuildScreen(orientation, context);
        },
      ),
    );
  }

  Widget _BuildScreen(Orientation orientation, context) {

    if(orientation == Orientation.portrait) {
      return SafeArea(
        child: ListView.builder(
          itemCount: 16,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  'https://via.placeholder.com/150',
                ),
              ),
            );
          }
        ),
      );
    }
    else {
      return SafeArea(
        child: GridView.builder(
          itemCount: 16,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
          ),
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 150,
                child: Image.network(
                  'https://via.placeholder.com/150',
                ),
              ),
            );
          }
        ),
      );
    }
  }
}

