import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/favorite_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widegt/fav_card.dart';

import '../../provider/page_provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);


    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: const Text('Favorite Shoes'),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWislist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ico_love.png',
                width: 74,
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                'You don\'t have dream shoes?',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Let\'s find your favorite shoes',
                style: secondaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                     pageProvider.currentIndex = 0;
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 24),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      'Explore Store',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ))
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: backgroundColor3,
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: favoriteProvider.fav
                .map((product) => LoveCard(product))
                .toList()),
      ));
    }

    return Column(
      children: [
        header(),
        //emptyWislist(),
        // ignore: prefer_is_empty
        favoriteProvider.fav.length == 0 ? emptyWislist() : content()
      ],
    );
  }
}
