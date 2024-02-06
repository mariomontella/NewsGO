import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_application_1/api/api_news.dart';
import 'package:flutter_application_1/models/article.dart';
import 'package:flutter_application_1/screens/article_page.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'package:flutter_application_1/widget_components/menu.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<dynamic>> listarticle;
  int _selectedIndex = 0; // Variable to track the selected index

  @override
  void initState() {
    super.initState();
    listarticle = ApiNews().fetchLatestNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "lib/assets/images/logodef.png",
          fit: BoxFit.contain,
          height: 180,
          width: 180,
        ),
        backgroundColor: Color(0xFF000000),
        iconTheme: IconThemeData(color: Colors.lightGreenAccent),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: listarticle,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Errore: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Article article = Article.fromJson(snapshot.data![index]);
                inspect(article);
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  child: Column(
                    children: <Widget>[
                      if (article.urlToImage.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            article.urlToImage,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black26, Colors.green],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            article.title.isNotEmpty ? article.title : 'Titolo non disponibile',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            article.description.isNotEmpty ? article.description : 'Descrizione non disponibile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ArticlePage(article: article)),
                            );
                          },
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
      /* bottomNavigationBar: GNav(
        rippleColor: Colors.grey,
        hoverColor: Colors.grey,
        haptic: true,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.black, width: 1),
        tabBorder: Border.all(color: Colors.grey, width: 1),
        tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)],
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 900),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Colors.purple,
        iconSize: 24,
        tabBackgroundColor: Colors.purple.withOpacity(0.1),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: [
          GButton(
            icon: LineIcons.home,
            text: 'Home',
          ),
          GButton(
            icon: LineIcons.heart,
            text: 'Likes',
          ),
          GButton(
            icon: LineIcons.search,
            text: 'Search',
          ),
          GButton(
            icon: LineIcons.user,
            text: 'Profile',
          ), 
        ], 
      ),
      */
    ); 
  }
}
