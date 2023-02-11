import 'dart:async';
import 'package:camerapicker/homescreen.dart';
import 'package:camerapicker/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Splashhhh extends StatefulWidget {
  const Splashhhh({Key? key}) : super(key: key);

  @override
  State<Splashhhh> createState() => _SplashhhhState();
}

class _SplashhhhState extends State<Splashhhh> {
  @override
  void initState(){
    navtowhere();
  }
  void navtowhere()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    bool? login=await prefs.getBool("Login");
    Timer(Duration(seconds: 4), () {
      if(login==false||login==null)
      {
        Get.off(LoginScreen());

      }
      else{
        Get.off(HomeScreen());
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Splashhhh",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );


  }
}
