import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CekOutSuksesPage extends StatelessWidget {
  const CekOutSuksesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget kontent() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_cart.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'You made a transaction',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Stay at home while we \n prepare your dream shoes',
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            Container(
              width: 195,
              height: 44,
              margin: const EdgeInsets.only(top: 30),
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
                  'Order Other Shoes',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
            Container(
              width: 195,
              height: 44,
              margin: const EdgeInsets.only(top: 12),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff39374B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'View My Order',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
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
      body: kontent(),
    );
  }
}
