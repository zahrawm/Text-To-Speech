import 'package:chatgpt/provider/chat_completion_provider.dart';
import 'package:chatgpt/widgets/test_composer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatCompletionScreen extends StatelessWidget {
  const ChatCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Screen")),
      body: Consumer<ChatCompletionProvider>(builder: (context, state, _) {
        return Column(children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) {
                return state.chat[index];
              },
              itemCount: state.chat.length,
            ),
          ),
          TextComposerWidget(
              isListening: state.isListening,
              listen: state.listen,
              textController: state.editingController,
              handleSubmitted: state.handleSubmitted)
        ]);
      }),
    );
  }
}
