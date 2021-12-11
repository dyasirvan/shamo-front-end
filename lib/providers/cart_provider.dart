import 'package:flutter/cupertino.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/product_model.dart';

class CartProvider with ChangeNotifier{
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts){
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel productModel){
    if(productExist(productModel)){
      int index = _carts.indexWhere((element) => element.product!.id == productModel.id);
      _carts[index].quantity++;
    }else{
      _carts.add(CartModel(
          id: _carts.length,
          product: productModel,
          quantity: 1));
    }

    notifyListeners();
  }

  removeCart(int id){
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id){
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id){
    _carts[id].quantity--;
    if(_carts[id].quantity == 0){
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems(){
    int total = 0;
    for(var item in _carts){
      total += item.quantity;
    }

    return total;
  }

  totalPrice(){
    double total = 0;
    for(var i in _carts){
      var price = i.product!.price;
      total += (i.quantity * price!);
    }

    return total;
  }

  productExist(ProductModel productModel){
    if(_carts.indexWhere((element) => element.product!.id == productModel.id) == -1){
      return false;
    }else{
      return true;
    }
  }
}