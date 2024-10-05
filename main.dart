import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB58B57), // Top bar color (brown shade)
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari produk",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.photo_camera),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Implement action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Container
            Container(
              margin: EdgeInsets.all(10),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/sample_image.jpg'), // Add your asset image here
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Horizontal Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildButton("Supplier"),
                    buildButton("Biaya Operasional"),
                    buildButton("Pegawai"),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Grid Icons
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: [
                  buildGridIcon(Icons.list, "Kategori"),
                  buildGridIcon(Icons.history, "Riwayat"),
                  buildGridIcon(Icons.add_circle, "Tambah Barang"),
                  buildGridIcon(Icons.group, "Daftar Member"),
                  buildGridIcon(Icons.price_change, "Input Harga/Promo"),
                  buildGridIcon(Icons.book, "Jurnal"),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Penjualan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  // Helper function to build horizontal buttons
  Widget buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFB58B57), // Brownish color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  // Helper function to build grid icons
  Widget buildGridIcon(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.brown),
        SizedBox(height: 5),
        Text(text, textAlign: TextAlign.center),
      ],
    );
  }
}
