import 'package:flutter/material.dart';
import 'package:petshop/model/registerModel/registermodel.dart';
import 'package:petshop/services/userlogin/servicesuser.dart';
import 'package:petshop/view/homepage/homepage.dart';
import 'package:petshop/view/loginPage/loginpage.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              hintText: 'name',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: username,
            decoration: InputDecoration(
              hintText: 'username',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              hintText: 'email',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: 'password',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                UserServices ser = UserServices();

                final saveRegister = RegisterUser(
                    email: email.text,
                    name: name.text,
                    password: password.text,
                    username: username.text);

                ser.regsterUserFnc(saveRegister);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('signup')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Loginpage()));
              },
              child: Text('go to sign nnn')),
        ],
      ),
    );
  }
}
