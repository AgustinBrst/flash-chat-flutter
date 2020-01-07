import 'package:flutter/material.dart';

import 'routing/routes.dart';
import 'routing/routes_generator.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.welcome,
      onGenerateRoute: RoutesGenerator.generateRoute,
    );
  }
}
