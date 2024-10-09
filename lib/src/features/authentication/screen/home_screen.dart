import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search here',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.black54),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel/Slider
            _buildCarouselSlider(),
            SizedBox(height: 10),

            // KYC Pending Card
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.blue[100],
                child: ListTile(
                  title: Text(
                    'KYC Pending',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'You need to provide the required documents for account activation.',
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Click Here',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Categories Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryIcon(Icons.phone_android, 'Mobile'),
                  _buildCategoryIcon(Icons.laptop_mac, 'Laptop'),
                  _buildCategoryIcon(Icons.camera_alt, 'Camera'),
                  _buildCategoryIcon(Icons.tv, 'LED'),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Product Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'EXCLUSIVE FOR YOU',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(4, (index) {
                return Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/pr1.png', // Replace with actual product image
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Product ${index + 1}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '32% OFF',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Chat button action
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function to build the carousel slider
  Widget _buildCarouselSlider() {
    List<String> imgList = [
      'assets/cs1.png',
      'assets/cs2.png',
      'assets/cs3.png',
      'assets/cs4.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 0.8,
      ),
      items: imgList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  // Category icon widget builder
  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
