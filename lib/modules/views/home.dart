import 'package:flutter/material.dart';
import 'package:shapiping/modules/services/firebase_service.dart';

class Home extends StatelessWidget {
  static const String id = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthService().signOut();
        },
      ),
    );
  }
}
