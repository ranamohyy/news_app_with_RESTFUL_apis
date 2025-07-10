class NewsHomeModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;
  NewsHomeModel({this.status, this.totalResults, this.articles});
  factory NewsHomeModel.fromJson(Map<String, dynamic> json) => NewsHomeModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Articles>.from(
                json["articles"]!.map((x) => Articles.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson()))
      };
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Articles(
      {this.author,
      this.content,
      this.source,
      this.title,
      this.description,
      this.urlToImage,
      this.publishedAt});
  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"],
        source: json['source'] == null ? null : Source.fromJson(json['source']),
      );
  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
        "source": source?.toJson()
      };
}

class Source {
  String id;
  String name;
  Source({required this.id, required this.name});
  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
