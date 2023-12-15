import 'package:flutter/material.dart';

class TextComposerWidget extends StatelessWidget {
  final bool isListening;
  final Function() listen;
  final TextEditingController textController;
  final Function() handleSubmitted;

  const TextComposerWidget({
    Key? key,
    required this.isListening,
    required this.listen,
    required this.textController,
    required this.handleSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            InkWell(
              onTap: listen,
              child: CircleAvatar(
                child: Icon(isListening ? Icons.stop : Icons.mic),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                controller: textController,
                onSubmitted: (v) {
                  handleSubmitted();
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: handleSubmitted,
            ),
          ],
        ),
      ),
    );
  }
}
