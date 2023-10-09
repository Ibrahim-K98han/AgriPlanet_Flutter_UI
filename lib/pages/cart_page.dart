import 'package:agri_planet/data/product.dart';
import 'package:agri_planet/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = products.take(4).toList();
    final totalPrice =
        cartItems.map((e) => e.price).reduce((acc, cur) => acc + cur);
    return Scaffold(
      body: ListView(
        children: [
          ...List.generate(
            cartItems.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CartItem(cartItem: cartItems[index]),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total (${cartItems.length})'),
                Text(
                  '\$${totalPrice}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FilledButton.icon(
              onPressed: () {},
              icon: Icon(IconlyBold.arrowRight),
              label: Text('Proceed to checkout'),
            ),
          )
        ],
      ),
    );
  }
}
