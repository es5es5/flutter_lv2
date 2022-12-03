import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/component/custom_text_form_field.dart';

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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              hintText: '이메일을 입력해주세요.',
              errorText: 'Error!',
              autofocus: false,
              onChanged: (String value) {},
            ),
            CustomTextFormField(
              hintText: '비밀번호를 입력해주세요.',
              errorText: 'Error!',
              obscureText: false,
              autofocus: false,
              onChanged: (String value) {},
            )
          ],
        ),
      ),
    );
  }
}
