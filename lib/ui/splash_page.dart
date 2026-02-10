import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vas_app/domain/app_constants.dart';
import 'package:vas_app/domain/image_constants.dart';
import 'package:vas_app/ui/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: 400),
        child: Center(
          child: Column(
            children: [
              Image.asset(ImageConstants.ic_logo, width: 200, height: 200),
              SizedBox(height: 20),
              Text(AppConstants.app_name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
