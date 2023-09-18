import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final List<String> imageUrls = [
    "https://cdn-ipieb.nitrocdn.com/XUuAIAbfSYJmvfScsdokbEdfsfJmcNEb/assets/images/optimized/rev-9f5d252/wp-content/uploads/2023/05/1-2.png",
    "https://cdn-ipieb.nitrocdn.com/XUuAIAbfSYJmvfScsdokbEdfsfJmcNEb/assets/images/optimized/rev-9f5d252/wp-content/uploads/2023/05/sme.png",
    "https://cdn-ipieb.nitrocdn.com/XUuAIAbfSYJmvfScsdokbEdfsfJmcNEb/assets/images/optimized/rev-9f5d252/wp-content/uploads/2023/05/exchange-rate.png",
    "https://cdn-ipieb.nitrocdn.com/XUuAIAbfSYJmvfScsdokbEdfsfJmcNEb/assets/images/optimized/rev-9f5d252/wp-content/uploads/2023/05/5.png",
    "https://cdn-ipieb.nitrocdn.com/XUuAIAbfSYJmvfScsdokbEdfsfJmcNEb/assets/images/optimized/rev-9f5d252/wp-content/uploads/2023/05/merchant.png",
    "https://cdn-ipieb.nitrocdn.com/XUuAIAbfSYJmvfScsdokbEdfsfJmcNEb/assets/images/optimized/rev-9f5d252/wp-content/uploads/2023/05/supplier.png",
  ];

  final List<String> captions = [
    "Super Shop",
    "SME Business",
    "Trading Business",
    "Export-Import",
    "Dealer Business",
    "Supplier Business",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome To My Photo Gallery!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for Photos...',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return GridItem(
                  imageUrl: imageUrls[index],
                  caption: captions[index],
                );
              },
            ),
            SizedBox(height: 30.0),
            SamplePhotoItem(
              title: 'Capture The Photo',
              subtitle: 'Amazing View',
              customIcon: Icon(Icons.add_a_photo_outlined),
            ),

            SamplePhotoItem(
              title: 'Sample Photo 2',
              subtitle: 'Beautiful Flowers..',
              customIcon: Icon(Icons.ac_unit),
            ),
            SamplePhotoItem(
              title: 'My Account',
              subtitle: 'View Profile, Update Profile',
              customIcon: Icon(Icons.account_circle),
            ),

            SizedBox(height: 16.0),
            Center(
              child: FloatingActionButton(
                onPressed: () {
                  MySnackbar.showSnackBar(context, "Photos Uploaded Successfully!");
                },
                child: const Icon(Icons.upload),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String imageUrl;
  final String caption;

  GridItem({required this.imageUrl, required this.caption});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MySnackbar.showSnackBar(context, caption);
      },
      child: Card(
        child: Column(
          children: [
            Image.network(
              imageUrl,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(caption),
            ),
          ],
        ),
      ),
    );
  }
}

class SamplePhotoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final customIcon;

  SamplePhotoItem({required this.title, required this.subtitle, this.customIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: customIcon,
        ),
        DividerItem( height: 5.0, thickness: 1.0,),
      ],
    );
  }
}

class DividerItem extends StatelessWidget {
 final double height;
 final double thickness;
 DividerItem({required this.height, required this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider( // Divider
      color: Colors.black12,
      height: height,
      thickness: thickness,
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
