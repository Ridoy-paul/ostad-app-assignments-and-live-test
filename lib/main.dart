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
        title: Text("Profile"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _BuildScreen(orientation, context);
        },
      ),
    );
  }

  Widget _BuildScreen(Orientation orientation, context) {
    Size screenSize = MediaQuery.sizeOf(context);

    final List<String> brandList = [
      'https://topmobileinfo.com/images/brands/apple.jpg',
      'https://topmobileinfo.com/images/brands/samsung.jpg',
      'https://topmobileinfo.com/images/brands/xiaomi.jpg',
      'https://topmobileinfo.com/images/brands/oneplus.png',
      'https://topmobileinfo.com/images/brands/sony.jpg',
      'https://topmobileinfo.com/images/brands/vivo.png',
      'https://topmobileinfo.com/images/brands/realme.png',
      'https://topmobileinfo.com/images/brands/walton.png',
      'https://topmobileinfo.com/images/brands/infinix.png',
    ];

    if(orientation == Orientation.portrait) {
      return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 16,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(250),
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/53790501?v=4',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                "Ridoy Paul",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5,),
              Text("I'm Ridoy Chandra Paul. I'm currently working on Web App Development. For Web Development, I use Laravel which is a framework of PHP."),
              SizedBox(height: 10,),
              AspectRatio(
                aspectRatio: 16 / 10,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: brandList.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: Card(
                        elevation: 6,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Image.network(
                              brandList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    else {
      return SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width * 0.38,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/53790501?v=4',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: SizedBox(
                  width: screenSize.width * 0.60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ridoy Chandra Paul",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("I'm Ridoy Chandra Paul. I'm currently working on Web App Development. For Web Development, I use Laravel which is a framework of PHP."),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: screenSize.height * 0.50,
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                          itemCount: brandList.length,
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: Card(
                                elevation: 6,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Image.network(
                                      brandList[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

}

