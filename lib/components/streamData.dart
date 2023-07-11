import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'messageBubble.dart';

class StreamDataWidget extends StatelessWidget {
  final currentUser;
  const StreamDataWidget({
    Key? key,
    required FirebaseFirestore firestore, required this.currentUser,
  })  : _firestore = firestore,
        super(key: key);

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore.collection('messages').orderBy('timestamp').snapshots(),

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data?.docs.reversed;
            List<MessageBubble> messageWidgets = [];
            for (var message in messages!) {
              final messageText = message['text'];
              final messageSender = message['sender'];
              final messageWidget = MessageBubble(
                isMe: currentUser.email == messageSender ? true : false,
                sender: messageSender,
                text: messageText,
              );
              messageWidgets.add(messageWidget);
            }
            return Expanded(
              child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                children: messageWidgets,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}