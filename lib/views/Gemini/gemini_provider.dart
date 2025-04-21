import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gemini/helper/helper.dart';
import 'package:gemini/model/geminiModel.dart';

class GeminiProvider with ChangeNotifier {
  ChatGptHelper helper = ChatGptHelper();
  List<String> getList = [];
  List<String> postList = [];
  FlutterTts tts = FlutterTts();
  bool isRight = false;
  String l = '';
  Geminimodel? model;
  String sendText = '';
  void getApi() async {
    model = await helper.getChatGptResponse(sendText);
    l = model!.candidates[0].content.parts[0].text;
    getList.add(l);
    postList.add(sendText);

    notifyListeners();
  }

  void speak(String list) async {
    await tts.speak(l);
  }

  void pause() async {
    await tts.pause();
  }

  void stop() async {
    await tts.stop();
  }
}
