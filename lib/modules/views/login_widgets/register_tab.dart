import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shapiping/modules/services/auth_service.dart';
import 'package:shapiping/utils/helpers/validators.dart';

class RegisterTab extends StatefulWidget {
  final AuthService authService;

  final VoidCallback onLoginClick;

  RegisterTab(this.authService, this.onLoginClick, {Key? key})
      : super(key: key);

  @override
  _RegisterTabState createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final _isLoading = StateProvider((ref) => false);

  final email = TextEditingController(text: '');

  final pass = TextEditingController(text: '');

  final conpass = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();

  void _onRegister(BuildContext context) async {
    final state = formKey.currentState;
    if (state == null) return;

    if (!state.validate()) return;

    context.read(_isLoading).state = true;
    final result = await widget.authService.register(email.text, pass.text);
    context.read(_isLoading).state = false;
    final message =
        result.hasError ? '${result.error}' : 'Registered successfully';
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
    widget.onLoginClick();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.grey[800],
              ),
            ),
          ),
          TextFormField(
            controller: email,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: Validators.email,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              hintText: 'Enter your email address',
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10),
          SizedBox(width: double.infinity),
          TextFormField(
            controller: pass,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: Validators.password,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              hintText: 'Enter your password',
              border: UnderlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: conpass,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (s) {
              final initial = Validators.password(s);

              if (initial != null) return initial;

              if (conpass.text != pass.text) return 'Password mismatch';

              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
              hintText: 'Confirm your password',
              border: UnderlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Consumer(
              builder: (context, watch, child) {
                final isLoggingIn = watch(_isLoading).state;

                if (isLoggingIn)
                  return Center(child: CircularProgressIndicator());
                return TextButton(
                  child: Text('Register'),
                  onPressed: () => _onRegister(context),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: widget.onLoginClick,
              child: Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
