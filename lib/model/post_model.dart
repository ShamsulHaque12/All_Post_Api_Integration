class PostModel {
  final int id;
  final String title;
  final double price;
  final String image;
  String? category;

  PostModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'].toDouble() ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }
}
