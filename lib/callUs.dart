import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'appdrawer.dart';


class Call extends StatefulWidget {
  const Call({Key? key, required  Call}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}
class _CallState extends State<Call> {
 late String  Name;
  late String  Email;
  late  String Massage;
  Future SingIn() async{
    adduser(
      Name,
      Email,
      Massage,
    );
  }

  Future adduser(String Name,String Email, String Massage) async{
    await FirebaseFirestore.instance.collection('call').add({
      'Name':Name,
      'Email':Email,
      'Massage':Massage
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      appBar: AppBar(
          centerTitle: true,
          title: const Text("اتصل بنا"),
          backgroundColor:  Colors.green,


      ),
      body:SingleChildScrollView(

        child: Column(
          children: [


            const SizedBox(height: 50,),
            Center(
              child: SizedBox(
                width: 310,

                child: Column(

                  children: [
                    TextField(
                      textAlign: TextAlign.right,
                    /*  onChanged: (value) {
                        Name = value;

                       },*/
                      style: const TextStyle(
                        fontSize: 16.0,

                      ),

                      decoration:  InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Color(0xffBFBFBF)),

                        ),
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Color(0xffBFBFBF)),


                        ),


                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: Color(0xff9B9B9B)),
                        hintText: 'الاسم',
                        hintStyle: const TextStyle(color: Color(0xff9B9B9B) ),


                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      textAlign: TextAlign.right,
                      /* onChanged: (value) {
                         Email = value;

                       },*/
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 16.0,

                      ),

                      decoration:  InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Color(0xffBFBFBF)),

                        ),
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Color(0xffBFBFBF)),


                        ),


                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: Color(0xff9B9B9B)),
                        hintText: 'الايميل',
                        hintStyle: const TextStyle(color: Color(0xff9B9B9B) ),


                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      textAlign: TextAlign.right,
                     /* onChanged: (value) {
                        Massage = value;

                              },*/
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 16.0,

                      ),

                      decoration:  InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 100,horizontal: 30),
                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Color(0xffBFBFBF)),

                        ),
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Color(0xffBFBFBF)),


                        ),


                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(color: Color(0xff9B9B9B)),
                        hintText: 'الرساله',
                        hintStyle: const TextStyle(color: Color(0xff9B9B9B) ),


                      ),
                    ),
                    const SizedBox(height: 40,),
                    MaterialButton(
                        onPressed: (){},


                        height: 70,
                        minWidth: 320,
                        textColor: Colors.white,
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('ارسال', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                    ),


                  ],
                ),),
            ),

          ],
        ),),

      bottomNavigationBar:
     Container(
    decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    IconButton(
    onPressed: (){
    Navigator.of(context).pushReplacementNamed('/profile');
    },
    icon: const Icon(Icons.person,color: Colors.green,)
    ),
    IconButton(
    onPressed: (){
    Navigator.of(context).pushReplacementNamed('/home');
    },
    icon: const Icon(Icons.home,color: Colors.green,)),
    IconButton(
    onPressed: (){

    },
    icon: const Icon(Icons.directions_run,color: Colors.green,),),

    IconButton(
    onPressed: (){},
    icon: const Icon(Icons.stadium,color: Colors.green,),),

    ],
    ),
    ),);
  }
}