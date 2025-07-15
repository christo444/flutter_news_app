import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news_model/news_model.dart';

class NewsApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String _apiKey = 'fcdb78e08f43409ea06f0df045f39bc9';

  /// Fetch top headlines by country and category
  Future<NewsModel> fetchNews({String country = 'us'}) async {
    final url = Uri.parse('$_baseUrl?country=$country&category=technology');

    final response = await http.get(
      url,
      headers: {
        'X-Api-Key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      print("RESPONSE JSON: ${response.body}"); // for debugging
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      return NewsModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load news. Status Code: ${response.statusCode}');
    }
  }
}


