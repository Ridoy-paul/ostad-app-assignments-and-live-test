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
        primarySwatch: Colors.deepPurple,
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
                  padding: EdgeInsets.all(40),
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
                          AspectRatio(
                            aspectRatio: 4/4,
                            child: Container(
                              color: Colors.red,
                              child: Image.network(
                                  'https://images.idgesg.net/images/article/2017/10/wireless_network_internet_of_things_iot_thinkstock_853701554_3x2-100740688-large.jpg?auto=webp&quality=85,70',
                              fit: BoxFit.cover,
                              ),
                            ),
                          ),
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

