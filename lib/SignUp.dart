import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signinform/SignInPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/flutter.jpg"),
            fit: BoxFit.cover,
          ),
        ),        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 100, color: Colors.white,),
                SizedBox(height: 20,),
                Text('Register here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                SizedBox(height: 20,),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Colors.white
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                labelText: 'Enter name', labelStyle: TextStyle(color: Colors.white),
                errorText: _validate ? "you forgot to fill this ": null,
                prefixIcon: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.person, color: Colors.white,
                  ),
                ),
              ),
            ),
                SizedBox(height: 15,),
                TextFormField(
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
                      labelText: "enter your email", labelStyle: TextStyle(color: Colors.white),
                      errorText: _validate ? "email not right": null,
                      prefixIcon: Icon(Icons.email, color: Colors.white,)
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField (
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
                    labelText: "enter your password",
                    errorText: _validate ? "need a password": null,
                    labelStyle: TextStyle(color: Colors.white),
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(color: Colors.white),),
                    SizedBox(width: 15,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(30),
                        color: Colors.red,

                      ),
                      height: 40,
                      width: 100,
                      child: TextButton(
                        child: Text("LOG IN", style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) => const SignInPage()),
                          );
                        },
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30),
                      color: Colors.lightBlue,

                    ),
                    child: MaterialButton(
                      child: Text("Sign UP ", style: TextStyle(fontWeight: FontWeight.bold),),
                      onPressed: (){
                        setState(() {
                          emailController.text.isEmpty ? _validate = true : false;
                          passwordController.text.isEmpty ? _validate = true : false;
                          nameController.text.isEmpty ? _validate = true : false;
                          clearText();
                        });

                      },
                    ),
                    width: 250,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  void clearText() {
    emailController.clear();
    passwordController.clear();
  }
}
