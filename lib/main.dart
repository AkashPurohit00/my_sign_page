import 'package:flutter/material.dart';
import 'Signup.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  GlobalKey<FormState> _formKey=GlobalKey();




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFEED4FF),
      ),



      home: SignupPage(),
      debugShowCheckedModeBanner:false ,
    );
  }
}


