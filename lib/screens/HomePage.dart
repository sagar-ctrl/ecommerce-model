

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/homePage/homeScreen.dart';
import 'package:shop_app/screens/LoginSuccess.dart';
import 'package:shop_app/screens/OrderPage.dart';
import '../components/homePage/homeScreen.dart';

import 'package:shop_app/main.dart';
import 'package:shop_app/screens/LoginPage.dart';


class HomePage extends StatefulWidget{

  @override
  HomePageState createState()=>HomePageState();

}

class HomePageState extends State<HomePage>{
 String email;
 int indexBottom=0;
 int indexOfBNB=0;
 List<Widget>pages=[HomeScreen(),OrderPage(),LoginSuccess(),LoginPage()];

  @override
  void initState(){

   super.initState();
   getValidation().whenComplete((){
    
     if(email ==null){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
     }
   });

  }
Future getValidation()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtemail= sharedPreferences.getString('email');
    setState(() {
      email=obtemail;
    });
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context)=>Scaffold(

          body: SafeArea(

              child:pages[indexOfBNB],
            ),
     bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: Colors.black,
       unselectedItemColor: Colors.blue,
       currentIndex:indexOfBNB,
       unselectedFontSize: 15.0,
       showUnselectedLabels: true,
       onTap: (i){
         setState(() {
           indexOfBNB=i;
         });
       },
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
         BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "orders"),
         BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Message"),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
       ],
     ),
          ),

      ),
    );
  }




}