import 'package:flutter/material.dart';

class OrderPages extends StatelessWidget {
  const OrderPages({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Processing', 'Pickup', 'Shipping', 'Delivered'];
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
      ),
    );
  }
}
