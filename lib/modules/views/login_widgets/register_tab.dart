part of '../login_screen.dart';

class _RegisterTab extends StatefulWidget {
  final AuthService authService;

  final VoidCallback onLoginClick;

  _RegisterTab(this.authService, this.onLoginClick, {Key? key})
      : super(key: key);

  @override
  __RegisterTabState createState() => __RegisterTabState();
}

class __RegisterTabState extends State<_RegisterTab> {
  final _isLoading = StateProvider((ref) => false);

  final email = TextEditingController(text: '');

  final pass = TextEditingController(text: '');

  final conpass = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();

  void _onRegister(WidgetRef ref) async {
    final state = formKey.currentState;
    if (state == null) return;

    if (!state.validate()) return;

    // ref.read(_isLoading) = true;

    final prov = ref.read(_isLoading.state);
    prov.state = true;
    final result = await widget.authService.register(email.text, pass.text);
    prov.state = false;
    final message =
        result.hasError ? '${result.error}' : 'Registered successfully';
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
    widget.onLoginClick();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
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
                ),
                SizedBox(height: 10),
                SizedBox(width: double.infinity),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
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
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
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
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final isLoggingIn = ref.watch(_isLoading);

                        if (isLoggingIn)
                          return Center(child: CircularProgressIndicator());
                        return TextButton(
                          child: Text('Register'),
                          onPressed: () => _onRegister(ref),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
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
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Register via:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // MouseRegion(
                    //   cursor: SystemMouseCursors.click,
                    //   child: GestureDetector(
                    //     // onTap: () => widget.onRegisterClick(),
                    //     child: Material(
                    //       elevation: 1,
                    //       color: Colors.teal,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(50)),
                    //       child: SizedBox(
                    //         height: 40,
                    //         width: 40,
                    //         child: Icon(
                    //           Icons.alternate_email,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(width: 20),
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
          ),
        ),
      ),
    );
  }
}
