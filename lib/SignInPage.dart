import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signinform/SignUp.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible=false;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open,
              size: 100,
            ),
            Text('Welcome back', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                decoration: InputDecoration(

                  border: OutlineInputBorder(),
                  hintText: "enter your email",
                  prefixIcon: Icon(Icons.email, color: Colors.black,)
                ),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField (
                obscureText: passwordVisible,
                textAlign: TextAlign.center,
                controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  hintText: "enter your password",
                prefixIcon: Icon(Icons.lock, color: Colors.black,),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  ),
                ),

              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("you are new?"),
                TextButton(
                  child: Text("SIGN UP", style: TextStyle(color: Colors.red),),
                  onPressed: (){
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                child: MaterialButton(
                  child: Text("Log in ", style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: (){},
                ),
                color: Colors.blue,
                width: 250,
              ),
            )
          ],
        ),
      ),
    );
  }
}
