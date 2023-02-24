import 'package:finalproject/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'appdrawer.dart';

import 'current_location_screen.dart';
import 'matches.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isfav=false;
  bool isfav2=false;
  bool isfav3=false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,

          elevation: 10,
          backgroundColor: Colors.green,
          title: Text(
            "الصفحة الرئيسية ",
          ),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => a()
                      ));},
                    child: Stack(
                      children: [
                          ClipRRect(
                             borderRadius: BorderRadius.circular(10),
                               child: Image.asset('assets/images/imgstad.jpg',
                                 fit: BoxFit.cover,
                                 width: 340,
                                 height: 160,
                               )),
                        Positioned(
                          bottom: 5,
                            //right: 10,
                            child:  Container(
                              color: Colors.black38,
                              width: 350,
                              child: Row(
                          children: [
                              IconButton(
                                onPressed: (){},
                                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                              SizedBox(width: 70,),
                              Text('الملاعب',style: TextStyle(color: Colors.white,fontSize: 30),),

                          ],
                        ),
                            ))

                      ],

                    ),
                  ),
                  SizedBox(height: 20,),
                  Stack(
                    children: [
                      InkWell(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const matches()));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/matches3.jpg',
                              fit: BoxFit.cover,
                              width: 340,
                              height: 160,
                            )),
                      ),
                      Positioned(
                          bottom: 5,
                          //right: 10,
                          child:  Container(
                            color: Colors.black38,
                            width: 350,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (
                                          context) => const matches()));
                                    },
                                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                                SizedBox(width: 70,),
                                Center(
                                  child: Text('المباريات',style: TextStyle(color: Colors.white,fontSize: 30),),
                                ),

                              ],
                            ),
                          ))

                    ],

                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/football4.jpg',
                              fit: BoxFit.cover,
                              width: 340,
                              height: 160,
                            )),
                        Positioned(
                            bottom: 5,
                            //right: 10,
                            child:  Container(
                              color: Colors.black38,
                              width: 350,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: (){},
                                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                                  SizedBox(width: 70,),
                                  Text('التحديات',style: TextStyle(color: Colors.white,fontSize: 30),),

                                ],
                              ),
                            ))

                      ],

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar:  Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const ProfileScreen()));
                    },
                    icon: Icon(Icons.person,color: Colors.green,)
                ),
                IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => HomeScreen()));
                    },
                  icon: Icon(Icons.home,color: Colors.green,)),

                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => matches()));

                  },
                  icon: Icon(Icons.directions_run,color: Colors.green,),),

                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.stadium,color: Colors.green,),),

              ],
            ),
          ),

      ),
    );
  }
}
