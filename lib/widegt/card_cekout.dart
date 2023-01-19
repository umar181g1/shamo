import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/theme.dart';

class CekOutCard extends StatelessWidget {
  final CartModel cart;
  const CekOutCard(this.cart, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image:  DecorationImage(
                    image: NetworkImage(cart.product.galleries[0].url))),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${cart.product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
