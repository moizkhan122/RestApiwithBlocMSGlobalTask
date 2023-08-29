import 'dart:convert';

List<PostUiDataModel> postUiDataModelFromJson(String str) => List<PostUiDataModel>.from(json.decode(str).map((x) => PostUiDataModel.fromJson(x)));

String postUiDataModelToJson(List<PostUiDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostUiDataModel {
    int userId;
    int id;
    String title;
    String body;

    PostUiDataModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory PostUiDataModel.fromJson(Map<String, dynamic> json) => PostUiDataModel(
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
