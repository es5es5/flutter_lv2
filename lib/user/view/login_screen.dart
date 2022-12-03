import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/component/custom_text_form_field.dart';
import 'package:flutter_lv2/common/const/colors.dart';
import 'package:flutter_lv2/common/layout/dafault_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: SafeArea(
      top: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Title(),
          _SubTitle(),
          Image.asset(
            'asset/img/misc/logo.png',
            width: MediaQuery.of(context).size.width / 2 * 1,
          ),
          CustomTextFormField(
            hintText: '이메일을 입력해주세요.',
            errorText: 'Error!',
            onChanged: (String value) {},
          ),
          CustomTextFormField(
            hintText: '비밀번호를 입력해주세요.',
            errorText: 'Error!',
            obscureText: true,
            onChanged: (String value) {},
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
              child: Text('로그인')),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(primary: Colors.black),
              child: Text('회원가입')),
        ],
      ),
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
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
    return Text('이메일과 비밀번호를 입력해주세요!\n오늘도 성공적인 주문이 되길 :3',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: BODY_TEXT_COLOR,
        ));
  }
}
