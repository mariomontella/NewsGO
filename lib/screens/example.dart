import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_application_1/api/api_news.dart';
import 'package:flutter_application_1/models/article.dart';
import 'package:flutter_application_1/screens/article_page.dart';
import 'package:flutter_application_1/screens/login_page.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late Future <List<dynamic>> listarticle ;



  @override
  void initState() {
    this.listarticle = Future.value([]);
    this.listarticle = ApiNews().fetchLatestNews(); 
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.grey[800],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "lib/assets/images/logodef.png",
          fit: BoxFit.contain,
          ),
        backgroundColor: Color(0xFF000000),
         iconTheme: IconThemeData(color: Colors.lightGreenAccent),
         actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // navigator => 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage())
              );
            },
          )
         ]
      ),
      body: FutureBuilder<List<dynamic>>(
        future: this.listarticle,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(padding: EdgeInsets.all(20.0), 
            child: Center (
              child:CircularProgressIndicator(),
            )
            ,);
           
          } else if (snapshot.hasError) {
            return Text('Errore: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var article = snapshot.data![index];
                Article articleobject = Article.fromJson(snapshot.data![index]);
                inspect(articleobject);
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4, //ombra
                  child: Column(
                    children: <Widget>[
                      //controllo img articolo
                      //if (article['urlToImage'] != null)
                      if (articleobject.urlToImage.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                      
                      child: Image.network(
                        articleobject.urlToImage,
                        //article['urlToImage'],
                        fit: BoxFit.cover,
                        //dimensioni
                        height: 200,
                        width: double.infinity
                      ),
                      ),
                      Container(decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black26, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    ),
                    
                  child: ListTile(
                    title: Text(
                    (articleobject.title.isNotEmpty ? articleobject.title: 'Titolo non disponibile'),
                    //article['title'] ?? 'Titolo non disponibile',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), // Applica lo stile qui
                      ),
                    subtitle: Text(
                    (articleobject.description.isNotEmpty ? articleobject.description: 'Descrizione non disponibile'),
                    style: TextStyle(color: Colors.white), // E qui
                      ),
                      onTap: () {
                      // navigator => 
                      Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) => ArticlePage(article: articleobject,))
                        );
                      },
                     // Altre proprietà del ListTile, come onTap, leading, ecc.
                    ),
                      ),
                    ],
                ),
                );
              },
            );
          } else {
            return const Text('Nessuna notizia disponibile.');
          }
        },
      ),
    );
  }
}
