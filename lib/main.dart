import 'package:flutter/material.dart';
import 'package:shapiping/config/routes/router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
