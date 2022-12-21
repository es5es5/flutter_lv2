import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_lv2/common/components/custom_text_form_field.dart';
import 'package:flutter_lv2/common/const/colors.dart';
import 'package:flutter_lv2/common/const/data.dart';
import 'package:flutter_lv2/common/dio/dio.dart';
import 'package:flutter_lv2/common/layout/default_layout.dart';
import 'package:flutter_lv2/common/secure_storage/secure_storage.dart';
import 'package:flutter_lv2/common/view/root_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String username = 'test@codefactory.ai';
  String password = 'testtest';

  @override
  Widget build(BuildContext context) {
    final dio = ref.read(dioProvider);

    return DefaultLayout(
        child: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Title(),
              const SizedBox(height: 16.0),
              const _SubTitle(),
              Image.asset(
                'asset/img/misc/logo.png',
                width: MediaQuery.of(context).size.width,
              ),
              CustomTextFormField(
                initialValue: 'test@codefactory.ai',
                hintText: '이메일을 입력해주세요.',
                errorText: 'Error!',
                onChanged: (String value) {
                  username = value;
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                initialValue: 'testtest',
                hintText: '비밀번호를 입력해주세요.',
                errorText: 'Error!',
                obscureText: true,
                onChanged: (String value) {
                  password = value;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    final rawString = 'Login.. $username:$password';

                    print(rawString);
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);

                    String token = stringToBase64.encode(rawString);
                    final response = await dio.post('$API_URL/auth/login',
                        options: Options(
                            headers: {'authorization': 'Basic $token'}));

                    final refreshToken = response.data['refreshToken'];
                    final accessToken = response.data['accessToken'];

                    final storage = ref.read(secureStorageProvider);

                    await storage.write(
                        key: REFRESH_TOKEN_KEY, value: refreshToken);
                    await storage.write(
                        key: ACCESS_TOKEN_KEY, value: accessToken);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => RootTab(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
                  child: const Text('로그인')),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: const Text('회원가입')),
            ],
          ),
        ),
      ),
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다!',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('이메일과 비밀번호를 입력해주세요!\n오늘도 성공적인 주문이 되길 :3',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: BODY_TEXT_COLOR,
        ));
  }
}
