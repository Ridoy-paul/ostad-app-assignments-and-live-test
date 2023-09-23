import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            textStyle: TextStyle(
              fontSize: 12,
            )
          )
        )
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product> products = [
    Product(name: "Smartphone", price: 599),
    Product(name: "Laptop", price: 999),
    Product(name: "Tablet", price: 299),
    Product(name: "Headphones", price: 149),
    Product(name: "Smartwatch", price: 199),
    Product(name: "Camera", price: 499),
    Product(name: "Television", price: 799),
    Product(name: "Gaming Console", price: 399),
    Product(name: "Bluetooth Speaker", price: 89),
    Product(name: "External Hard Drive", price: 129),
    Product(name: "Monitor", price: 249),
    Product(name: "Printer", price: 179),
    Product(name: "Wireless Mouse", price: 29),
    Product(name: "Keyboard", price: 49),
    Product(name: "VR Headset", price: 299),
    Product(name: "Home Theater System", price: 449),
    Product(name: "Coffee Maker", price: 79),
    Product(name: "Microwave Oven", price: 129),
    Product(name: "Blender", price: 39),
    Product(name: "Toaster", price: 29),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            child: IconButton(
              tooltip: 'Contact Us',
              color: Colors.white,
              icon: Icon(Icons.wifi_calling_sharp, size: 25,),
              onPressed: () {
                print("Contact Us");
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            child: IconButton(
              tooltip: 'Account',
              color: Colors.white,
              icon: Icon(Icons.account_circle, size: 25,),
              onPressed: () {
                print("Account");
              },
            ),
          ),

        ],
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onBuyNow: () {
              setState(() {
                if (products[index].counter < 5) {
                  products[index].incrementCounter();
                }
                if (products[index].counter == 5) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text(
                            'You\'ve bought 5 ${products[index].name}!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(products: products),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

class Product {
  final String name;
  final int price;
  int counter = 0;

  Product({required this.name, required this.price});
  void incrementCounter() {
    counter++;
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function() onBuyNow;

  ProductItem({required this.product, required this.onBuyNow});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('${product.price} TK'),
      trailing: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Counter ${product.counter}'),
            SizedBox(
              height: 30,
              child: ElevatedButton(
                onPressed: onBuyNow,
                child: Text(
                    'Buy Now',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalBought = products.fold(0, (sum, product) => sum + product.counter);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Products Bought:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$totalBought',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

