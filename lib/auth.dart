
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'login_screen.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: StreamBuilder(
        builder:(context,snapshot) {
          // if(snapshot.connectionState==ConnectionState.waiting){
             if(snapshot.hasData){
            //   return HomeScreen();
            // }else if(snapshot.hasError){
            //   //return LoginScreen();
            //   return Center(child: Text('${snapshot.error}'),);
            // }
            return HomeScreen();
          }else{
               return LoginScreen();
             }
          // if(snapshot.connectionState== ConnectionState.waiting){
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }

        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: ((context,snapshot){
      //     if(snapshot.hasData){
      //       return  HomeScreen();
      //     }else{
      //       return Login();
      //     }
      //   }),
      // ),
    );
  }
}
