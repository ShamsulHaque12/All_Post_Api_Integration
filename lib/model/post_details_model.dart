class PostDetailsModel {
  final int? id;
  final String? title;
  final double? price;
  final String? image;
  final String? category;
  final String? description;
  final ratingModel rating;

  PostDetailsModel( {
    this.id,
    this.title,
    this.price,
    this.image,
    this.category,
    this.description,
    required this.rating,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
      description: json['description'],
      rating: ratingModel.fromJson(json['rating']),
    );
  }
}

class ratingModel {
  final double rate;
  final int count;

  ratingModel({
    required this.rate,
    required this.count,
  });

  factory ratingModel.fromJson(Map<String, dynamic> json) {
    return ratingModel(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
