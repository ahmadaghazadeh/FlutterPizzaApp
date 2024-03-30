import 'package:flutter/cupertino.dart';

class LoginBodyTitle extends StatelessWidget {
  const LoginBodyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Recipe Book",
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}
