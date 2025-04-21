import 'dart:convert';

import 'package:gemini/model/geminiModel.dart';
import 'package:http/http.dart' as http;

class GoogleTranslateHelper {
  Future<List<String>?> translate(String text) async {
    String link = "https://ai-translate.p.rapidapi.com/translate";
    Map m1 = {
      "texts": [
        text,
      ],
      "tl": "hi",
      "sl": "en"
    };
    var headers = {
      "Content-Type": "application/json",
      "x-rapidapi-host": "ai-translate.p.rapidapi.com",
      "x-rapidapi-key": "1b2e0515f1mshd59cac9c995b112p1c426cjsna47bedf44c2d",
    };
    http.Response response = await http.post(
      Uri.parse(link),
      headers: headers,
      body: jsonEncode(m1),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      List<String> l1 = data['texts'];
      return l1;
    }
    return null;
  }
}

class ChatGptHelper {
  static ChatGptHelper chatGptHelper = ChatGptHelper();

  Future<Geminimodel?> getChatGptResponse(String text) async {
    String link =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyAmTiktosARnphG2srriRPUQyl1OjpJh50";

    http.Response response = await http.post(
      Uri.parse(link),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": text}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Geminimodel model = Geminimodel.mapToModel(data);
      print(data);
      return model;
    }
    return null;
  }
}
