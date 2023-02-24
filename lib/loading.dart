import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login_screen.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),opendelivery);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Image.asset('assets/images/logo1.jpg'),
                width: 300,
              ),
            ),
            SizedBox(height: 30,),

            SpinKitFadingCircle(
              color: Colors.green,
              size: 70,
            ),

          ],
        ),
      ),

    );
  }
  void opendelivery(){
    Navigator.push(context, MaterialPageRoute(builder: (
        context) => LoginScreen()));
  }
}
