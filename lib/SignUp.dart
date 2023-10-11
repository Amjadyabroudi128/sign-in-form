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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 100,),
                SizedBox(height: 20,),
                Text('Register here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                TextFormField(
                  key: _formKey,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: nameController,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(),
                      hintText: "e.g john",
                      prefixIcon: Icon(Icons.person, color: Colors.black,)
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "enter your email",
                      prefixIcon: Icon(Icons.email, color: Colors.black,)
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 15,),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
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
                    child: MaterialButton(
                      child: Text("Sign UP ", style: TextStyle(fontWeight: FontWeight.bold),),
                      onPressed: (){},
                    ),
                    color: Colors.lightBlue,
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
}
