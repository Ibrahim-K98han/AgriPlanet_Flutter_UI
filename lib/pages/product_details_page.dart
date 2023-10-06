import 'package:agri_planet/data/product.dart';
import 'package:agri_planet/models/product_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showingMore = false;
  late TapGestureRecognizer readMoreGestureRecognizer;

  @override
  void initState() {
    readMoreGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showingMore = !showingMore;
        });
      };
    super.initState();
  }

  @override
  void dispose() {
    readMoreGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productModel.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyBroken.bookmark),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(widget.productModel.image),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            widget.productModel.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available in stock',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '\$${widget.productModel.price}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextSpan(
                    text: '/${widget.productModel.unit}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ]),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade600,
              ),
              Text('${widget.productModel.rating} (192)'),
              Spacer(),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: () {},
                  icon: Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '5 ${widget.productModel.unit}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Description',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                    text: showingMore
                        ? widget.productModel.description
                        : "${widget.productModel.description.substring(0, widget.productModel.description.length - 100)}..."),
                TextSpan(
                  recognizer: readMoreGestureRecognizer,
                  text: showingMore ? 'Read less' : 'Read More',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Related Product',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 80,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        products[index].image,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemCount: products.length,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FilledButton.icon(
            onPressed: () {},
            icon: Icon(IconlyLight.bag2),
            label: Text('Add to Card'),
          )
        ],
      ),
    );
  }
}
