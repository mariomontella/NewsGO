import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_news.dart';
import 'package:flutter_application_1/models/article.dart';
import 'package:flutter_application_1/screens/news_page.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: Text(
          article.title ?? 'Dettaglio News',
          style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF000000),
          iconTheme: IconThemeData(color: Colors.lightGreenAccent),
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (article.urlToImage != null)
            Container(
              margin: EdgeInsets.only(bottom: 18),
              child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0), 
              child: Image.network(
                article.urlToImage,
                fit: BoxFit.cover,
                height: 200,
              width: double.infinity,
              ),
            ),
          ),

            Text(
              article.description ?? '', 
              style:TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: Colors.white)
              ),
              SizedBox(height: 16),
              Text(
                article.content ?? '',
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
          ],
        )
      ),
    );
    

  }
}