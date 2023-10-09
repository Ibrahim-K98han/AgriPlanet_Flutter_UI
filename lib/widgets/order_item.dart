import 'package:agri_planet/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'order_product.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalPrice = order.product.fold(0.0, (acc, e) => acc + e.price);
    final products = order.product.take(2).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Order: ${order.id}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '(${order.product.length}) Items',
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('\$${totalPrice.toStringAsFixed(2)}')
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ...List.generate(products.length, (index) {
              return OrderProduct(
                productModel: products[index],
                order: order,
              );
            }),
            if (order.product.length > 1)
              SizedBox(
                height: 10,
              ),
            if (order.product.length > 1)
              TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            itemCount: order.product.length,
                            padding: EdgeInsets.all(14),
                            itemBuilder: (context, index) {
                              final product = order.product[index];
                              return OrderProduct(
                                  order: order, productModel: product);
                            },
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(IconlyBold.arrowRight),
                  label: Text('View All'))
          ],
        ),
      ),
    );
  }
}
