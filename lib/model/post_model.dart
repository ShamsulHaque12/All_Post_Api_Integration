class PostModel {
  final int id;
  final String title;
  final double price;
  final String image;


  PostModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}
