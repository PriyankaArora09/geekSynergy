import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var movies =
      <Map<String, dynamic>>[].obs; 

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final url = Uri.parse('https://hoblist.com/api/movieList');
    final body = {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting"
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        movies.assignAll(List<Map<String, dynamic>>.from(data['result']));
      } else {
       
        print( response.statusCode);
      }
    } catch (e) {
      // Handle exceptions
      print('Request failed with error: $e');
    }
  }
}
