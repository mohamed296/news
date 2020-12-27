class News {
  final int id;
  final String title, backposterurl, author, description, date, content, url;
  News.fromjson(dynamic json)
      : this.id = json['id'],
        this.title = json['title'],
        this.url = json['url'],
        this.backposterurl = json['urlToImage'],
        this.author = json['author'],
        this.date = json['publishedAt'],
        this.content = json['content'],
        this.description = json['description'];
}
