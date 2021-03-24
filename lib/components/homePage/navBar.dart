
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/LoginPage.dart';
import '../../screens/HomePage.dart';

import '../../url.dart';


class NavBar extends StatefulWidget{
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String Name;
  @override
  void initState(){
    super.initState();
    getname();

  }
  getname()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var name=sharedPreferences.getString('name');
    setState(() {
      Name=name;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height:300,
      decoration: BoxDecoration(color:Colors.blue.shade50,borderRadius: BorderRadius.only(bottomLeft:
      Radius.circular(100.0))),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            SizedBox(height:55.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Hi ${Name!=null?Name:"User"} \n",style: TextStyle(color: Colors.deepPurple,fontSize: 30.0,fontWeight: FontWeight.w700)),
                      TextSpan(text: "Need a Help ?",style: TextStyle(color: Colors.deepPurple.shade300,fontSize: 15.0,))
                    ]
                ),),
                TextButton(onPressed: (){LogOut(context);}, child: Text("log out")),
                Padding(padding:EdgeInsets.only(right: 30.0),child: Container(height: 60,width: 60,decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),child: Image.network(profileImage,fit: BoxFit.cover,),)),


              ],),
            SizedBox(height:20.0),
            Padding(padding: EdgeInsets.only(right: 30.0),
              child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: "Search",prefixIcon: Icon(Icons.search),fillColor: Colors.white.withRed(500),filled: true,hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.w500))),
            ),

          ],
        ),
      ),
    );
  }

  Future LogOut(BuildContext context)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.remove("email");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}