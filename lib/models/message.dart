import 'package:meta/meta.dart';

class Message {
  final String senderEmail;
  final String text;

  Message({
    @required this.senderEmail,
    @required this.text,
  });
}
