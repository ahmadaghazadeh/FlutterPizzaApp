import 'package:flutter/cupertino.dart';

import 'login_body_form.dart';
import 'login_body_title.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoginBodyTitle(),
        LoginBodyForm()
      ],
    );
  }
}
