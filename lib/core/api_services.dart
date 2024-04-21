import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:posts_app/core/constants.dart';
import 'package:posts_app/post_model/posts_model.dart';

class Api_sevicees {
  static Future<List<PostsModel>?> getPosts() async {
    try{
    final url = Uri.parse(Api_constants.paresUrl + Api_constants.post);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonModel = json.decode(response.body) as List;
      List<PostsModel> posts = jsonModel.map((e) {
        return PostsModel.fromJson(e);
      }).toList();
      return posts;
    } }catch(e){
      debugPrint(e.toString());
    }
    return null;
  }
}
