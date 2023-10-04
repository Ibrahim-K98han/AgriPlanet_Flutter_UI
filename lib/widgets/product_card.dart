import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(
          width: 0.2,
          color: Colors.grey.shade400,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            alignment: Alignment.topRight,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/tractor.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              width: 30,
              height: 30,
              child: IconButton.filled(
                padding: EdgeInsets.zero,
                onPressed: () {},
                iconSize: 18,
                icon: Icon(IconlyLight.bookmark),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tractor',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          )
        ],
      ),
    );
  }
}
