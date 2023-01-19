import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/detail_product.dart';
import 'package:shamo/theme.dart';

class ProductTitle extends StatelessWidget {
  final ProductModel product;
  const ProductTitle(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailProduct(product)));
      },
      child: Container(
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.galleries[0].url,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
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
                  product.category.name,
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  product.name,
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
