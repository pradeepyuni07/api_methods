import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/post/post_model.dart';

class ApiService {
  Future<Map<String, dynamic>> postApi(String endPoint, Post post) async {
    print("📤 postApi called: ${jsonEncode(post.toJson())}");

    final response = await http.post(
      Uri.parse("https://dummyjson.com/posts/add"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        " API Error: ${response.statusCode} ${response.reasonPhrase}",
      );
    }
  }

  Future<void> updateTitle(String title) async {
    print("Updating title with data: ${jsonEncode({'title': title})}");


    final response = await http.put(
      Uri.parse("https://dummyjson.com/posts/1"),
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
}
