import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_user/feeds/view/feeds_page.dart';
import 'package:ecommerce_user/home/view/home_page.dart';
import 'package:ecommerce_user/likeditem/view/liked_item_page.dart';
import 'package:ecommerce_user/profile/view/profile_page.dart';
import 'package:ecommerce_user/wishlist/view/wishlist_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
   IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<Widget> _widgets = [
   HomePage(),
    FeedsPage(),
    LikedItemPage(),
    WishList(),
    ProfilePage(),
  ];

int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[selectedItem],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 200),
        color: Colors.blueGrey.shade200,
        backgroundColor: Colors.blueGrey,
        items: [
          Icon(Icons.home),
          Icon(Icons.feed),
        Icon(Icons.favorite),
        Icon(Icons.shopping_cart),
        Icon(Icons.person)
      ],
      index: selectedItem,
      onTap: (value) {
       
            setState(() {
              selectedItem = value;
            });
         
      },
      ),
    );
  }
}