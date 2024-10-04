import 'package:cellmasterapp/screens/productdetails.dart';
import 'package:cellmasterapp/services/globals.dart'; // Ensure baseURL is correct
import 'package:cellmasterapp/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MobilePhonesListScreen extends StatefulWidget {
  @override
  _MobilePhonesListScreenState createState() => _MobilePhonesListScreenState();
}

class _MobilePhonesListScreenState extends State<MobilePhonesListScreen> {
  List<dynamic> mobilePhones = [];
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    fetchMobilePhones();
  }

  Future<void> fetchMobilePhones() async {
    final response = await http.get(Uri.parse(baseURL + 'mobile-phones'));

    if (response.statusCode == 200) {
      setState(() {
        mobilePhones = json.decode(response.body)['data'];
      });
    } else {
      // Handle errors
      print(
          'Failed to load mobile phones. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mobile Phones',
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: mobilePhones.length,
                  itemBuilder: (context, index) {
                    final mobilePhone = mobilePhones[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MobilePhoneDetails(
                              mobilePhoneData: mobilePhone,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Theme.of(context).colorScheme.primary,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: Center(
                                child: Image.network(
                                  mobilePhone['image'],
                                  height: 140,
                                  width: 100,
                                  alignment: Alignment.center,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mobilePhone['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  RatingBar.builder(
                                    initialRating: mobilePhone['rating'] ??
                                        3, // Adjust rating logic as needed
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 13,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Color(0xFF6180CF),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(height: 5),
                                  Text(mobilePhone['brand']),
                                  SizedBox(height: 5),
                                  Text(
                                    'LKR ${mobilePhone['price']}',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.color),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex),
    );
  }
}
