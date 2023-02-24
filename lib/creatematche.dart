import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/appdrawer.dart';
import 'package:finalproject/matches.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Done.dart';
class create extends StatefulWidget {
  const create({Key? key}) : super(key: key);

  @override
  State<create> createState() => _createState();
}
class _createState extends State<create> {
  var selectlocation;
  DateTime date =DateTime.now();
  TimeOfDay time=TimeOfDay.now();
  String name = '';
  int _counter=0;
  void initState() {
    super.initState();
    getName();
  }
  Future sendDatetofirebase() async{
    add(
      date!.toString(),
      time!.toString(),
      _counter,
      selectlocation,
    );

  }
  Future count() async{
    int _counter;
  }

  Future getName() async {
    String uid =  FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users').doc(uid).get().then((DocumentSnapshot ds) {
      name = ds['username'];
    });

  }
  Future add(String time,String date,int _counter,String selectlocation) async{
    await FirebaseFirestore.instance.collection('creatematch').add({
      'date':date,
      'time':time,
      'counter':_counter,
      'namestd':selectlocation,
    });
    print(date);
    print(time);
    print(_counter);
    print(selectlocation);



  }

  final _maxCounter = 20;
  void _incrementCounter() {
    if(_counter == _maxCounter) {
      _showError();
      return;
    }
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    if(_counter == 0) {
      _showError();
      return;
    }
    setState(() {
      _counter--;
    });
  }
  _showError() {
    final snackBar = SnackBar(content: Text('لقد وصلت الحد الاعلى لي الاعبين'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (
              context) => const matches()));

        }, icon: Icon(Icons.arrow_back)),
        elevation: 10,
        backgroundColor: Colors.green,
        title: Text(
          "انشاء مبارة",
        ),
      ),
      body:SingleChildScrollView(
        child:  Container(
          margin: EdgeInsets.only(top: 30,left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black12,width: 3),
          ),
          width: 330,
          height: 400,
          child: Container(
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(left: 20,top: 20),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/pngwing.com.png',),
                    backgroundColor: Colors.black,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('$name')),
                SizedBox(height: 10,),
                Container(
                  child: Column(
                    children: [
                      DropdownButton(
                        hint: Text("اختر الملعب"),
                        items: [
                          "ملاعب كلية التربية الرياضية",
                        ]
                            .map((e) => DropdownMenuItem(
                          child: Text("$e"),
                          value: e,
                        ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectlocation = val!;
                          });
                        },
                        value: selectlocation,
                        icon: Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.blue,
                        ),
                        dropdownColor: Colors.green[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: date!,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100))
                                .then((value) {
                              setState(() {
                                date=value!;
                              });
                            });
                          },
                          icon: Icon(Icons.date_range)),
                      SizedBox(width: 10,),
                      Text(
                        ':التاريخ',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 145),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showTimePicker(context: context, initialTime: time!)
                                .then((value) {
                              setState(() {
                                time=value!;
                              });
                            });
                          },
                          icon: Icon(Icons.access_time_sharp)),
                      SizedBox(width: 10,),
                      Text(
                        ':الوقت',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 125),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('${_counter.toInt()}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black12
                            ),
                            child: Row(

                              children: [
                                InkWell(
                                  onTap:_incrementCounter,
                                  child: Icon(Icons.add_circle_outline,color: Colors.green,),
                                ),
                                InkWell(
                                  onTap:_decrementCounter,
                                  child: Icon(Icons.remove_circle_outline,color: Colors.green,),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'اضف عدد اللاعبين',
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      MaterialButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          onPressed: (){
                            sendDatetofirebase();
                            count();
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) =>  Done(Done: null,)));
                          },
                          child: Text('انشاء الان',style: TextStyle(color: Colors.white,fontSize: 17),)
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),

    );
  }
}