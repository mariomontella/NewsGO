import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiNews {
  final String apiKey = 'Your_api_key';

  Future<List<dynamic>> fetchLatestNews() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey'),
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      return json.decode(response.body)['articles'];
    } else {
      throw Exception('Caricamento fallito');
    }
  }
}

