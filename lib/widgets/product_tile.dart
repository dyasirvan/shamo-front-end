import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/utils/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(productModel),));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  productModel.galleries![0].url ?? "",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.category!.name ?? "",
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  productModel.name ?? "",
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 6,
                ),
                Text('\$${productModel.price}', style: priceTextStyle.copyWith(fontWeight: medium),)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
