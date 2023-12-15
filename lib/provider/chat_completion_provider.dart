import 'package:chatgpt/repo/repo.dart';
import 'package:chatgpt/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatCompletionProvider extends ChangeNotifier {
  SpeechToText speechToText = SpeechToText();
  bool isListening = false;

  List<ChatBubble> chat = [];

  TextEditingController editingController = TextEditingController();
  listen() async {
    if (isListening) {
      await speechToText.stop();
      isListening = false;
      notifyListeners();
    } else {
      bool isInit = await speechToText.initialize(onStatus: (status) {
        if (status == "done") {
          isListening = false;
          notifyListeners();
        }
      });
      if (isInit) {
        isListening = true;
        notifyListeners();
        await speechToText.listen(onResult: ((result) {
          editingController.text = result.recognizedWords;
        }));
      }
    }
  }

  handleSubmitted() async {
    String text = editingController.text;
    editingController.clear();
    // api request
    if (text.isNotEmpty) {
      chat.insert(
          0,
          ChatBubble(
            imageUrl: "assets/person.png",
            isSender: true,
            message: text,
          ));
      notifyListeners();
      await chatCompletion(text);
      notifyListeners();
    }
  }
}
