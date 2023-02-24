import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/user.dart' as model;

class AuthMethods{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<model.User> getUserDetails()async{
    User currentUser=_auth.currentUser!;
    DocumentSnapshot snap=await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }
  // signup user
Future<String> signUpUser({
    required String email,
    required String password,
   required String username,
   required String phoneNumber,
  required String address,
}) async{
   String res='Some error occurred';
   try{
     if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || phoneNumber.isNotEmpty  ){
       // register user
      UserCredential cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(cred.user!.uid);


     model.User user=model.User(
         email: email,
         uid: cred.user!.uid,
         phoneNumber: phoneNumber.length,
         username: username,
         address: address,

     );

      await _firestore.collection('users').doc(cred.user!.uid).set(
        user.toJson(),
      );

      res='success';
     }
   }


   catch(err){
     res=err.toString();
   }
   return res;
 }
 //logging in user
 Future<String> loginUser({
  required String email,
   required String password,
})async{
  String res='some error occerred';
  try{
    if(email.isNotEmpty ||password.isNotEmpty){
     await _auth.signInWithEmailAndPassword(email: email, password: password);
    res='success';
    }else{
      res='please enter all the fields';
    }
  }
  catch(err){
    res=err.toString();
  }
  return res;
 }
 Future<void> signOut()async{
    await _auth.signOut();
 }

}