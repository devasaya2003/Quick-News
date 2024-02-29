class NewsListModel {

  final String name;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  NewsListModel({
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory NewsListModel.fromJson(Map<String, dynamic> json) {
    return NewsListModel(
      name: json['source']['name'] ?? "No Name",
      author: json['author'] ?? "No Author",
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      url: json['url'] ?? "No URL",
      urlToImage: json['urlToImage'] ?? "No Image",
      publishedAt: json['publishedAt'] ?? "No Date",
    );
  }
}