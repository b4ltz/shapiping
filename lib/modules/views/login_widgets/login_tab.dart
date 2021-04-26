// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show document;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/const/app_assets.dart';
import 'package:shapiping/modules/services/auth_service.dart';

class LoginTab extends StatefulWidget {
  final AuthService authService;

  final Function onRegisterClick;

  LoginTab(this.authService, this.onRegisterClick, {Key? key})
      : super(key: key);

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _isLoading = StateProvider((ref) => false);

  final email = TextEditingController(text: '');

  final pass = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  void _onSignIn(BuildContext context) async {
    context.read(_isLoading).state = true;
    final result = await widget.authService.signIn(email.text, pass.text);

    if (result.hasError) {
      context.read(_isLoading).state = false;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('${result.error}')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      document.addEventListener('keydown',
          (event) => {if (event.type == 'tab') event.preventDefault()});
    }
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.grey[800],
              ),
            ),
          ),
          TextFormField(
            // TODO: Vadlidation
            controller: email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_rounded),
              contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              hintText: 'Enter your email address',
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10),
          SizedBox(width: double.infinity),
          TextFormField(
            // TODO: Vadlidation
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
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
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
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onRegisterClick(),
                  child: Material(
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
                ),
              ),
              SizedBox(width: 20),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Material(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image(image: AssetImage(AppAssets.fb)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Material(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image(image: AssetImage(AppAssets.google)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
