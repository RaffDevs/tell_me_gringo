import 'Advice.dart';

class AdviceResponse {
  final Advice slip;

  AdviceResponse({required this.slip});

  factory AdviceResponse.fromJson(Map<String, dynamic> json) {
    return AdviceResponse(
      slip: Advice.fromJson(json['slip']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'advice': slip.toJson(),
    };
  }
}
