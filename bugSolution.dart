```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse) {
        print('ID: ${item['id']}, Name: ${item['name']}');
      }
    } else {
      // Instead of a generic Exception, provide more context
      throw HttpException('HTTP request failed with status code: ${response.statusCode}, body: ${response.body}');
    }
  } on SocketException {
    // Handle socket exceptions specifically
    print('Network error: Could not connect to the server.');
  } on FormatException catch (e) {
      print('Error parsing JSON: $e');
  } catch (e) {
    // Handle other potential exceptions
    print('An unexpected error occurred: $e');
  }
}

//Custom Exception
class HttpException implements Exception{
  final String message;
  HttpException(this.message);
  @override
  String toString() => message;
}
```