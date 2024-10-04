import 'package:cellmasterapp/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  final Map<String, dynamic> mobilePhoneData;

  const BuyPage({Key? key, required this.mobilePhoneData}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  late double deliveryFee;
  late double totalAmount;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    double price =
        double.tryParse(widget.mobilePhoneData['price'].toString()) ??
            0.0; //convert the String to Double

    deliveryFee = 400.00;
    totalAmount = price + deliveryFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(children: [
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
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Summary',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6180CF))),
                  ],
                ),
              ),
            ),
          ]),
          Column(
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
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Mobile Phone Name   :  ',
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color,
                            ),
                          ),
                          TextSpan(
                            text: widget.mobilePhoneData['name'] ?? 'No Title',
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Mobile Phone Price    :   ',
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color,
                            ),
                          ),
                          TextSpan(
                            text:
                                'LKR ${double.tryParse(widget.mobilePhoneData['price'].toString())?.toStringAsFixed(2) ?? '0.00'}',
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Delivery Fee                  :   ',
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.color,
                            ),
                          ),
                          TextSpan(
                            text: 'LKR ${deliveryFee.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.red[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Total Amount         :   ',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.color,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'LKR ${totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
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
              const SizedBox(height: 10),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6180CF),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Implement confirm order functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order Confirmed!'),
                      ),
                    );
                    // Navigate to order confirmation page or pop back to home
                  },
                  child: const Text(
                    'Confirm Order',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex),
    );
  }
}
