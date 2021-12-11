import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';

class WishlistProvider with ChangeNotifier{
  List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;
  set wishlist(List<ProductModel> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel model){
    if(isWishlist(model)){
      _wishlist.add(model);
    }else{
      _wishlist.removeWhere((element) => element.id == model.id);
    }

    notifyListeners();
  }

  isWishlist(ProductModel product){
    if(_wishlist.indexWhere((element) => element.id == product.id) == -1){
      return false;
    }else{
      return true;
    }
  }
}