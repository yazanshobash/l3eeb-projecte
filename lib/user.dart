

import 'package:cloud_firestore/cloud_firestore.dart';

class User{
   String email='';
   String uid='';
   String username='';
   int phoneNumber=0;
   String address='';

  User({
    required this.email,
    required this.uid,
    required this.username,
    required this.phoneNumber,
    required this.address,
});

  static User fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      phoneNumber: snapshot['phoneNumber'],
      address: snapshot['address'],
    );
  }
  Map<String,dynamic> toJson() =>{
    'username':username,
    'uid':uid,
    'email':email,
    'phoneNumber':phoneNumber,
    'address':address,
  };
}
