import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/provider/favorite_provider.dart';
import 'package:shamo/theme.dart';

import '../models/product_model.dart';
import 'detail_chat_page.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel product;

  const DetailProduct(this.product, {Key key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List images = [
    'assets/sepatu.png',
    'assets/sepatu.png',
    'assets/sepatu.png',
  ];

  List familiarshoes = [
    'assets/image_shoes.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
    'assets/image_shoes7.png',
    'assets/image_shoes8.png',
  ];

  int currunIndex = 0;

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Future<void> showDialogChart() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => SizedBox(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: primaryTextColor,
                              )),
                        ),
                        Image.asset(
                          'assets/Icon.png',
                          width: 100,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Hurray :)',
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Item added successfully',
                          style: secondaryTextStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 154,
                          height: 44,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: Text(
                              'View My Cart',
                              style: primaryTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        width: currunIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                currunIndex == index ? primaryColor : const Color(0xffC4C4C4)),
      );
    }

    Widget familarShoeshCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageUrl)),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Icon(Icons.chevron_left),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
              items: widget.product.galleries
                  .map((image) => Image.network(
                        image.url,
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currunIndex = index;
                    });
                  })),
          const SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.galleries.map((e) {
                index++;
                return indicator(index);
              }).toList())
        ],
      );
    }

    Widget kontent() {
      int index = -1;
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            color: backgroundColor1),
        child: Column(
          children: [
            //Header
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        widget.product.category.name,
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )),
                  GestureDetector(
                    onTap: () {
                      favoriteProvider.setProduct(widget.product);
                      if (favoriteProvider.isFav(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: secondaryColor,
                            content: Text(
                              'Has been added to the Wishlist',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle.copyWith(fontSize: 12),
                            )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: alertColor,
                            content: Text(
                              'Has been removed from the WishList',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle.copyWith(fontSize: 12),
                            )));
                      }
                    },
                    child: Image.asset(
                      favoriteProvider.isFav(widget.product)
                          ? 'assets/buttom_love.png'
                          : 'assets/buttom_love1.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),
            //price
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: EdgeInsets.only(
                  top: 20, right: defaultMargin, left: defaultMargin),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ],
              ),
            ),
            //deskripsi
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Fimiliar Shoes',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: familiarshoes.map((image) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0),
                        child: familarShoeshCard(image),
                      );
                    }).toList()),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailChatPage(widget.product)));
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/buttom_chat.png'))),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartProvider.addCart(widget.product);
                          showDialogChart();
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor6,
        body: ListView(
          children: [
            header(),
            kontent(),
          ],
        ));
  }
}
