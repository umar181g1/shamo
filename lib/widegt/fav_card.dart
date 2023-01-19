import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/favorite_provider.dart';
import 'package:shamo/theme.dart';

import '../models/product_model.dart';

class LoveCard extends StatelessWidget {
  final ProductModel product;
  const LoveCard(this.product, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor4),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries[0].url,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              favoriteProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/buttom_love.png',
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}
