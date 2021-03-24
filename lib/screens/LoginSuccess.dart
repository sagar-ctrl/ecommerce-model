

import 'package:flutter/material.dart';
import 'package:shop_app/screens/HomePage.dart';


class LoginSuccess extends StatelessWidget{
  final String imageurl="https://st4.depositphotos.com/2419757/20285/v/1600/depositphotos_202855760-stock-illustration-business-people-and-success-vector.jpg" ;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
     builder:(context)=>Scaffold(
          resizeToAvoidBottomInset: false,
       body: SafeArea(
         child: Container(
           color: Colors.blue.shade100,
           child: Padding(
             child: Container(
               width: MediaQuery.of(context).size.width,

               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30.0)),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.network(imageurl,
                     height: MediaQuery.of(context).size.width*0.7,),
                   SizedBox(height: 100,),
                   RichText(text: TextSpan(children: [
                     TextSpan(text: "Welcome Smitty \n",style: TextStyle(color: Colors.black,fontSize: 25.0,
                     fontWeight: FontWeight.w500)),
                     TextSpan(text:"Have Some Problem today ? \n Don't worry you are part of \n hi service.Let us help you",style: TextStyle(color: Colors.black54.withAlpha(80),
                     fontSize: 15.0)),
                   ]),textAlign: TextAlign.center,),
                   SizedBox(height: 100,),
                   
                   GestureDetector(
                     onTap:(){
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                     },
                     
                     child: Container(
                       height:60,
                       width: 250,
                       decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(15.0)),
                       child: Align(
                         alignment: Alignment.center,
                         child: Text("Back to Home",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
                       ),
                     ),
                     
                   ),
                 ],
               ),

             ),
          padding: EdgeInsets.only(top:30.0),)
         ),
       )

     ),


    ),
    );
  }
}