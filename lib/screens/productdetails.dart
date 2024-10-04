import 'dart:convert';
import 'package:cellmasterapp/screens/buyproductpage.dart';
import 'package:cellmasterapp/screens/favoritepage.dart';
import 'package:cellmasterapp/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobilePhoneDetails extends StatefulWidget {
  final Map<String, dynamic> mobilePhoneData;

  const MobilePhoneDetails({
    Key? key,
    required this.mobilePhoneData,
  }) : super(key: key);

  @override
  State<MobilePhoneDetails> createState() => _MobilePhoneDetailsState();
}

class _MobilePhoneDetailsState extends State<MobilePhoneDetails> {
  int _selectedIndex = 1;
  bool _isExpanded = false;

  Future<void> addToFavorites(
      BuildContext context, Map<String, dynamic> mobilePhone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve existing favorites or initialize an empty list
    List<String>? favorites = prefs.getStringList('favorites');
    if (favorites == null) {
      favorites = [];
    }
    favorites.add(jsonEncode(mobilePhone));
    await prefs.setStringList('favorites', favorites);

    // Navigate to the FavoritesPage after successfully adding
    navigateToFavorites(context);
  }

  void navigateToFavorites(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FavoritesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  alignment: Alignment.center,
                  width: 380,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: widget.mobilePhoneData['image'] != null
                      ? Image.network(
                          widget.mobilePhoneData['image'],
                          width: 200,
                        )
                      : const Placeholder(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.mobilePhoneData['name'] ?? 'No Title',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).textTheme.displayLarge?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RatingBar.builder(
                  initialRating: widget.mobilePhoneData['rating'] ??
                      3, // Adjust rating logic as needed
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 18,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Color(0xFF6180CF),
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.mobilePhoneData['description'] ?? 'No Description',
                  maxLines: _isExpanded ? null : 5,
                  overflow: _isExpanded ? null : TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Functionalities',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.displayLarge?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 200, 216, 250),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            widget.mobilePhoneData['display'] ?? '6.0"',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF6180CF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Display',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 90, 90, 90),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 200, 216, 250),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            widget.mobilePhoneData['ram'] ?? '4GB',
                            style: const TextStyle(
                              fontSize: 17,
                              color: Color(0xFF6180CF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'RAM',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 90, 90, 90),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                    ),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 200, 216, 250),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      child: Column(
                        children: [
                          Text(
                            widget.mobilePhoneData['storage'] ?? '64GB',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6180CF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Storage',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 90, 90, 90),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 200, 216, 250),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      child: Column(
                        children: [
                          Text(
                            widget.mobilePhoneData['camera'] ?? '12MP',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF6180CF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 90, 90, 90),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'LKR ${widget.mobilePhoneData['price'] ?? 'No Price'}.00',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(children: [
                      // Buy Now button
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6180CF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Navigate to BuyPage with product details
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyPage(
                                    mobilePhoneData: widget.mobilePhoneData),
                              ),
                            );
                          },
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Add to Favorites button
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6180CF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            await addToFavorites(
                                context, widget.mobilePhoneData);
                          },
                          child: const Text(
                            'Add to Favorites',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex),
    );
  }
}
