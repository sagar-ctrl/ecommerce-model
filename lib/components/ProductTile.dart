
import 'package:flutter/material.dart';
import 'package:shop_app/url.dart';


class ProductTile extends StatelessWidget{
  String name;
  double price;

  ProductTile(this.name,this.price);

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
                    Text(" $name",style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                    ),),
                    RichText(text: TextSpan(

                          text:'Electronic Appliiance \nManagement Services',
                              style: TextStyle(
                                  color: Colors.deepPurple
                              )

                    )),
                    Row(
                      children: [
                        Text('$price/Unit',style: TextStyle(fontSize:15.0,color: Colors.deepPurple),),
                       SizedBox(width: 50.0,),
                       Container(
                           width:120.0,
                         height:35.0,
                        child: Row(
                          children: [
                            IconButton(icon: Icon(Icons.remove), onPressed: (){
                              print('hello');
                            }),
                            Text('5'),
                            IconButton(icon: Icon(Icons.add), onPressed: (){
                              print('hello');
                            }),
                          ],
                        ),
                       )
                      ],
                    )
                  ],
                ),
              )
          ))
        ],
      ),
    );

  }

}