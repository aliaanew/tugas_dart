import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// ============================================================
// MODEL DATA
// ============================================================

class Restaurant {
  final String name;
  final double rating;
  final String category;
  final String address;
  final String distance;
  final String openingHours;
  final String averagePrice;
  final String description;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.rating,
    required this.category,
    required this.address,
    required this.distance,
    required this.openingHours,
    required this.averagePrice,
    required this.description,
    required this.imageUrl,
  });
}

class Menu {
  final String name;
  final String price;
  final String imageUrl;

  Menu({required this.name, required this.price, required this.imageUrl});
}

// ============================================================
// DATA CONTOH
// ============================================================

final Restaurant restaurant = Restaurant(
  name: 'Warung Nusantara',
  rating: 4.8,
  category: 'Masakan Nusantara',
  address: 'Jl. Senopati No. 42, Jakarta Selatan',
  distance: '1.5 km',
  openingHours: '10.00 - 22.00',
  averagePrice: 'Rp 45.000',
  description:
      'Menyajikan berbagai hidangan khas Nusantara dengan bumbu rempah '
      'autentik. Suasana nyaman dan hangat, cocok untuk bersantap bersama '
      'keluarga maupun teman.',
  imageUrl: 'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?auto=format&fit=crop&w=1200&q=80',
);

final List<Menu> menus = [
  Menu(
    name: 'Nasi Goreng Spesial',
    price: 'Rp 38.000',
    imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=800&q=80',
  ),
  Menu(
    name: 'Ayam Bakar',
    price: 'Rp 45.000',
    imageUrl: 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?auto=format&fit=crop&w=800&q=80',
  ),
  Menu(
    name: 'Sate Nusantara',
    price: 'Rp 35.000',
    imageUrl: 'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?auto=format&fit=crop&w=800&q=80',
  ),
];

// ============================================================
// MAIN APP
// ============================================================

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detail Restoran',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const DetailRestaurantPage(),
    );
  }
}

// ============================================================
// HALAMAN DETAIL RESTORAN
// ============================================================

class DetailRestaurantPage extends StatelessWidget {
  const DetailRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar restoran
            Image.network(
              restaurant.imageUrl,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Informasi utama
                  RestaurantInfo(restaurant: restaurant),

                  const SizedBox(height: 16),

                  // Statistik
                  RestaurantStatistics(restaurant: restaurant),

                  const SizedBox(height: 16),

                  // Deskripsi
                  const Text(
                    'Deskripsi Restoran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    restaurant.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),

                  const SizedBox(height: 24),

                  // Menu populer
                  const Text(
                    'Menu Populer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Column(
                    children: menus.map((menu) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: MenuCard(menu: menu),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Tombol reservasi
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.restaurant),
        label: const Text('Reservasi Sekarang'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// ============================================================
// WIDGET INFORMASI RESTORAN
// ============================================================

class RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfo({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(blurRadius: 8, offset: Offset(0, 3), color: Colors.black12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 20),
              const SizedBox(width: 4),
              Text(
                restaurant.rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            restaurant.category,
            style: TextStyle(
              color: Colors.deepOrange.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, size: 20, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  restaurant.address,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WIDGET STATISTIK RESTORAN
// ============================================================
class RestaurantStatistics extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantStatistics({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(blurRadius: 8, offset: Offset(0, 3), color: Colors.black12),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(Icons.near_me, color: Colors.deepOrange),
              const SizedBox(height: 4),
              Text(
                restaurant.distance,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Jarak',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          Column(
            children: [
              const Icon(Icons.access_time, color: Colors.deepOrange),
              const SizedBox(height: 4),
              Text(
                restaurant.openingHours,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Waktu Buka',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),

          Column(
            children: [
              const Icon(Icons.payments, color: Colors.deepOrange),
              const SizedBox(height: 4),
              Text(
                restaurant.averagePrice,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Rata-rata',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WIDGET CARD MENU
// ============================================================

class MenuCard extends StatelessWidget {
  final Menu menu;

  const MenuCard({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: SizedBox(
        height: 180,
        width: double.infinity,
        child: Stack(
          children: [
            // Gambar
            Positioned.fill(
              child: Image.network(menu.imageUrl, fit: BoxFit.cover),
            ),

            // Lapisan gelap agar teks terlihat
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.75),
                    ],
                  ),
                ),
              ),
            ),

            // Nama dan harga
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    menu.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    menu.price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
