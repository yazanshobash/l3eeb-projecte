import 'package:flutter/material.dart';

import 'appdrawer.dart';


class Done extends StatefulWidget {
  const Done({Key? key, required  Done}) : super(key: key);

  @override
  State<Done> createState() => _DoneState();
}
class _DoneState extends State<Done> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
          centerTitle: true,
          title: const Text("done"),
          backgroundColor: Colors.green,


      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: [
              /* const SizedBox(height: 45,),
            Container(
                height: 70,
                width: 200,

                decoration: BoxDecoration(
                  color: const Color(0xff8ECE54),
                  borderRadius: BorderRadius.circular(35),
                ),

                child: const Center(child: Text('Done', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),))
            ),*/
              const SizedBox(height: 115,),
              const Icon(Icons.done_outlined,color: Colors.green,size:170),
              Text("It's Done ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),),
              const SizedBox(height: 100,),
              MaterialButton(
                  onPressed: (){Navigator.pop(context);},
                  height: 70,
                  minWidth: 200,
                  textColor: Colors.white,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text('رجوع', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),

            ],
          ),
        ),

      ),
      bottomNavigationBar:
         Container(
          decoration: BoxDecoration(
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
                  icon: Icon(Icons.person,color: Colors.green,)
              ),
              IconButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  icon: Icon(Icons.home,color: Colors.green,)),
              IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.directions_run,color: Colors.green,),),

              IconButton(
                onPressed: (){},
                icon: Icon(Icons.stadium,color: Colors.green,),),

            ],
          ),
        ),

    );
  }
}