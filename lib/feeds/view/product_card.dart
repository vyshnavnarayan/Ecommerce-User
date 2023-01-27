import 'dart:ffi';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.product}) : super(key: key);

  final QueryDocumentSnapshot<Object?> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        shadowColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {

            },
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product['product_images'][0].toString(),
                    width: 100,
                  ),
                ),
                Text(product['product_name'].toString(),
                    style: const TextStyle(fontSize: 17)),
                Text(product['description'].toString()),
                Row(
                  children: [
                    const Icon(Icons.currency_rupee, size: 12),
                    Text('${product['product_price']}/-',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Disc - ${product['discount']}%off',
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
