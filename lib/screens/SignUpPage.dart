


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/screens/HomePage.dart';
import 'package:shop_app/screens/LoginPage.dart';


class SignUpPage extends StatefulWidget{





  @override
  SignUpPageState createState()=>SignUpPageState();
}

class SignUpPageState  extends State<SignUpPage>{

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formkey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordContoller=TextEditingController();
  final nameController=TextEditingController();

  String email;
  @override
  void initState(){
    super.initState();

    getValidationData().whenComplete(() {
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
        builder: (context) =>
            Scaffold(
             resizeToAvoidBottomInset: false,
              key: _scaffoldKey,
              body: SafeArea(
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue.shade100),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.00),
                    child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          leading: Icon(
                            Icons.arrow_back, color: Colors.deepPurple,)
                          ,
                          title: Text("hi Fix",
                            style: TextStyle(color: Colors.deepPurple),),
                          backgroundColor: Colors.transparent,),
                        SliverFillRemaining(
                          child: Container(

                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 70,),
                                  RichText(
                                    text: TextSpan(

                                        children: [
                                          TextSpan(text: 'sign In here to \n',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 28.0,
                                                  fontWeight: FontWeight.w500)),
                                          TextSpan(text: 'join new Community!',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 28.0,
                                                  fontWeight: FontWeight.w500))
                                        ]
                                    ),
                                  ),
                                  SizedBox(height: 70,),
                                  Form(
                                    key: formkey,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        TextFormField(
                                          controller: emailController,
                                          validator: MultiValidator(

                                              [
                                                RequiredValidator(
                                                    errorText: "this is required field"),
                                                EmailValidator(
                                                    errorText: "InValid Email Address")
                                              ]

                                          ),
                                          decoration: InputDecoration(
                                              hintText: "phone Number or Email",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w400)),),
                                        SizedBox(height: 20.0),
                                        TextFormField(
                                          controller: nameController,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "this is required field"),
                                            MinLengthValidator(6,
                                                errorText: "must contain atleast 6 characters"),

                                          ]),
                                          decoration: InputDecoration(
                                              hintText: "Name or Username ",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w400)),),

                                        SizedBox(height: 20.0),
                                        TextFormField(
                                          controller: passwordContoller,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "this is required field"),
                                            MinLengthValidator(6,
                                                errorText: "must contain atleast 6 characters"),

                                          ]),
                                          decoration: InputDecoration(
                                              hintText: "password",
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight
                                                      .w400)),),
                                        SizedBox(height: 50.0),
                                        GestureDetector(
                                          onTap: () {
                                            if (formkey.currentState
                                                .validate()) {
                                              formkey.currentState.reset();
                                            }
                                            else {
                                              // const alertDialog=AlertDialog(title:Text('in valid password or email'),content: Text('please fill the input field correcty'),);
                                              // showDialog(context: context,builder:(context)=>alertDialog);
                                              const snackBar = SnackBar(
                                                  content: Text(
                                                      'invalid email or password'));
                                              _scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                          child: Container(
                                            height: 60.0, width: 150,


                                            child: Align(child: Text('Sign in',
                                              style: TextStyle(
                                                  color: Colors.white),),
                                              alignment: Alignment.center,),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(15.0),
                                              color: Colors.deepPurple,
                                            ),),
                                        )

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.0,),
                                  RichText(text: TextSpan(children: [
                                    TextSpan(text: 'already have an account  ',
                                        style: TextStyle(color: Colors.black)),
                                    TextSpan(text: 'Sign in',
                                        style: TextStyle(color: Colors.black,
                                            decoration: TextDecoration
                                                .underline),
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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
  }}