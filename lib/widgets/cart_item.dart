import 'dart:async';

import 'package:agri_planet/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartItem extends StatelessWidget {
  CartItem({
    super.key,
    required this.cartItem,
  });

  final ProductModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          IconlyLight.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        final completer = Completer<bool>();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 3),
            content: Text('Remove From cart?'),
            action: SnackBarAction(
                label: 'Keep',
                onPressed: () {
                  completer.complete(false);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }),
          ),
        );
        Timer(Duration(seconds: 3), () {
          if (!completer.isCompleted) {
            completer.complete(true);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        });

        return await completer.future;
      },
      child: SizedBox(
        height: 125,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(width: 0.2, color: Colors.grey.shade400)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: double.infinity,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(cartItem.image),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        cartItem.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${cartItem.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(
                            height: 30,
                            child: ToggleButtons(
                              onPressed: (index) {
                                if (index == 0) {
                                } else if (index == 2) {}
                              },
                              borderRadius: BorderRadius.circular(99),
                              isSelected: [true, false, true],
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              constraints: BoxConstraints(
                                minHeight: 30,
                                minWidth: 30,
                              ),
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                Text('2'),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
