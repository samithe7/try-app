import 'package:flutter/material.dart';
import 'package:http_app/assets/colorx.dart';
import 'package:http_app/assets/textx.dart';
import 'package:http_app/model/news_model.dart';
import 'package:http_app/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsmodel;
  @override
  void initState() {
    _newsmodel = ApiM().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextX.homeAppBarText),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsmodel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  var artical = snapshot.data.articles[index];
                  return Container(
                    height: 100,
                    color: ColorX.hContainerColor,
                    child: Row(children: [
                      Card(  clipBehavior: Clip.antiAlias, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)), child: AspectRatio(  aspectRatio: 3,child: Image.network(artical.urlToImage, fit: BoxFit.cover,)))
                    ],),
                  );
                },
                itemCount: snapshot.data.articles.length,
              );
            } else {
              return Text('connect to internet');
            }
          },
        ),
      ),
    );
  }
}
