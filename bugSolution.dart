```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      //Handle the JSON data appropriately. For instance:
      if(jsonData is Map<String, dynamic>){ //Checking Json type
        print(jsonData['key']);
      }
    } else {
      // Handle non-200 status codes explicitly
      throw Exception('Failed to load data: ${response.statusCode} - ${response.body}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('Error decoding JSON: $e');
    rethrow; // Re-throw to be handled at a higher level
  } catch (e) {
    // Handle other exceptions
    print('Error fetching data: $e');
    rethrow; // Re-throw to be handled at a higher level
  }
}
```