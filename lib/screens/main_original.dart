import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NewsGo'),
        ),
        drawer: Drawer(

        ),
        body: const NewsScreen(),
      ) 
    );
  }
}
