import 'dart:io';

import 'package:api_app/core/constants/api_http_methods.dart';
import 'package:api_app/core/constants/api_key_constants.dart';
import 'package:api_app/core/constants/api_urls.dart';
import 'package:api_app/data/models/image_upload.dart';

import '../models/post_model.dart';
import '../models/product.dart';

class ApiMethods {
  //createUser
  static Future<Post?> createUser({Map<String, dynamic>? bodyParams}) async {
    print("createUser called");
    final response = await ApiHttp.postApi(
      ApiUrls.endPointOfPost,
      bodyParams: bodyParams,
    );
    return Post.fromJson(response);
  }

  //getTitle
  static Future<void> getTitle(String title) async {
    final result = await ApiHttp.updateTitle(
      ApiUrls.endPointOfUpadateUser,
      title,
    );
  }

  //getUrl
  static Future<List<Product>> getApiUrl(String url) async {
    final result = await ApiHttp.getApi(url);
    return result;
  }

  //imageUplaod
  static Future<ImageUpload?> getImageUrl(File file) async {
    final response = await ApiHttp.uploadImage(
      ApiUrls.endPointOfFile,
      ApiKeyConstants.MultipartRequestType,
      file,
    );

    print("RESPONSE......... $response");

    return response;
  }
}
