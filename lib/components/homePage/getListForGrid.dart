

import 'package:flutter/material.dart';
List<Widget> getListForGrid(item){

  List<Widget> items=[];
  print(item.length);
  for(int i=0;i<item.length;i++){
    items.add(
      Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15.0)),margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            children: [

              Image.network(item[i]['pic'],height: 150,width: 150,fit: BoxFit.fill,),
              Padding(padding: EdgeInsets.only(top: 5.0,left:8.0),
                child: Text(item[i]['label'],style: TextStyle(fontSize: 20.0),),)
            ],
          )),
    );

  }
  return items;
}