import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  bool rememberUser= false;
  @override
  Widget build(BuildContext context) {
    myColor= Theme.of(context).primaryColor;
    mediaSize=MediaQuery.of(context).size;
    return Container(

      decoration: BoxDecoration(
        color:myColor,
        image: DecorationImage(
            image:AssetImage('assets/images/Ladki.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop)

        ),


      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top:45,child:_buildTop()),
          Positioned(bottom:0,child:_buildBottom()),
        ],),
      ),
    );
  }
  Widget _buildTop(){
    return SizedBox(
      width:mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(

            backgroundImage: AssetImage('assets/images/new.png'),
            radius: 90,
          ),





        ],
      ),
    );

  }
  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child:Card(
        shape: const RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child:Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }
  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome",style: TextStyle(
            color:Colors.deepPurple,
            fontSize: 32,
            fontWeight: FontWeight.w500
        ),),
        _buildGreyText("Create An Account",),
        const SizedBox(height:15),
        _buildGreyText(" Name"),
        _buildInputFeild(emailController),

        const SizedBox(height: 3),


        _buildGreyText("Email address"),
        _buildInputFeild(emailController),
        const SizedBox(height:3),
        _buildGreyText("Password"),
        _buildInputFeild(passwordController,isPassword: true),

        const SizedBox(height: 3),
        _buildGreyText("Phone No"),
        _BuildPhoneNo(),
        const SizedBox(height: 3),


        _buildSignupButton(),
        const SizedBox(height:3),
        _buildOtherLogin(),





      ],
    );

  }
  Widget _buildGreyText(String text){
    return Text(text,style: const TextStyle(

      color: Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: 15,



    ),
    );
  }
  Widget _buildInputFeild(TextEditingController controller,
      {isPassword=false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(

      ),

      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot(){
    return Row(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
        Row(
          children: [
            Checkbox(value: rememberUser, onChanged: (value){
              setState(() {
                rememberUser=value!;
              });
            }),
            _buildGreyText("Already Exist")
          ],
        ),

      ],
    );
  }

  Widget _buildSignupButton(){
    return ElevatedButton(onPressed: (){
      debugPrint("Email:${emailController.text}");
      debugPrint("Password:${passwordController.text}");
    },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 20,
            shadowColor: myColor,
            minimumSize: const Size.fromHeight(60)
        ),
        child:const Text("Sign Up") );
  }

  Widget _buildOtherLogin(){
    return Center(
      child: Column(
        children: [
          _buildGreyText("Or SignUp with"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/images/facebool logo.jpeg"),),
              Tab(icon: Image.asset("assets/images/google logo.jpeg"),),
              Tab(icon: Image.asset("assets/images/twitter.jpg"),),
            ],
          ),
        ],
      ),
    );
  }

Widget _BuildPhoneNo(){
    return

       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),


         child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              SizedBox(height:10),
              IntlPhoneField(
           
                decoration: InputDecoration(

           
                )
              )
            ],),
         ),
       );


}


}



