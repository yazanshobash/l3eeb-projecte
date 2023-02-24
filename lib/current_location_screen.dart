


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Done.dart';

import 'appdrawer.dart';

class a extends StatefulWidget {
  const a({Key? key}) : super(key: key);

  @override
  State<a> createState() => _aState();
}
class _aState extends State<a> {

  String?  namestudio;
  String?   email;
  int ?  phone;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Future getName() async {
    String uid =  FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users').doc(uid).get().then((DocumentSnapshot ds) {
      email = ds['email'];
      phone = ds['phoneNumber'];
    });

    sendDate();

  }

 Future sendDate() async{

    add(
      namestudio!,
      email!,
      phone!,
      date!.toString(),
        time!.toString()

    );

  }

  Future add(String namestudio,String email, int phone,String date,String time) async{
    await FirebaseFirestore.instance.collection('namestudio').add({
      'Name':namestudio,
      'Email':email,
      'Massage':phone,
      'date':date,
      'time':time
    });
    print(namestudio);
    print(email);
    print(phone);
    print(date);
    print(time);
  }

  Completer<GoogleMapController> _controller = Completer();


  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 15,
  );




  final List<Marker> _markers = <Marker>[];


  final List<LatLng> _latLen = <LatLng>[

    LatLng(31.98392744781457, 35.90871861897192),


  ];

  @override
  void initState() {

    super.initState();

    loadData().whenComplete(() {
      setState(() {});
    });

  }



  loadData() async{
    for(int i=0 ;i<2; i++){


      _markers.add(
          Marker(

            markerId: MarkerId(i.toString()),

           onTap:(){
             namestudio = "ملاعب كلية التربية الرياضية";
           },
            // given position
            position: _latLen[i],
            infoWindow: InfoWindow(

              title: 'ملاعب كلية التربية الرياضية',
            ),
          )
      );
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,


        backgroundColor: Colors.green,

        title: const Text("حدد الملعب"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(left: 55),
                    onPressed: () {

                      showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100))

                          .then((value) {
                        setState(() {
                          date = value!;
                        });
                      });
                    },
                    icon: const Icon(Icons.date_range,size: 35.0),color: const Color(0xff8ECE54),),
                  const SizedBox(width: 15,),
                  IconButton(
                    padding: const EdgeInsets.only(right: 55),
                    onPressed: () {

                      showTimePicker(context: context, initialTime: time!)
                          .then((value) {
                        setState(() {
                          time = value!;
                        });
                      });
                    },
                    icon: const Icon(Icons.access_time_sharp,size: 35.0,),color: Colors.green,),
                ],
              ),
              SizedBox(
                height: 512,

                child: GoogleMap(
                    initialCameraPosition: _kGoogle,
                    markers: Set<Marker>.of(_markers),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (GoogleMapController controller){
                      _controller.complete(controller);
                    },
                  ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton:  Padding(
        padding: const EdgeInsets.only(right: 85.0),
        child: MaterialButton(
            onPressed: (){ getName().whenComplete(() {
              setState(() {});
            });
              Navigator.push(context, MaterialPageRoute(builder: (
                context) =>  Done(Done: null,)));},
            height: 50,
            minWidth: 100,
            textColor: Colors.white,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Text('اتمام عملية الحجز', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ),
      ),


    );
  }
}