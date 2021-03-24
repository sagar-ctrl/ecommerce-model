


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/screens/HomePage.dart';
import 'package:shop_app/screens/LoginSuccess.dart';
import 'package:shop_app/screens/SignUpPage.dart';

class LoginPage extends StatefulWidget{




  @override
  LoginPageState createState()=>LoginPageState();
}

class LoginPageState  extends State<LoginPage>{

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordContoller=TextEditingController();
  final String imageurl="https://st4.depositphotos.com/2419757/20285/v/1600/depositphotos_202855760-stock-illustration-business-people-and-success-vector.jpg" ;
  String email;
  @override
  void initState(){
    super.initState();

    getValidationData().whenComplete((){
      if(email !=null){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }else{
        print('i am here');
      }
    });
  }

  Future getValidationData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtemail=sharedPreferences.getString('email');
    setState(() {
      email=obtemail;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder:(context)=>Scaffold(
          resizeToAvoidBottomInset: false,

        key: _scaffoldKey,
        body: SafeArea(

          child: Container(

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: Colors.blue.shade100),
            child: Padding(
              padding: EdgeInsets.only(top: 30.00),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    leading: Icon(Icons.arrow_back,color: Colors.deepPurple,)
                    ,
                    title: Text("hi Fix",
                  style: TextStyle(color: Colors.deepPurple),),backgroundColor: Colors.transparent,),
                  SliverFillRemaining(
                    child: Container(

                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 70,),
                            RichText(
                              text: TextSpan(

                                children: [
                                  TextSpan(text:'Here To Get \n',style: TextStyle(color: Colors.black,fontSize:28.0,fontWeight: FontWeight.w500)),
                                  TextSpan(text: 'Welcome!',style: TextStyle(color: Colors.black,fontSize:28.0,fontWeight: FontWeight.w500))
                                ]
                              ),
                            ),
                            SizedBox(height: 70,),
                            Form(
                              key: formkey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    validator: MultiValidator(

                                    [RequiredValidator(errorText: "this is required field"),
                                    EmailValidator(errorText: "InValid Email Address")]

                                  ),decoration:InputDecoration(hintText: "phone Number or Email",hintStyle: TextStyle(fontWeight: FontWeight.w400)),),
                                  SizedBox(height:20.0),
                                  TextFormField(
                                    controller: passwordContoller,
                                    validator: MultiValidator([
                                    RequiredValidator(errorText: "this is required field"),
                                    MinLengthValidator(6, errorText:"must contain atleast 6 characters"),

                                  ]),decoration:InputDecoration(hintText: "password",hintStyle: TextStyle(fontWeight: FontWeight.w400)),),
                                  SizedBox(height:50.0),
                                  GestureDetector(
                                    onTap: (){

                                      if(formkey.currentState.validate()){
                                         saveData(emailController.text,passwordContoller.text,context);


                                      }
                                      else{
                                        // const alertDialog=AlertDialog(title:Text('in valid password or email'),content: Text('please fill the input field correcty'),);
                                        // showDialog(context: context,builder:(context)=>alertDialog);
                                        const snackBar=SnackBar(content: Text('invalid email or password'));
                                        _scaffoldKey.currentState.showSnackBar(snackBar);
                                      }
                                    },
                                    child: Container(height:60.0,width: 150,


                                      child: Align(child: Text('Sign in',style: TextStyle(color: Colors.white),),alignment: Alignment.center,),
                                      decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),color: Colors.deepPurple,
                                    ),),
                                  )

                                ],
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            RichText(text: TextSpan(children: [
                              TextSpan(text: 'Does not have account ',style: TextStyle(color: Colors.black)),
                              TextSpan(text: 'Sign up',style:TextStyle(color: Colors.black,decoration: TextDecoration.underline),recognizer: new TapGestureRecognizer()..onTap=(){


                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpPage()));


                              })

                            ]))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }

   saveData(email,password,BuildContext context)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("password", password);
    sharedPreferences.setString("name","Sagar");
   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSuccess()));
  }
}