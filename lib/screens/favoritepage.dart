import 'dart:convert';
import 'package:cellmasterapp/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoritePhones = [];
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites');
    if (favorites != null) {
      setState(() {
        favoritePhones = favorites
            .map((item) => jsonDecode(item) as Map<String, dynamic>)
            .toList();
      });
    }
  }

  Future<void> removeFavorite(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites');
    if (favorites != null) {
      favorites.removeAt(index);
      await prefs.setStringList('favorites', favorites);
      loadFavorites(); // Reload after removal
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Column(children: [
        Row(children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20)),
          Image(
            alignment: Alignment.centerLeft,
            height: 100,
            image: AssetImage(
              Theme.of(context).brightness == Brightness.dark
                  ? 'lib/images/darklogo.png'
                  : 'lib/images/logo.png',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Favorites',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6180CF))),
                ],
              ),
            ),
          ),
        ]),
        Expanded(
          child: favoritePhones.isNotEmpty
              ? ListView.builder(
                  itemCount: favoritePhones.length,
                  itemBuilder: (context, index) {
                    final phone = favoritePhones[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      color: Theme.of(context).colorScheme.primary,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            phone['image'] != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      phone['image'],
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 60);
                                      },
                                    ),
                                  )
                                : const Icon(Icons.image_not_supported,
                                    size: 60),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    phone['name'] ?? 'No Name',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    phone['brand'] ?? 'No Brand',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    phone['price'] != null
                                        ? '\$${phone['price']}'
                                        : 'No Price',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.redAccent),
                              onPressed: () {
                                removeFavorite(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(child: Text('No favorite phones added.')),
        ),
      ])),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex),
    );
  }
}
