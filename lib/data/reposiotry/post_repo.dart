import 'package:api_app/data/network/api_service.dart';

import '../../model/post/post_model.dart';


class PostRepo{
  final _api_service=ApiService();

  Future<Post> createUser(int id,String title)async{
      print(".......createUser()");
    final response=await _api_service.postApi("posts/add", Post(userId:id , title: title));
     print(response);
    return Post.fromJson(response);
  }

  Future<void> getTitle(String title) async{
     final result= await _api_service.updateTitle(title);

  }
}