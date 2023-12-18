import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Sign_Up_Page.dart';

class SignIn extends StatefulWidget {
  static const String id = "singIn_page";
  const SignIn({ Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var isLoading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  _doSignIn(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if(email.isEmpty || password.isEmpty) return;
    Navigator.pushReplacementNamed(context, HomaPage.id);
  }
  _callSignUpPage(){
    Navigator.pushReplacementNamed(context, SignUp.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration:const  BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(64, 93, 230, 1),
                Color.fromRGBO(88, 81, 219, 1),
                Color.fromRGBO(131, 58, 180, 1),
                Color.fromRGBO(193, 53, 132, 1),
                Color.fromRGBO(225, 48, 108, 1),
                Color.fromRGBO(245, 96, 64, 1),
                Color.fromRGBO(247, 119, 55, 1),
                Color.fromRGBO(252, 175, 69, 1),
                Color.fromRGBO(255, 220, 128, 1),
              ]
          ),
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Instagram",
                    style: TextStyle(color: Colors.black,
                        fontSize:45, fontFamily: "Billabong" ),
                  ),

                  //#Email
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.white,),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white54),
                        hintText: "Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //#Password
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.white,),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white54),
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //#SignIn
                  GestureDetector(
                    onTap: (){
                      _doSignIn();
                    },
                    child:  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Center(
                        child: Text("Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      _callSignUpPage();
                    },
                    child: Text("Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 17, fontWeight:
                      FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
