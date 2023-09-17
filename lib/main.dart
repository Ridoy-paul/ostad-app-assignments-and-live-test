import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageActivity(),

    );
  }
}

class HomePageActivity extends StatelessWidget {
  HomePageActivity({super.key});

  final List<String> imageUrls = [
    'https://topmobileinfo.com/images/products/samsung-w23-mobile-8782.png',
    'https://topmobileinfo.com/images/products/samsung-w23-mobile-8782.png',
    'https://topmobileinfo.com/images/products/samsung-w23-mobile-8782.png',
    'https://topmobileinfo.com/images/products/samsung-w23-mobile-8782.png',
    'https://topmobileinfo.com/images/products/samsung-w23-mobile-8782.png',
    'https://topmobileinfo.com/images/products/samsung-w23-mobile-8782.png',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome To My Photo Gallery!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for Photos...',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              IconButton(onPressed: () {
                MySnackbar.showSnackBar(context, "This is Home");
              }, icon: Icon(Icons.call)),

              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('Image $index clicked!'),
                      //   ),
                      // );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(
                            imageUrls[index], // Use the image URL from the list
                            height: 120.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Caption for Image $index'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

        ),
      ),
    );
  }
}

class MySnackbar {
  static void showSnackBar(BuildContext context, String mesage) {
    final snackBar = SnackBar(
      content: Text(mesage),
      duration: Duration(seconds: 1),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Photo Gallery'),
      centerTitle: true,
    );

  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}