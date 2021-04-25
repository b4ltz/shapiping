import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shapiping/modules/services/auth_service.dart';
import 'package:shapiping/modules/views/login_widgets/login_tab.dart';
import 'package:shapiping/modules/views/login_widgets/register_tab.dart';

class Login extends StatefulWidget {
  static const String id = '/auth/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final authService = AuthService();

  final keyboardEvent = KeyboardVisibilityController();

  late final TabController tabController;

  bool isKbVisible = false;

  void onChangeTab(int tabIndex) {
    tabController.animateTo(tabIndex);
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    keyboardEvent.onChange.listen((event) {
      setState(() {
        isKbVisible = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (tabController.index != 0) {
          tabController.animateTo(0);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: Stack(
          children: [
            if (!isKbVisible) ...[
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.15),
                painter: _CustomPainer(Colors.teal),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Shapiping',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart,
                              size: 50,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Text(
                          'Your online basurahan shope',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.teal,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    'v1.0.0',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
            TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: LoginTab(
                    authService,
                    () => onChangeTab(1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: RegisterTab(authService, () => onChangeTab(0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomPainer extends CustomPainter {
  final Color color;

  _CustomPainer(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 15;
    final path = Path()
      ..lineTo(0, h)
      ..quadraticBezierTo(w * 0.5, h + (h * 0.5), w, h)
      ..lineTo(w, h)
      ..lineTo(w, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
