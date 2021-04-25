import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/config/routes/routes.dart';
import 'package:shapiping/modules/providers/auth_provider.dart';
import 'package:shapiping/modules/views/login_screen.dart';

class AppWrapper extends StatelessWidget {
  static const String id = '/';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return _Loading();
        if (snapshot.hasError) return _Error(snapshot.error!);
        return Consumer(
          builder: (context, watch, child) {
            return watch(authProvider).when(
              data: (user) {
                if (user == null)
                  return Login();
                else
                  return Home();
              },
              error: (o, s) => _Error(o),
              loading: () => _Loading(),
            );
          },
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  final Object error;

  const _Error(this.error, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('$error'),
        ),
      ),
    );
  }
}
