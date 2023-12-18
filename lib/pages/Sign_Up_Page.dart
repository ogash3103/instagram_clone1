import 'package:flutter/material.dart';
import '../services/utils_service.dart';
import 'HomePage.dart';
import 'Sign_In_Page.dart';

class SignUp extends StatefulWidget {
  static const String id = "singUp_page";
  const SignUp({ Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var isLoading = false;
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cPasswordController = TextEditingController();

  _doSignUp(){
    String fullName = fullNameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String cPassword = cPasswordController.text.toString().trim();
    if(fullName.isEmpty || email.isEmpty || password.isEmpty) return;

    if(cPassword != password){
      Utils.fireToast("Password and confirm password does not match!");
      return;
    }
    Navigator.pushReplacementNamed(context, HomaPage.id);
  }
  _callSignInPage(){
    Navigator.pushReplacementNamed(context, SignIn.id);
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
                Color.fromRGBO(253, 29, 29, 1),
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
                  //#Fullname
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: fullNameController,
                      style: const TextStyle(
                        color: Colors.white,),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white54),
                        hintText: "Full Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  //#Email
                  Container(
                    margin: EdgeInsets.only(top: 10),
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
                  //#cPassword
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: cPasswordController,
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.white,),
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white54),
                        hintText: "Confirm Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),


                  //#SignIn
                  GestureDetector(
                    onTap: (){
                      _doSignUp();
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
                        child: Text("Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // #signInTextBtn
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Text("Already have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 16),),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      _callSignInPage();
                    },
                    child: const Text("Sign In",
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
