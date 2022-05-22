// To parse this JSON data, do
//
//     final userInfoResponse = userInfoResponseFromJson(jsonString);

import 'dart:convert';

List<UserInfoResponse> userInfoResponseFromJson(String str) => List<UserInfoResponse>.from(json.decode(str).map((x) => UserInfoResponse.fromJson(x)));

String userInfoResponseToJson(List<UserInfoResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserInfoResponse {
  UserInfoResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) => UserInfoResponse(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}
