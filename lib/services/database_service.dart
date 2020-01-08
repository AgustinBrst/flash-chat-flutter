import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../models/message.dart';

class Collections {
  static const messages = 'messages';
}

class DatabaseService {
  final Firestore _firestore = Firestore.instance;

  Map<String, dynamic> _mapFromMessage(Message message) {
    return {
      'senderEmail': message.senderEmail,
      'text': message.text,
    };
  }

  Future<void> sendMessage({@required String senderEmail, @required String text}) async {
    final message = Message(senderEmail: senderEmail, text: text);
    await _firestore.collection(Collections.messages).add(_mapFromMessage(message));
  }
}
