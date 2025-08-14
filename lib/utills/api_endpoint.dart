import 'api_config.dart';

class ApiEndpoint {
  static Uri allPost = Uri.parse("${ApiConfig.baseUrl}/products}");
  static String singlePost = "$allPost";
}