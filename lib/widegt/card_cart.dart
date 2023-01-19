import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';

import '../models/cart_model.dart';
import '../provider/cart_provider.dart';

class CardCart extends StatelessWidget {
  final CartModel cart;
  const CardCart(this.cart ,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
          top: defaultMargin, right: defaultMargin, left: defaultMargin),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
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
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\$${cart.product.price}',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      cartProvider.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/icon_ad.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: (){
                      cartProvider.minQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/icon_min.png',
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: (){
              cartProvider.removeCart(cart.id);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/remove.png',
                  width: 10,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(fontSize: 12, fontWeight: light),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
