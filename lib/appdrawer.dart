
import 'package:finalproject/homescreen.dart';
import 'package:finalproject/profilescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'callUs.dart';
import 'login_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  
  @override
  Widget build(BuildContext context) {

    final List locale=[
      {'name':'انجليزي','locale':Locale('en','Us')},
      {'name':'عربي','locale':Locale('ar','Jo')},
    ];

    updatelanguage(Locale locale){

    }

   return Directionality(
     textDirection: TextDirection.rtl,
     child: SafeArea(
       child: Drawer(
         backgroundColor: Colors.white,
         child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8,bottom: 30),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/logo1.jpg',
                            width: double.infinity,
                          height: 185,
                          ),
                          // child: Container(
                          //   width: 160,
                          //   height: 160,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: Colors.green,),
                          //   child: Container(
                          //
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         image: DecorationImage(
                          //           image: AssetImage('assets/images/logo1.jpg',),scale: 0.8,
                          //
                          //         )
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      // DrawerHeader(
                      //   child: Text('h'),
                      //     decoration: BoxDecoration(
                      //     color: Colors.blue,
                      //     image: DecorationImage(
                      //       image: AssetImage('assets/images/logo1.jpg',),
                      //       fit: BoxFit.cover
                      //     ),
                      //   ),
                      // ),

                      ListTile(
                        leading: Icon(Icons.home,color:Colors.green[900]),
                        title: Text('الصفحة الرئيسية',style: TextStyle(fontSize: 20,color:Colors.green[900],fontWeight: FontWeight.w600)),
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => HomeScreen())
                            );
                          });
                        },
                      ),
                      //Divider(color: Colors.green[900]),

                      ListTile(
                        leading: Icon(Icons.person_sharp,color: Colors.green[900]),
                        title: Text('الصفحة الشخصية',style: TextStyle(fontSize: 20,color:Colors.green[900],fontWeight: FontWeight.w600),),
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => ProfileScreen()));
                          });
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.phone_android,color: Colors.green[900]),
                        title: Text('اتصل بنا',style: TextStyle(fontSize: 20,color:Colors.green[900],fontWeight: FontWeight.w600),),
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => Call(Call: null,)));
                          });
                        },

                      ),
                      ListTile(
                        leading: Icon(Icons.translate,color: Colors.green[900]),
                        title: Text('اللغة',style: TextStyle(fontSize: 20,color:Colors.green[900],fontWeight: FontWeight.w600),),

                        onTap: (){
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (builder){
                                  return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text('اللغة'),
                                      content: Container(
                                        width: double.maxFinite,
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index){
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(

                                                    onTap: (){
                                                      print(locale[index]['name']);
                                                      updatelanguage(locale[index]['locale']);

                                                    },
                                                    child: Text(locale[index]['name'],style:  Theme.of(context).textTheme.bodyText2,)),


                                              );
                                            },
                                            separatorBuilder: (context,index){
                                              return Divider(color: Theme.of(context).dividerColor);
                                            },
                                            itemCount: locale.length),
                                      ),
                                    ),
                                  );
                                }
                            );
                          });
                        },

                      ),
                      Divider(color: Colors.green[900]),

                      ListTile(
                        leading: Icon(Icons.logout,color: Colors.green[900]),
                        title: Text('خروج',style: TextStyle(fontSize: 20,color:Colors.green[900],fontWeight: FontWeight.w600),),
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => LoginScreen())
                            );
                          });
                        },
                      ),


                    ],
                  ),

       ),
     ),
   );

  }
}
