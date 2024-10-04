// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:cellmasterapp/screens/productdetails.dart';

// class superdeals extends StatelessWidget {
//   const superdeals({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
//           child: Row(children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 5,
//               ),
//               child: Row(children: [
//                 Container(
//                   child: Row(children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ProductDetailsScreen(
//                                         title: 'product1',
//                                       )));
//                         },
//                         child: Container(
//                             width: 180,
//                             height: 250,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.circular(25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 5))
//                                 ]),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 7),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.centerLeft,
//                                           width: 45,
//                                           height: 25,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 238, 103, 94),
//                                             borderRadius:
//                                                 BorderRadius.circular(60),
//                                           ),
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10, vertical: 2),
//                                           child: Text('-15%',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold,
//                                               )),
//                                         )
//                                       ]),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       'lib/images/iphone.png',
//                                       width: 100,
//                                       height: 120,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(' IPhone 15 Pro',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                   RatingBar.builder(
//                                     initialRating: 4,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     itemCount: 5,
//                                     itemSize: 13,
//                                     itemPadding: EdgeInsets.symmetric(
//                                         horizontal: 3, vertical: 3),
//                                     itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Color(0xFF6180CF)),
//                                     onRatingUpdate: (index) {},
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(' LKR 375,000',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ))),
//                   ]),
//                 ),
//                 Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//                 Container(
//                   child: Row(children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ProductDetailsScreen(
//                                         title: 'product2',
//                                       )));
//                         },
//                         child: Container(
//                             width: 180,
//                             height: 250,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.circular(25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 5))
//                                 ]),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 7),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.centerLeft,
//                                           width: 45,
//                                           height: 25,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 238, 103, 94),
//                                             borderRadius:
//                                                 BorderRadius.circular(60),
//                                           ),
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10, vertical: 2),
//                                           child: Text('-15%',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold,
//                                               )),
//                                         )
//                                       ]),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       'lib/images/iphone.png',
//                                       width: 100,
//                                       height: 120,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(' IPhone 15 Pro',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                   RatingBar.builder(
//                                     initialRating: 4,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     itemCount: 5,
//                                     itemSize: 13,
//                                     itemPadding: EdgeInsets.symmetric(
//                                         horizontal: 3, vertical: 3),
//                                     itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Color(0xFF6180CF)),
//                                     onRatingUpdate: (index) {},
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(' LKR 375,000',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ))),
//                   ]),
//                 ),
//                 Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//                 Container(
//                   child: Row(children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ProductDetailsScreen(
//                                         title: 'product3',
//                                       )));
//                         },
//                         child: Container(
//                             width: 180,
//                             height: 250,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.circular(25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 5))
//                                 ]),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 7),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.centerLeft,
//                                           width: 45,
//                                           height: 25,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 238, 103, 94),
//                                             borderRadius:
//                                                 BorderRadius.circular(60),
//                                           ),
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10, vertical: 2),
//                                           child: Text('-15%',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold,
//                                               )),
//                                         )
//                                       ]),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       'lib/images/iphone.png',
//                                       width: 100,
//                                       height: 120,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(' IPhone 15 Pro',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                   RatingBar.builder(
//                                     initialRating: 4,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     itemCount: 5,
//                                     itemSize: 13,
//                                     itemPadding: EdgeInsets.symmetric(
//                                         horizontal: 3, vertical: 3),
//                                     itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Color(0xFF6180CF)),
//                                     onRatingUpdate: (index) {},
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(' LKR 375,000',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ))),
//                   ]),
//                 ),
//                 Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//                 Container(
//                   child: Row(children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ProductDetailsScreen(
//                                         title: 'product4',
//                                         mobilePhoneData: ,
//                                       )));
//                         },
//                         child: Container(
//                             width: 180,
//                             height: 250,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.circular(25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 5))
//                                 ]),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 7),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.centerLeft,
//                                           width: 45,
//                                           height: 25,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 238, 103, 94),
//                                             borderRadius:
//                                                 BorderRadius.circular(60),
//                                           ),
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10, vertical: 2),
//                                           child: Text('-15%',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold,
//                                               )),
//                                         )
//                                       ]),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       'lib/images/iphone.png',
//                                       width: 100,
//                                       height: 120,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(' IPhone 15 Pro',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                   RatingBar.builder(
//                                     initialRating: 4,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     itemCount: 5,
//                                     itemSize: 13,
//                                     itemPadding: EdgeInsets.symmetric(
//                                         horizontal: 3, vertical: 3),
//                                     itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Color(0xFF6180CF)),
//                                     onRatingUpdate: (index) {},
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(' LKR 375,000',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ))),
//                   ]),
//                 ),
//                 Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//                 Container(
//                   child: Row(children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ProductDetailsScreen(
//                                         title: 'product5',
//                                       )));
//                         },
//                         child: Container(
//                             width: 180,
//                             height: 250,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.circular(25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 5))
//                                 ]),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 7),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.centerLeft,
//                                           width: 45,
//                                           height: 25,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 238, 103, 94),
//                                             borderRadius:
//                                                 BorderRadius.circular(60),
//                                           ),
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10, vertical: 2),
//                                           child: Text('-15%',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold,
//                                               )),
//                                         )
//                                       ]),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       'lib/images/iphone.png',
//                                       width: 100,
//                                       height: 120,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(' IPhone 15 Pro',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                   RatingBar.builder(
//                                     initialRating: 4,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     itemCount: 5,
//                                     itemSize: 13,
//                                     itemPadding: EdgeInsets.symmetric(
//                                         horizontal: 3, vertical: 3),
//                                     itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Color(0xFF6180CF)),
//                                     onRatingUpdate: (index) {},
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(' LKR 375,000',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ))),
//                   ]),
//                 ),
//                 Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//                 Container(
//                   child: Row(children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ProductDetailsScreen(
//                                         title: 'product6',
//                                       )));
//                         },
//                         child: Container(
//                             width: 180,
//                             height: 250,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.circular(25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey.withOpacity(0.5),
//                                       spreadRadius: 1,
//                                       blurRadius: 8,
//                                       offset: Offset(0, 5))
//                                 ]),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 7),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           alignment: Alignment.centerLeft,
//                                           width: 45,
//                                           height: 25,
//                                           decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 238, 103, 94),
//                                             borderRadius:
//                                                 BorderRadius.circular(60),
//                                           ),
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 10, vertical: 2),
//                                           child: Text('-15%',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 10,
//                                                 fontWeight: FontWeight.bold,
//                                               )),
//                                         )
//                                       ]),
//                                   Container(
//                                     alignment: Alignment.center,
//                                     child: Image.asset(
//                                       'lib/images/iphone.png',
//                                       width: 100,
//                                       height: 120,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(' IPhone 15 Pro',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                   RatingBar.builder(
//                                     initialRating: 4,
//                                     minRating: 1,
//                                     direction: Axis.horizontal,
//                                     itemCount: 5,
//                                     itemSize: 13,
//                                     itemPadding: EdgeInsets.symmetric(
//                                         horizontal: 3, vertical: 3),
//                                     itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Color(0xFF6180CF)),
//                                     onRatingUpdate: (index) {},
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(' LKR 375,000',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       )),
//                                 ],
//                               ),
//                             ))),
//                   ]),
//                 )
//               ]),
//             )
//           ])),
//     );
//   }
// }
