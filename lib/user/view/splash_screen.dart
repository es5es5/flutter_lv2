import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/const/colors.dart';
import 'package:flutter_lv2/common/const/data.dart';
import 'package:flutter_lv2/common/layout/default_layout.dart';
import 'package:flutter_lv2/common/view/root_tab.dart';
import 'package:flutter_lv2/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // deleteToken();
    // test@codefactory.ai:testtest
    checkToken();
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accesshToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();

    try {
      final response = await dio.post(
        'http://${ip}:${port}/auth/token',
        options: Options(headers: {
          'authorization': 'Bearer $refreshToken',
        }),
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => RootTab()),
        (route) => false,
      );
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
