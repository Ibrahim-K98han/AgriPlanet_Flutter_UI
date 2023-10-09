import 'package:agri_planet/data/orders.dart';
import 'package:agri_planet/models/order.dart';
import 'package:agri_planet/utils/enums/order.dart';
import 'package:agri_planet/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderPages extends StatelessWidget {
  const OrderPages({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Orders'),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              tabs.length,
              (index) {
                return Tab(
                  text: tabs[index],
                );
              },
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(tabs.length, (index) {
            final filteredOrders = orders
                .where((order) => order.status == OrderStatus.values[index])
                .toList();
            return ListView.separated(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                return OrderItem(order: order);
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: filteredOrders.length,
            );
          }),
        ),
      ),
    );
  }
}
