import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/config/app_dependency.dart';
import 'package:flutter_clean_architecture/constant/config_keys.dart';
import 'package:flutter_clean_architecture/data/common/module/shared_pref_module.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SharedPreferenceModule pref = AppDependencies.sl.get();

  startSplash() async {
    return Timer(Duration(seconds: 2), () {
      if (pref.getUserData().isNotEmpty) {
        Navigator.pushReplacementNamed(context, ConfigKeys.ROUTE_HOME);
      } else {
        Navigator.pushReplacementNamed(context, ConfigKeys.ROUTE_LOGIN);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Splash screen"),
      )),
    );
  }
}
