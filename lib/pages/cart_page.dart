import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';

import '../provider/cart_provider.dart';
import '../widegt/card_cart.dart';

class CratPage extends StatelessWidget {
  const CratPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          ''
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
      );
    }

    // ignore: unused_element
    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_cart.png',
              width: 80,
              height: 69,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
            Container(
              width: 154,
              height: 44,
              margin: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                },
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        // ignore: prefer_const_constructors
        children: cartProvider.carts.map((cart) => CardCart(cart)).toList(),
      );
    }

    Widget naviCustombar() {
      // ignore: sized_box_for_whitespace
      return Container(
        height: 165,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${cartProvider.totalPrice()}',
                    style: priceTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.3,
              color: subtitleColor,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cekout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: cartProvider.carts.length == 0 ? emptyCart() : content(),
      bottomNavigationBar: cartProvider.carts.length == 0  ? SizedBox() : naviCustombar(),
    );
  }
}
