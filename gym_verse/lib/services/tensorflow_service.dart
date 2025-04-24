import 'dart:convert';
import 'package:http/http.dart' as http;

class TensorFlowService {
  static const String _endpoint = 'http://172.20.0.193:5001/predict';

  static Future<int> predictCalories({
    required double weight,
    required double height,
    required int age,
    required int gender,
  }) async {
    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'weight': weight,
        'height': height,
        'age': age,
        'gender': gender,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['calories'] as num).toInt();
    } else {
      throw Exception('TensorFlow API error: ${response.body}');
    }
  }
}
