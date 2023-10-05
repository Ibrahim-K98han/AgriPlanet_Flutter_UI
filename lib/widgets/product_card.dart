import 'package:agri_planet/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            alignment: Alignment.topRight,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(productModel.image),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    productModel.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '\$${productModel.price}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: '/${productModel.unit}',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ]),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton.filled(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
