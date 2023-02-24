
import 'package:finalproject/homescreen.dart';
import 'package:finalproject/signup_screen.dart';
import 'package:finalproject/snackbar.dart';
import 'package:flutter/material.dart';
import 'auth_methods.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  bool _isLoading =false;
  bool _isChecked=false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  void loginUser()async{
    setState(() {
      _isLoading= true;
    });
    String res=await AuthMethods().loginUser(
        email: _emailController.text,
        password: _passwordController.text);
  if(res=='success'){
    Navigator.push(context, MaterialPageRoute(builder: (
        context) => HomeScreen()));
    
    setState(() {
      _isLoading=false;
    });
    }else{
    setState(() {
      _isLoading= false;
    });
    showSnackBar(res, context);
  }
  }
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white24,
          // leading: IconButton(
          //   onPressed: (){
          //     Navigator.pop(context);
          //   },
            // icon: Icon(
            //   Icons.arrow_back,color: Colors.black,
            // ),
          //),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('مرحبا بعودتك',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Text('تسجيل الدخول',
                    style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.w800)
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'البريد الالتكتروني',
                            hintStyle: TextStyle(color: Colors.green,),
                            //labelText: 'Email',
                            suffixIcon:Padding(
                              padding: EdgeInsets.only(left: 29,top: 20,bottom: 20),
                              child: Icon(Icons.email_outlined,size: 30,color: Colors.green,),
                            ),
                            contentPadding: EdgeInsets.only(right: 30)
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'كلمة السر',
                            hintStyle: TextStyle(color: Colors.green,),
                            //labelText: 'Email',
                            suffixIcon:Padding(
                              padding: EdgeInsets.only(left: 29,top: 20,bottom: 20),
                              child: Icon(Icons.lock_outline,size: 30,color: Colors.green,),
                            ),
                            contentPadding: EdgeInsets.only(right: 30)
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Checkbox(
                        side: BorderSide(color: Colors.green,width: 2),
                        activeColor: Colors.green,

                        value: _isChecked,
                        onChanged: (val){
                          setState(() {
                            _isChecked=val!;
                          });
                        }
                    ),
                    Text('تذكرني',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 20),),

                  ],
                ),
                SizedBox(height: 10,),
                      
                      InkWell(
                          onTap: loginUser,
                          child: Container(
                            height: 60,
                              width: 220,
                            child: !_isLoading
                                ?Text('تسجيل الدخول',style: TextStyle(fontSize: 20,color: Colors.white))
                                : Center(child: CircularProgressIndicator(color:Colors.white),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: ShapeDecoration(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              )
                            ),
                          ),
                        ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('ليس لديك حساب ؟ ',style: TextStyle(fontSize: 20,color: Colors.grey[600],),),
                    TextButton(
                         onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignScreen()));
                         },
                         child:Text(
                           'اشتراك',
                           style: TextStyle(
                               decoration: TextDecoration.underline ,
                               color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),)
                     )
                   ],
                 ),
                 SizedBox(height: 30,),
              ],
            ),
        )
        ),
      )
    );
  }
}
