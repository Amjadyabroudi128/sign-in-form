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
  bool _validate = false;


  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/flutter.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_open,
              size: 100,
              color: Colors.white,
            ),
            Text('Welcome back', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  labelText: "enter your email" , labelStyle: TextStyle(color: Colors.white),
                    errorText: _validate ? "email can't be empty": null,
                  prefixIcon: Icon(Icons.email, color: Colors.white,)
                ),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField (
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              obscureText: passwordVisible,
                controller: passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Colors.white
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                 labelText: "Password", labelStyle: TextStyle(color: Colors.white),
                errorText: _validate ? "password can't be empty": null,
                prefixIcon: Icon(Icons.lock, color: Colors.white,),
                suffixIcon: IconButton(
                  color: Colors.white,
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
                Text("you are new?", style: TextStyle(color: Colors.grey),),
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
                color: Colors.blue,
                width: 250,
                child: MaterialButton(
                  child: Text("Log in ", style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: (){
                    setState(() {
                      emailController.text.isEmpty ? _validate = true : false;
                      passwordController.text.isEmpty ? _validate = true : false;
                      clearText();
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void clearText() {
    emailController.clear();
    passwordController.clear();
  }
}