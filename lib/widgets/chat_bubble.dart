import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  final String imageUrl;
  final bool? isImage;
  const ChatBubble({
    super.key,
    required this.message,
    this.isImage = false,
    required this.isSender,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender) CircleAvatar(backgroundImage: AssetImage(imageUrl)),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(left: 8, right: 8, top: 15),
          decoration: BoxDecoration(
            color: isSender ? Colors.blue : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 6.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: isImage == true
              ? Image.network(message)
              : Text(
                  message,
                  style: TextStyle(
                    color: isSender ? Colors.white : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
        ),
        if (isSender) CircleAvatar(backgroundImage: AssetImage(imageUrl)),
      ],
    );
  }
}
