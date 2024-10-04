import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class add1 extends StatelessWidget {
  const add1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 370,
            height: 225,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'lib/images/add3.png'
                      : 'lib/images/add6.jpg',
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 370,
            height: 225,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'lib/images/add5.png'
                      : 'lib/images/add7.jpg',
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 370,
            height: 225,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'lib/images/add5.png'
                      : 'lib/images/add2.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class add2 extends StatelessWidget {
  const add2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'lib/images/add1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'lib/images/add2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'lib/images/add5.png'
                      : 'lib/images/add6.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
