import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Products.dart';
import '../model/RespUser.dart';

class Apiservice {
  final baseurl = 'https://dummyjson.com';
  
  Future<List<Products>?> getAllProducts() async {
    var response = await http.get(Uri.parse("$baseurl/products"));
    if(response.statusCode >= 200 && response.statusCode <= 299 ){
      var jsonn = jsonDecode(response.body);
      var res = RespUser.fromJson(jsonn);
      var list = res.products;
      return list;
    }
  }
}