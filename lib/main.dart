import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  String name;
  double price;
  List<String> imageUrls;
  String description;

  Product({
    required this.name,
    required this.price,
    required this.imageUrls,
    required this.description,
  });
}

class MyApp extends StatelessWidget {
  List<Product> products = [
    Product(
      name: 'Coffee',
      price: 12 ,
      imageUrls: [

        'https://www.foodtodayeg.com/Content/Upload/large/52022812856978255411.jpg',
        'https://cdn.salla.sa/pNbrz/5QHPH76WeeoiQoZdqPp7aLIFEqCfQbT5hJNG5ZO3.jpg',
      ],
      description: 'The best types of Brazilian coffee',
    ),
    Product(
      name: 'Nuts',
      price: 15,
      imageUrls: [
        'https://www.justfood.tv/UserFiles/mou2.gif',
        'https://cdn.salla.sa/dbvPz/H1gDnZ6cxLqgmCO8DuhV5xJsKHNEEMXF2jovfRNt.jpg'
      ],
      description: 'Healthy and fresh nuts',
    ),
    Product(
      name: 'Chocolate',
      price: 20,
      imageUrls: [
        'https://1.bp.blogspot.com/-Aemg84a4RMs/YQMs7B1594I/AAAAAAACNL0/Mdg9tPmLd-I0ySDvnGpG-D6DsC9a4T-AwCLcBGAsYHQ/s770/chocolateWhiteDark-454384771-770x533-1.jpg',
        'https://media.zid.store/cdn-cgi/image/f=auto/https://media.zid.store/17f42d21-6ca4-4375-b6c4-b545ea6ba3ff/e36ae4f5-a660-47e4-bb6e-cde9d1908715.jpg',
      ],
      description: 'The best types of chocolate',
    ),
    Product(
      name: 'Chocolate gifts',
      price: 25,
      imageUrls: [
        'https://pbs.twimg.com/media/Em70GKlWMAEWO6v?format=jpg&name=4096x4096',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7wHnhICWi7jBmEJyV3sitAXpsRlidYLu7_4Khhh6LvwR6b9_Uyns0bHXt7hEyyz5zqok&usqp=CAU',

      ],
      description: 'The best gifts for special occasions',
    ),
    Product(
      name: 'Almond candy',
      price: 8,
      imageUrls: [
        'https://s3-eu-west-1.amazonaws.com/static.jbcgroup.com/amd/pictures/081dfb5087ca49e5382ce2bedf7f9397_123123231.jpg',
        'https://elagha.net/files/11/Elagha2011/Eid-2011/E%20(654).jpg',

      ],
      description: 'The most delicious types of almond candy',
    ),
    Product(
      name: 'Candy',
      price: 6,
      imageUrls: [
        'https://png.pngtree.com/background/20230518/original/pngtree-colorful-candy-wrappers-on-a-dark-table-picture-image_2645782.jpg',
        'https://png.pngtree.com/background/20230518/original/pngtree-candy-sweets-in-a-wooden-basket-on-a-dark-floor-picture-image_2645625.jpg',

      ],
      description: 'The most delicious types of candy',
    ),
    Product(
      name: 'spices',
      price: 13,
      imageUrls: [

        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiE2a_7oKDIUzqJK4Dbzd6lKYeHJVxwa_xEDJheEnY0zH5oOisVwSZi2XQJOEek8Yf59g&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ZEb25CrKfrJEF7lDg2uZ1y1wvA7mGKybiw&usqp=CAU',
      ],
      description: 'A variety of spices',
    ),
    Product(
      name: 'Chocolate with hazelnut',
      price: 10,
      imageUrls: [
        'https://cdn.salla.sa/xgRvG/WmzwiJ0kms86Oes1ZzJBKT1R8y26Fg6Ni2K1QJBx.jpg',


      ],
      description: 'The most delicious types of chocolate with hazelnut',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1AA7EC),
          title: Text(
            'Coffee and chocolate shop',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://avante.biz/wp-content/uploads/Wallpapers-Pink/Wallpapers-Pink-021.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ProductList(products: products),
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: List.generate(
        (products.length / 2).ceil(),
            (index) {
          final firstProductIndex = index * 2;
          final secondProductIndex = firstProductIndex + 1;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (firstProductIndex < products.length)
                Expanded(
                  child: ProductCard(product: products[firstProductIndex]),
                ),
              if (secondProductIndex < products.length)
                Expanded(
                  child: ProductCard(product: products[secondProductIndex]),
                ),
            ],
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Card(
          color: Color(0xffE5B769),
          elevation: 0,
          child: Column(
            children: [
              SizedBox(
                height: 150.0,
                child: Image.network(
                  product.imageUrls[0],
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(
                  product.name,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${product.price.toString()}\jd',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsPage(product: product),
                    ),
                  );
                },
              ),
              Container(
                height: 34.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DeliveryPage(product: product),
                          ),
                        );
                      },
                      child: Text('Buy Now', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff1AA7EC),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://avante.biz/wp-content/uploads/Wallpapers-Pink/Wallpapers-Pink-021.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              Expanded(
                child: PageView(
                  children: product.imageUrls.map((imageUrl) {
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                product.description,
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Text(
                '\$${product.price.toString()}',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              Text(
                "1 Kg",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryPage(product: product),
                    ),
                  );
                },
                child: Text('Buy Now',style:TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryPage extends StatefulWidget {
  final Product product;

  DeliveryPage({required this.product});

  @override
  DeliveryPageState createState() => DeliveryPageState();
}

class DeliveryPageState extends State<DeliveryPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController(); // New controller for email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Information'),
        backgroundColor: Color(0xff1AA7EC),
      ),
      body: Container(
        color: Colors.transparent, // Set the background color to transparent
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://avante.biz/wp-content/uploads/Wallpapers-Pink/Wallpapers-Pink-021.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    widget.product.imageUrls[0],
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Product: ${widget.product.name}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Delivery Address:',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Expanded(
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Enter your delivery address',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Phone Number:',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Expanded(
                      child: TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Expanded(
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Enter your email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5), // Adjust the opacity as needed
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Access the entered phone number, address, and email
                      String phoneNumber = phoneNumberController.text;
                      String address = addressController.text;
                      String email = emailController.text;

                      // Implement the purchase action
                      print('Purchase ${widget.product.name}');
                      print('Address: $address, Phone Number: $phoneNumber, Email: $email');

                      // Navigate to the order confirmation page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderConfirmationPage(),
                        ),
                      );
                    },
                    child: Text('Confirm Purchase'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: Color(0xff1AA7EC),

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://avante.biz/wp-content/uploads/Wallpapers-Pink/Wallpapers-Pink-021.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 16.0),
              Text(
                'Order Confirmed!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Text(
                'We will contact you soon.',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the home page or any other page as needed
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}