class Post {
  int? userId;
  String? title;

  Post({this.title, this.userId});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['userId'] = this.userId;
    data['title'] = this.title;
    return data;
  }
}
