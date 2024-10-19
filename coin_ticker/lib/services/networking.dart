import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    // Specify return type for clarity.
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Directly return the decoded JSON.
    } else {
      print(
          'Request failed with status: ${response.statusCode}'); // Enhanced error message.
      // Consider throwing an exception here to handle errors explicitly.
      // For example: throw Exception('Failed to load data');
      return null; // Return null to indicate failure.
    }
  }
}
