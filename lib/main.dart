import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/HomePage.dart';

import 'package:shop_app/screens/LoginPage.dart';
import 'package:shop_app/screens/LoginSuccess.dart';

void main() {
  runApp(SplashScreen());
}

class  SplashScreen extends StatelessWidget{


  Future getValidation(BuildContext context)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtemail= sharedPreferences.getString('email');

    Navigator.push(context, MaterialPageRoute(builder: (context)=>obtemail!=null?LoginSuccess():LoginPage()));
  }
  @override
  Widget build(BuildContext context) {

     return MaterialApp(

     debugShowCheckedModeBanner: false,
       home: Builder(
         builder: (context)=>Scaffold(

          body: SafeArea(

            child: Stack(
              children: [
                Container(color: Colors.deepPurpleAccent),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Container(height: 100,width: 100,transform: Matrix4.rotationZ(0.1),
                      child:Align(
                        alignment: Alignment.center,
                        child: Text('hi',style:TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 50.0)),
                      ),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10.0)),),
                    SizedBox(height: 100.0,),
                    Container(height:200,padding:EdgeInsets.all(30),child: Align(
                      alignment: Alignment.center,
                      child: Text("Have a problem  that you can't solved ? Don't worry.lets get started. ",textAlign:TextAlign.center,style: TextStyle(
                        color: Colors.white,fontWeight:FontWeight.bold,fontSize: 22.0
                      ),),
                    ),),
                    SizedBox(height: 30.0,),
                    GestureDetector(
                      onTap: (){

                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                        getValidation(context);

                      },
                      child: Container(height: 60,width: 220,decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                        child: Align(
                          alignment: Alignment.center,


                            child: Text('Get Started',style:TextStyle(fontSize: 15.0,color: Colors.deepPurple,fontWeight: FontWeight.bold),),

                        ),),
                    ),
                    SizedBox(height: 80)
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

