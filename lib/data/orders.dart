import 'package:agri_planet/data/product.dart';
import 'package:agri_planet/utils/enums/order.dart';

import '../models/order.dart';

List<Order> orders = [
  Order(
    id: '402aje5',
    product: products.reversed.take(3).toList(),
    orderingDate: DateTime.utc(2022, 1, 1),
    deliveryDate: DateTime.utc(2022, 2, 1),
    status: OrderStatus.delivered,
  ),
  Order(
    id: '2202aje5',
    product: products.reversed.take(1).toList(),
    orderingDate: DateTime.utc(2022, 1, 1),
    deliveryDate: DateTime.utc(2022, 2, 1),
    status: OrderStatus.processing,
  ),
  Order(
    id: '1102aje5',
    product: products.reversed.take(3).toList(),
    orderingDate: DateTime.utc(2022, 2, 5),
    deliveryDate: DateTime.utc(2022, 3, 1),
    status: OrderStatus.processing,
  ),
  Order(
    id: '10002aje5',
    product: products.reversed.take(3).toList(),
    orderingDate: DateTime.utc(2022, 1, 1),
    deliveryDate: DateTime.utc(2022, 3, 1),
    status: OrderStatus.processing,
  )
];
