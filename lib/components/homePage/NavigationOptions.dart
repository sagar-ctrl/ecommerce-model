


import 'package:flutter/material.dart';
import '../../screens/HomePage.dart';
class NavigationOptions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  Container(
        height: 200,width: double.infinity,
        margin: EdgeInsets.only(top:210.0,left:30.0),
        child:
        ListView(

            scrollDirection: Axis.horizontal,

            children: getList([{"name":"Message","icons":Icons.message},
              {"name":"Clean","icons":Icons.cleaning_services_sharp},
              {"name":"Repair","icons":Icons.settings_sharp},
              {"name":"Message","icons":Icons.message},
              {"name":"Message","icons":Icons.message},
            ])

        )


    );
  }

  List<Widget> getList(names){
    List<Widget> arrayList=[];
    for(int i=0;i<names.length;i++){
      arrayList.add(
          Container(width: 120,margin: EdgeInsets.symmetric(vertical:10,horizontal: 10),decoration: BoxDecoration(
              color: Colors.white,borderRadius: BorderRadius.circular(20.0)
          ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Icon(names[i]['icons'],color: Colors.deepPurple,size: 35.0,),
                SizedBox(height: 20.0),
                Text(names[i]['name'],style: TextStyle(
                    color:Colors.deepPurple,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500
                ),)
              ],
            ),)
      );
    }
    return arrayList;
  }

}
