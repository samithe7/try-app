import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_app/assets/api_x.dart';
import 'package:http_app/model/news_model.dart';

class ApiM {
  


  Future<NewsModel> getNews() async {
    var clint = Client();
    var newsModel = null;

    try {
      var rasponse =
          await clint.get('${ApiX.Main_Url}&apiKey=${ApiX.API_KEY}');

      if (rasponse.statusCode == 200) {
        var jsinString = rasponse.body;
        var jsonMap = json.decode(jsinString);
       newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
