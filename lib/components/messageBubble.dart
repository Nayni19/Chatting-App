import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.text, required this.sender, required this.isMe});

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            child: Text(sender, style: TextStyle(color: Colors.grey, fontSize: 13.0),),
          ),
          Material(
            elevation: 5.0,
              color: isMe? Colors.lightBlueAccent: Colors.white,
              borderRadius: isMe? BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)) : BorderRadius.only(topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '$text',
                  style: isMe? TextStyle(color: Colors.white, fontSize: 15.0) : TextStyle(color: Colors.black54),
                ),
              )),
        ],
      ),
    );
  }
}
