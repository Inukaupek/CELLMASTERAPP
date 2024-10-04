import 'dart:convert';
import 'package:cellmasterapp/screens/mobilephonelist.dart';
import 'package:cellmasterapp/widgets/batterystatus.dart';
import 'package:cellmasterapp/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:cellmasterapp/screens/adds.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _city = 'Loadding...';

  int _selectedIndex = 0;
  String name = '';
  @override
  void initState() {
    super.initState();
    _loadUserData();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _city = 'Location services are disabled.';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _city = 'Location permissions are denied';
        });
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _city =
              'Location permissions are permanently denied, we cannot request permissions.';
        });
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      _city = placemarks[0].locality ?? 'Loadding...';
    });
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      Map<String, dynamic> user = json.decode(userJson);
      setState(() {
        name = user['name'] ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
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
                    Text(
                      'Hi $name',
                      style: TextStyle(
                          fontSize: 20,
                          color:
                              Theme.of(context).textTheme.displayLarge?.color),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Location:   ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color,
                            ),
                          ),
                          TextSpan(
                            text: _city,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF6180CF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
            ),
            BatteryStatusWidget(),
          ]),
          const SizedBox(height: 20),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              Text(
                'Welcome to CELLMASTER',
                style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).textTheme.displayLarge?.color,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                    ),
                    Text(
                      'Search here......',
                      style:
                          TextStyle(color: Color.fromARGB(255, 106, 106, 106)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const add1(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).textTheme.displayLarge?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 4),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobilePhonesListScreen(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).colorScheme.surface,
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(5, 10)),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Image.asset('lib/images/iphone.png',
                            width: 50, height: 60),
                        const SizedBox(height: 5),
                        Text(
                          'Phones',
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.surface,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(5, 10)),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Image.asset('lib/images/headphone.png',
                          width: 50, height: 60),
                      const SizedBox(height: 5),
                      Text(
                        'Headsets',
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
                          fontWeight: FontWeight.bold,
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
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.surface,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(5, 10)),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Image.asset('lib/images/watches.png',
                          width: 50, height: 60),
                      const SizedBox(height: 5),
                      Text(
                        'Watches',
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
                          fontWeight: FontWeight.bold,
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
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).colorScheme.surface,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(5, 10)),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    children: [
                      Image.asset('lib/images/accessories.png',
                          width: 50, height: 60),
                      const SizedBox(height: 5),
                      Text(
                        'Other',
                        style: TextStyle(
                          fontSize: 11,
                          color:
                              Theme.of(context).textTheme.displayLarge?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
        ]),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex),
    );
  }
}
