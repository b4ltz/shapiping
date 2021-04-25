import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/const/app_assets.dart';
import 'package:shapiping/modules/services/firebase_service.dart';

class Login extends StatelessWidget {
  static const String id = '/auth/login';

  final _isLoading = StateProvider((ref) => false);
  final email = TextEditingController(text: 'admin@shapiping.com');
  final pass = TextEditingController(text: 'admin123');
  final authService = AuthService();

  void _onSignIn(BuildContext context) async {
    context.read(_isLoading).state = true;
    final result = await authService.signIn(email.text, pass.text);
    context.read(_isLoading).state = false;

    if (!result)
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('Authentication Failed')),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.1),
            painter: _CustomPainer(Colors.teal, context),
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shapiping',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Colors.grey[800],
                      ),
                    ),
                    Text('Your online basurahan shope'),
                    SizedBox(height: 20),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                        hintText: 'Enter your email address',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                        hintText: 'Enter your password',
                        border: UnderlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: Consumer(
                        builder: (context, watch, child) {
                          final isLoggingIn = watch(_isLoading).state;

                          if (isLoggingIn)
                            return Center(child: CircularProgressIndicator());
                          return TextButton(
                            child: Text('Sign In'),
                            onPressed: () => _onSignIn(context),
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'New user? Register via:',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 1,
                          color: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.alternate_email,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Material(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image(image: AssetImage(AppAssets.fb)),
                          ),
                        ),
                        SizedBox(width: 20),
                        Material(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image(image: AssetImage(AppAssets.google)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomPainer extends CustomPainter {
  final Color color;
  final BuildContext context;

  _CustomPainer(this.color, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height, w = size.width;
    final oh = MediaQuery.of(context).size.height;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 15;
    final path = Path()
      ..lineTo(0, h)
      ..quadraticBezierTo(w + (w * .5), h + (h * 0.5), w, (oh * 1.5))
      ..lineTo(w, h)
      ..lineTo(w, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
