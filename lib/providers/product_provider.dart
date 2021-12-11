import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/services/product_service.dart';

class ProductProvider with ChangeNotifier{
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  set products(List<ProductModel> products){
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async{
    try{
      List<ProductModel> product = await ProductService().getProduct();
      _products = product;
      products = product;
    }catch(e){
      print(e);
    }
  }
}