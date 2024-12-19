import 'package:flutter/material.dart';
import 'package:petshop/model/loginModel/register.dart';
import 'package:petshop/services/userlogin/servicesuser.dart';
import 'package:petshop/view/homepage/homepage.dart';
import 'package:petshop/view/signUp/signup.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: username,
            decoration:
                InputDecoration(hintText: 'name', border: OutlineInputBorder()),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
                hintText: 'password', border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: () {
                UserServices ser = UserServices();
                final saveLogin =
                    LoginUser(password: password.text, username: username.text);
                ser.lognuser(saveLogin);
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => HomePage()));
              },
              child: Text('login')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Signup()));
              },
              child: Text('go to login nnn')),
        ],
      ),
    );
  }
}
