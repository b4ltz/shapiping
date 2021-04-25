import 'package:flutter/material.dart';
import 'package:shapiping/const/text_style.dart';
import 'routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == AppWrapper.id)
      return MaterialPageRoute(builder: (_) => AppWrapper());
    else if (settings.name == Home.id)
      return MaterialPageRoute(builder: (_) => Home());
    else if (settings.name == Login.id)
      return MaterialPageRoute(builder: (_) => Login());
    return MaterialPageRoute(builder: (_) => _Default(settings.name!));
  }
}

class _Default extends StatelessWidget {
  final String _routeName;

  const _Default(String routeName, {Key? key})
      : _routeName = routeName,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page not found'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '"$_routeName" not found',
                style: kHeadline,
                textAlign: TextAlign.center,
                textScaleFactor: 1.5,
              ),
            ),
            Center(child: Text('😟', style: kSuperBigText)),
          ],
        ),
      ),
    );
  }
}
