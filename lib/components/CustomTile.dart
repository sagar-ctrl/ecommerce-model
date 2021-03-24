
import 'package:flutter/material.dart';
import 'package:shop_app/url.dart';


class CustomTile extends StatelessWidget{
  String name;

  CustomTile(this.name);

  @override
  Widget build(BuildContext context) {

    return  Container(

      height: 120,
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),

      ),
      child: Row(
        children: [

          Padding(padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),child: Image.network(profileImage,height: 100,fit:BoxFit.cover,)),
          Expanded(child:Container(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text("Hi $name",style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                    ),),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text:'Electronic Appliiance \nManagement Services',
                              style: TextStyle(
                                  color: Colors.deepPurple
                              ))
                        ]
                    ))
                  ],
                ),
              )
          ))
        ],
      ),
    );

  }

}