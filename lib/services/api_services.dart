import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class ApiServices {
  static Future<List<PostModel>?> fetchData() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Success");
      final jsonData = jsonDecode(response.body);
      return List<PostModel>.from(
        jsonData.map((post) => PostModel.fromJson(post)),
      );
    } else {
      print("Failed to load data");
      return null;
    }
  }
}
