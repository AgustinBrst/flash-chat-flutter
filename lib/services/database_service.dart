import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../models/message.dart';

class Collections {
  static const messages = 'messages';
}

class DatabaseService {
  final Firestore _firestore = Firestore.instance;

  Stream<List<Message>> get messagesStream async* {
    final messagesCollection = _firestore.collection(Collections.messages);
    final snapshotsStream = messagesCollection.orderBy('timestamp', descending: true).snapshots();

    await for (final snapshot in snapshotsStream) {
      List<Message> messages = [];
      for (final document in snapshot.documents) {
        final message = Message(
          senderEmail: document.data['senderEmail'],
          text: document.data['text'],
        );
        messages.add(message);
      }
      yield messages;
    }
  }

  Future<void> sendMessage({@required String senderEmail, @required String text}) async {
    final message = Message(senderEmail: senderEmail, text: text);

    await _firestore.collection(Collections.messages).add({
      'senderEmail': message.senderEmail,
      'text': message.text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
