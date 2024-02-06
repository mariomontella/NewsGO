class Article {
  String author = '';
  String title = '';
  String description = '';
  String url = '';
  String urlToImage = '';
  String content = '';
  
  Article ();

  Map toJson() =>
      {'author': author, 'title': title, 'description': description, 'url': url, 'urlToImage': urlToImage, 'content': content};
  
  Article.fromJson(Map<String, dynamic> json)
      : this.author = (json['author'] != null ? json['author'].toString() : ""),
        this.title = (json['title'] != null ? json['title'].toString(): ""),
         this.description = (json['description'] != null ? json ['description'].toString(): ""),
        this.url = (json['url'] != null ? json ['url'].toString(): ""),
         this.urlToImage = (json['urlToImage'] != null ? json ['urlToImage'].toString(): ""),
        
          this.content = (json['content'] != null ? json ['content'].toString(): "");
           

}