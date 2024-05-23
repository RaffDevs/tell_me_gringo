import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/AdviceResponse.dart';

class AdviceService {
  static const String _baseUrl = "https://api.adviceslip.com/advice";

  Future<AdviceResponse> getAdvice() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AdviceResponse.fromJson(data);
    } else {
      throw Exception("Failed to fetch advices");
    }
  }
}
