import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shapiping/const/app_assets.dart';
import 'package:shapiping/modules/models/api_result/api_response.dart';
import 'package:shapiping/modules/services/auth_service.dart';
import 'package:shapiping/utils/helpers/validators.dart';

part 'login_widgets/login_banner.dart';
part 'login_widgets/login_tab.dart';
part 'login_widgets/register_tab.dart';
part 'login_widgets/forgot_password_tab.dart';

class Login extends StatefulWidget {
  static const String id = '/auth/login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final authService = AuthService();

  late final TabController tabController;

  void onChangeTab(int tabIndex) {
    tabController.animateTo(tabIndex);
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
            _LoginBanner(),
            TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: _LoginTab(
                    authService,
                    tabController,
                    () => onChangeTab(1),
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.all(20),
                  child: _RegisterTab(
                    authService,
                    () => onChangeTab(0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: _ForgotPassword(authService, tabController),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
