import 'package:flutter/material.dart';
import 'Widgets/login_body.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text("Login"),
      ),
      body: const SafeArea(child: LoginBody()),
    );
  }

}