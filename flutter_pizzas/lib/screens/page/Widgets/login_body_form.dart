import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pizzas/screens/routes/route_consts.dart';
import 'package:flutter_pizzas/services/auth_service.dart';

class LoginBodyForm extends StatefulWidget {
  const LoginBodyForm({super.key});

  @override
  State<LoginBodyForm> createState() => _LoginBodyFormState();
}

class _LoginBodyFormState extends State<LoginBodyForm> {
  final _formKey = GlobalKey<FormState>();
  String? username, password;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width *0.70,
        height: MediaQuery.sizeOf(context).height *0.30,
        child: Form(
          key: _formKey,
            child:Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: "kminchelle", //TODO: // read from SharedPresences
                  onSaved: (value){
                    setState(() {
                      username=value;
                    });
                  },
                  validator: (value) {
                    if(value==null || value.isEmpty)
                      {
                        return "Enter a username";
                      }
                    return null;
                  },
                  decoration: const InputDecoration(

                      hintText: "Username"
                  ),
                ),
                TextFormField(
                  initialValue: "0lelplR", //TODO: // read from SharedPresences
                  onSaved: (value){
                    setState(() {
                      password=value;
                    });
                  },
                  validator: (value) {
                    if(value==null || value.length<5)
                    {
                      return "Enter a password";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Password"
                  ),
                ),
                _loginBodyButton()
              ],
            )
        )
    );
  }
  Widget _loginBodyButton(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width *0.60,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false){
            _formKey.currentState?.save();
            bool result= await AuthService().login(
                username!,
                password!
            );
            print(result);
            if(!result){
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Login Failed',
                desc: 'Please try again',
                btnOkOnPress: () {
                },
              ).show();
            }else{
              Navigator.pushReplacementNamed(context, HOME_PAGE);
            }
          }
        },
        child: const Text("Login"),
      ),
    );
  }
}
