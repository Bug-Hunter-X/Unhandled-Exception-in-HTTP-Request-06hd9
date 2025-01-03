```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonResponse = jsonDecode(response.body);
      // Access data like this, assuming it is a list of maps
      for (var item in jsonResponse) {
        print('ID: ${item['id']}, Name: ${item['name']}');
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions, this is crucial
    print('Error: $e');
    // Consider rethrowing the exception or handling it appropriately based on your needs
    rethrow; //Rethrows the error for upper level handling
  }
}
```