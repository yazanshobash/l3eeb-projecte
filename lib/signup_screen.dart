import 'package:finalproject/homescreen.dart';
import 'package:finalproject/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'auth_methods.dart';
import 'login_screen.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {


  String name = '';
  String email = '';
  String password = '';
  String confPass = '';
   int phone=0;
  String address = '';


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _addressController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      phoneNumber: _phoneController.text,
      address: _addressController.text,
    );

    if (res == 'success') {
      // setState(() {
      // _isLoading=false;});

      Navigator.push(context, MaterialPageRoute(builder: (
          context) => HomeScreen()));
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back, color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('حساب جديد',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Text('اشتراك',
                    style: TextStyle(fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.w800)
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        onChanged: (value) {
                          name = value;
                        },
                        validator: (val) {
                          if (val!.isEmpty || val.length<=4) {
                            return 'الرجاء ادخال اربع حروف او اكثر ';
                          }
                          return null;
                        },
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
                            hintText: 'الاسم',
                            hintStyle: TextStyle(color: Colors.green,),
                            //labelText: 'Email',
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 29, top: 20, bottom: 20),
                              child: Icon(
                                Icons.person_outline_outlined, size: 30,
                                color: Colors.green,),
                            ),
                            contentPadding: EdgeInsets.only(right: 30)
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        controller: _emailController,
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (val) {
                          if (val!.isEmpty || !val.contains('@')) {
                            return 'الرجاء ادخال البريد الالكتروني';
                          }
                          return null;
                        },
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
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 29, top: 20, bottom: 20),
                              child: Icon(Icons.email_outlined, size: 30,
                                color: Colors.green,),
                            ),
                            contentPadding: EdgeInsets.only(right: 30)
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (val) {
                          if (val!.isEmpty || val.length<=6) {
                            return ' كلمة السر 6 احرف او اكثر';
                          }
                          return null;
                        },
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
                            hintText: 'كلمة السر',
                            hintStyle: TextStyle(color: Colors.green,),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 29, top: 20, bottom: 20),
                              child: Icon(Icons.lock_outline, size: 30,
                                color: Colors.green,),
                            ),
                            contentPadding: EdgeInsets.only(right: 30)
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        controller: _phoneController,

                        validator: (val) {
                          if (val!.isEmpty || val.length==10) {
                            return 'الرجاء ادخال 10 ارقام';
                          }
                          return null;
                        },

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
                            hintText: 'رقم الهاتف',
                            hintStyle: TextStyle(color: Colors.green,),
                            //labelText: 'Email',
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 29, top: 20, bottom: 20),
                              child: Icon(Icons.phone_android, size: 30,
                                color: Colors.green,),
                            ),
                            contentPadding: EdgeInsets.only(right: 50)
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        controller: _addressController,
                        onChanged: (value) {
                          address = value;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'الرجاء ادخال الموقع';
                          }
                          return null;
                        },
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
                            hintText: 'الموقع',
                            hintStyle: TextStyle(color: Colors.green,),
                            //labelText: 'Email',
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 29, top: 20, bottom: 20),
                              child: Icon(Icons.location_on_outlined, size: 30,
                                color: Colors.green,),
                            ),
                            contentPadding: EdgeInsets.only(right: 50)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  child: Container(
                    height: 60,
                    width: 220,
                    child: !_isLoading ? Text('تسجيل الدخول',style: TextStyle(fontSize: 20,color: Colors.white),)
                        : Center(
                      child: CircularProgressIndicator(color:Colors.white),),
                    //width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),

                    ),
                  ), onTap: signUpUser,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('لديك حساب ؟', style: TextStyle(
                      fontSize: 18, color: Colors.grey[600],),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => LoginScreen()));
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
