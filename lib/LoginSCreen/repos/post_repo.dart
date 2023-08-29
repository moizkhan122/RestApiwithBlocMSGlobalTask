
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_application_1/feature/post/PostDataModel/PostDataModel.dart';

class UsersRepo {
  static Future<List<PostUiDataModel>> fetchingData() async {
      var client = http.Client();
    List<PostUiDataModel> posts = [];
try {
  var response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'));
      List result = jsonDecode(response.body.toString());
      for (var i = 0; i < result.length; i++) {
        PostUiDataModel post = PostUiDataModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
      }
       catch(e){
        log(e.toString());
        return posts;
      }
  }
}