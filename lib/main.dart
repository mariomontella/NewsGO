import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page.dart';
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
      debugShowCheckedModeBanner: false, //elimina la banda "debug" in alto a destra
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF242424)),
      home: NewsScreen(),
    );
  }
}
