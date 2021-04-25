import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/config/routes/router.dart';
import 'package:shapiping/config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppWrapper.id,
        theme: ThemeData(fontFamily: 'Poppins'),
      ),
    );
  }
}
