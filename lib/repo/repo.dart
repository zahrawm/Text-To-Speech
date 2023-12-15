import 'dart:convert';

import 'package:chatgpt/keys.dart';
import 'package:http/http.dart' as http;

chatCompletion(String prompt) async {
  final response = await http.post(
    Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $OPENAI_API_KEY"
    },
    body: jsonEncode({
      "model": "gpt-3.5-turbo",
      "message": [
        {
          "role": "user",
          "content": prompt,
        },
      ]
    }),
  );

  print(response.body);
}
