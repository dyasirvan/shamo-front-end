import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/utils/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cartModel;
  const CheckoutCard(this.cartModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(cartModel.product!.galleries![0].url ?? ""),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartModel.product!.name ?? "", style: primaryTextStyle.copyWith(fontWeight: semiBold), overflow: TextOverflow.ellipsis,),
                SizedBox(height: 2,),
                Text('\$${cartModel.product!.price}', style: priceTextStyle),
              ],
            ),
          ),
          SizedBox(width: 12,),
          Text('${cartModel.quantity} items', style: secondaryTextStyle.copyWith(fontSize: 12),)
        ],
      ),
    );
  }
}
