import 'dart:convert';
import 'dart:io';

import 'package:api_app/core/constants/api_key_constants.dart';
import 'package:api_app/data/models/image_upload.dart';
import 'package:http/http.dart' as http;

import '../../data/models/product.dart';
import '../../exception/app_exceptions.dart';

class ApiHttp {
  //postApi
  static Future<Map<String, dynamic>> postApi(
    String endPoint, {
    Map<String, dynamic>? bodyParams,
  }) async {
    final response = await http.post(
      Uri.parse(endPoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(bodyParams),
    );
    //
    // print("Response status: ${response.statusCode}");
    // print("Response body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        " API Error: ${response.statusCode} ${response.reasonPhrase}",
      );
    }
  }

  //updateTitle
  static Future<void> updateTitle(String endPoint, String title) async {
    print("Updating title with data: ${jsonEncode({'title': title})}");

    final response = await http.put(
      Uri.parse(endPoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title}),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(' Post updated successfully: $responseData');
    } else {
      print(" Failed to update post. Status Code: ${response.statusCode}");
    }
  }


  //imageUpload
  static Future<ImageUpload?> uploadImage(
    String url,
    String type,
    File file,
  ) async {
    try {
      var request = http.MultipartRequest(type,Uri.parse(url));
      request.files.add(
        await http.MultipartFile.fromPath(ApiKeyConstants.file, file.path),
      );
      // print(request.runtimeType);

      var response = await request.send();

      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        print("result......${result}");
        return ImageUpload.fromJson(jsonDecode(result));
      } else {
        print("response code........${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("error.....$e");
    }

    return null;
  }




  //getApi
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
