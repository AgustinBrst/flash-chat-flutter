import 'package:flash_chat/models/user.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flash_chat/services/database_service.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AuthService authService = AuthService();
  final DatabaseService databaseService = DatabaseService();
  User currentUser;
  String messageText = '';

  @override
  void initState() {
    super.initState();
    initCurrentUser();
  }

  void initCurrentUser() async {
    currentUser = await authService.currentUser;
  }

  void setMessageText(String value) {
    setState(() {
      messageText = value;
    });
  }

  void sendMessage() {
    databaseService.sendMessage(
      senderEmail: currentUser.email,
      text: messageText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await authService.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: messageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: setMessageText,
                      decoration: messageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: messageText.isEmpty ? null : sendMessage,
                    child: Text(
                      'Send',
                      style: messageText.isEmpty ? disabledSendButtonTextStyle : sendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
