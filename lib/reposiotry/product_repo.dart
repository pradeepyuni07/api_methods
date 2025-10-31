import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:api_app/exception/app_exceptions.dart';
import 'package:http/http.dart' as http;

import '../model/product.dart';

class ProductRepo {
  static Future<List<Product>> getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        final List<dynamic> decodedList = res['products'];
        final List<Product> productList = decodedList
            .map((e) => Product.fromJson(e))
            .toList();
        return productList;
      } else {
        // Throw your custom exception if status code isn't 200

        throw FetchDataException(
          'Error occurred while communicating with server. StatusCode: ${response.statusCode}',
        );
      }
    } catch (e) {
      print(e);
      throw FetchDataException('Unexpected error: $e');
    }
  }
}
