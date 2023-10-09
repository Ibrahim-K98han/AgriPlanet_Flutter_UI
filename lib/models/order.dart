import 'package:agri_planet/models/product_model.dart';
import 'package:agri_planet/utils/enums/order.dart';

class Order {
  final String id;
  final List<ProductModel> product;
  final DateTime orderingDate;
  final DateTime deliveryDate;
  final OrderStatus status;

  Order({
    required this.id,
    required this.product,
    required this.orderingDate,
    required this.deliveryDate,
    required this.status,
  });
}
