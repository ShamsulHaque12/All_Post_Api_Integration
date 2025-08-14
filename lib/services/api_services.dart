import 'dart:convert';
import 'package:apiintegration/model/post_details_model.dart';
import 'package:apiintegration/utills/api_endpoint.dart';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class ApiServices {
  static Future<List<PostModel>> fetchData() async {
    
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    
    //var response = await http.get(ApiEndpoint.allPost);

    if (response.statusCode == 200) {
      print("Success");
      final jsonData = jsonDecode(response.body);
      final allPost = jsonData as List;
      return List<PostModel>.from(
        allPost.map((post) => PostModel.fromJson(post)),
      );
    } else {
      print("Failed to load data with status code: ${response.statusCode}");
      throw Exception("Failed to load data");
    }
  }

  static Future<PostDetailsModel?> getSingleData(String id) async {
    var url = Uri.parse("https://fakestoreapi.com/products/$id");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print("Success");
      final getData = jsonDecode(response.body);
      return PostDetailsModel.fromJson(getData); // Return a single model, not a list
    } else {
      print("Failed to load data with status code: ${response.statusCode}");
      throw Exception("Failed to load data");
    }
  }

}
