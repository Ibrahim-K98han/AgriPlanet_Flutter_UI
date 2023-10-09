import 'package:agri_planet/pages/orders_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj9ySx6w03MteA7LmBWIqr5C7rhqOdC8xY2SLkoAN03bMZfXmTVpRmcH3ewSR_pFpxqJM&usqp=CAU'),
              ),
            ),
          ),
          Center(
            child: Text(
              'Mr. Williams',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              'williams@gmail.com',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            title: Text('My Order'),
            leading: Icon(IconlyLight.bag),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OrderPages();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('About Us'),
            leading: Icon(IconlyLight.infoSquare),
            onTap: () {},
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(IconlyLight.logout),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
