import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible=false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Signin',),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField (
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                decoration: InputDecoration(

                  border: OutlineInputBorder(),
                  hintText: "enter your email"
                ),

              ),
            ),
            SizedBox(height: 15,),
            TextField (
                obscureText: passwordVisible,
                textAlign: TextAlign.center,
                controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  hintText: "enter your password here ",
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  ),
                )
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("already sign in?"),
                TextButton(
                  child: Text("press me"),
                  onPressed: (){},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
