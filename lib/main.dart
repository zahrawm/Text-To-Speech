import 'package:chatgpt/provider/chat_completion_provider.dart';
import 'package:chatgpt/screen/chat_completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatCompletionProvider(),
      child: MaterialApp(
        home: const ChatCompletionScreen(),
      ),
    );
  }
}
