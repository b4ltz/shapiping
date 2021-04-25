import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('aa');
        },
      ),
    );
  }
}
