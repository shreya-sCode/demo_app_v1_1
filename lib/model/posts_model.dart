// import 'package:meta/meta.dart';
import 'dart:convert';

class Posts {
    final int userId;
    final int id;
    final String title;
    final String body;

    Posts({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Posts.fromRawJson(String str) => Posts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
