import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_models.dart';
import 'package:shamo/provider/product_provider.dart';
import 'package:shamo/provider/user_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widegt/product_card.dart';

import '../../widegt/product_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    UserModel userModel = userProvider.user;

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${userModel.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '@${userModel.username}',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    userModel.profilePhotoUrl,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget category() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Text(
                  'All Shoes',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor),
                child: Text(
                  'Running',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor),
                child: Text(
                  'Training',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor),
                child: Text(
                  'Basketball',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: subtitleColor),
                    color: transparentColor),
                child: Text(
                  'Hiking',
                  style: primaryTextStyle.copyWith(
                      fontSize: 13, fontWeight: medium),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget popolarProuducttitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: productProvider.products
                  .map((product) => ProductCard(product))
                  .toList()),
        ),
      );
    }

    Widget newArifalsttitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Column(
            children: productProvider.products
                .map((product) => ProductTitle(product))
                .toList()),
      );
    }

    return ListView(
      children: [
        header(),
        category(),
        popolarProuducttitle(),
        popularProduct(),
        newArifalsttitle(),
        newArrivals()
      ],
    );
  }
}
