import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/HomePage.dart';
import 'package:instagram_clone/pages/Sign_In_Page.dart';

class SplashPages extends StatefulWidget {
  static const String id = "splash_page";
  const SplashPages({ Key? key}) : super(key: key);

  @override
  State<SplashPages> createState() => _SplashPagesState();
}

class _SplashPagesState extends State<SplashPages> {

  @override
  void initState() {
    super.initState();
    _initTimer();
  }
  _initTimer(){
    Timer(Duration(seconds: 2), (){
      _callSignInPage();
    });
  }
  _callSignInPage(){
    Navigator.pushReplacementNamed(context, SignIn.id);
  }

  _callHomePage(){
    Navigator.pushReplacementNamed(context, HomaPage.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration:const  BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Center(
                  child: Text("Instagram",
                    style: TextStyle(color: Colors.black,
                        fontSize:45, fontFamily: "Billabong" ),),
                ),
            ),
            Text("All rights reserved,",
              style: TextStyle(color: Colors.white, fontSize: 16 ),),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
