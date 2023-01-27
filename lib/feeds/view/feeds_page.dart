import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_user/feeds/view/product_card.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatelessWidget {
    FeedsPage({super.key});
 final CollectionReference productRefferance = 
FirebaseFirestore.instance.collection('productcollection');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: productRefferance.snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!.docs;
          return Container(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
              ),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(product: products[index],);
              },
            ),
          );
        }else{
          return CircularProgressIndicator();
        }
        },
      ),
    );
  }
}