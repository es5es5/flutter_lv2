import 'package:flutter/material.dart';
import 'package:flutter_lv2/user/view/login_screen.dart';
import 'package:flutter_lv2/user/view/splash_screen.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      home: SplashScreen(),
    );
  }
}
