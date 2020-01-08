import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMine;

  const MessageBubble({
    @required this.sender,
    @required this.text,
    @required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            decoration: BoxDecoration(
              color: isMine ? Colors.lightBlueAccent : Colors.grey,
              borderRadius: BorderRadius.only(
                topRight: isMine ? Radius.zero : Radius.circular(20),
                topLeft: isMine ? Radius.circular(20) : Radius.zero,
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
