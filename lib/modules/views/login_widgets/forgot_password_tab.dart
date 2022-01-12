part of '../login_screen.dart';

class _ForgotPassword extends StatelessWidget {
  final TabController tabController;
  final AuthService authService;

  _ForgotPassword(this.authService, this.tabController, {Key? key})
      : super(key: key);
  final email = TextEditingController();
  final pass = TextEditingController();
  final _isLoading = StateProvider((ref) => false);
  final _fomKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: Colors.grey[800],
            ),
          ),
        ),
        TextFormField(
          key: _fomKey,
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
        SizedBox(
          width: double.infinity,
          child: Consumer(
            builder: (context, ref, child) {
              final isLoggingIn = ref.watch(_isLoading);

              if (isLoggingIn)
                return Center(child: CircularProgressIndicator());
              return TextButton(
                child: Text('Send code to email'),
                onPressed: () {
                  onButtonClick(context, ref);
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        // Center(
        //   child: MouseRegion(
        //     cursor: SystemMouseCursors.click,
        //     child: GestureDetector(
        //       onTap: widget.onLoginClick,
        //       child: Text(
        //         'Already have an account?',
        //         style: TextStyle(
        //           color: Colors.blue,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void onButtonClick(BuildContext context, WidgetRef ref) async {
    if (!_fomKey.currentState!.validate()) return;

    final prov = ref.read(_isLoading.state);

    prov.state = true;

    final res = await authService.forgotPassword(email.text);

    prov.state = false;
    if (res is! ApiResponseSuccess)
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
                'An error has occured [' + res.runtimeType.toString() + ']'),
            backgroundColor: Colors.red,
          ),
        );
    else {
      await showDialog(
          builder: (context) {
            return AlertDialog(
              title: Text('Email Sent!'),
              content: Text(
                  'Kindly check your email and follow the instruction given. Thankyou!'),
              actions: [
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
          context: context);
      tabController.animateTo(0);
    }
  }
}
