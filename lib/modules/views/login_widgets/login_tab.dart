part of '../login_screen.dart';

class _LoginTab extends StatefulWidget {
  final AuthService authService;
  final TabController tabController;
  final Function onRegisterClick;

  _LoginTab(this.authService, this.tabController, this.onRegisterClick,
      {Key? key})
      : super(key: key);

  @override
  __LoginTabState createState() => __LoginTabState();
}

class __LoginTabState extends State<_LoginTab> {
  final _isLoading = StateProvider((ref) => false);

  final email = TextEditingController(text: '');

  final pass = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  void _onSignIn(WidgetRef ref) async {
    if (!_formKey.currentState!.validate()) return;

    final prov = ref.read(_isLoading.state);
    prov.state = true;
    final result =
        await widget.authService.signInWithEmail(email.text, pass.text);

    if (result.hasError) {
      prov.state = false;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('${result.error}')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (kIsWeb) {
    //   document.addEventListener('keydown',
    //       (event) => {if (event.type == 'tab') event.preventDefault()});
    // }
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
            validator: Validators.email,
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
            validator: Validators.password,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  widget.tabController.animateTo(2);
                  // Navigator.of(context).pushNamed(ForgotPassword.id);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.tabController.animateTo(1);
                  // Navigator.of(context).pushNamed(ForgotPassword.id);
                },
                child: Text(
                  'New user? Register here >',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: Consumer(
              builder: (context, ref, child) {
                final isLoggingIn = ref.watch(_isLoading);

                if (isLoggingIn)
                  return Center(child: CircularProgressIndicator());
                return TextButton(
                  child: Text('Sign In'),
                  onPressed: () => _onSignIn(ref),
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
              'Login via:',
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
              //     onTap: () => widget.onRegisterClick(),
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
                  onTap: () async {
                    if (kIsWeb) {
                      // TODO:
                    } else if (Platform.isAndroid) {
                      print('here');
                      final res = await widget.authService.signInWithFb();
                      if (res is! ApiResponseSuccess) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: res is ApiResponseFail
                                  ? Text('${res.message}')
                                  : Text('${res.toString()}'),
                            ),
                          );
                      }
                    }
                  },
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
                  onTap: () async {
                    if (kIsWeb) {
                      // TODO:
                    } else if (Platform.isAndroid) {
                      print('here');
                      final res = await widget.authService.signInWithGoogle();
                      if (res is! ApiResponseSuccess) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: res is ApiResponseFail
                                  ? Text('${res.message}')
                                  : Text('${res.toString()}'),
                            ),
                          );
                      }
                    }
                  },
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
