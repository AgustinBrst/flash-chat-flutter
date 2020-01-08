import 'package:flash_chat/routing/routes.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/button.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final AuthService authService = AuthService();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) => email = value,
              keyboardType: TextInputType.emailAddress,
              decoration: textFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: textFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Button(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: () async {
                  final newUser = await authService.createUserWithEmailAndPassword(email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, Routes.chat);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
