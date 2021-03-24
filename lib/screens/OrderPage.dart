
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';
import 'package:shop_app/components/CustomTile.dart';
import 'package:shop_app/components/ProductTile.dart';
import 'package:shop_app/url.dart';

class OrderPage extends StatefulWidget{
  @override
  OrderpageState createState()=>OrderpageState();
}

class OrderpageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder:(context)=> Scaffold(
              resizeToAvoidBottomInset: false,
          body:Container(
            color: Colors.blue.shade100,
            child: SafeArea(
              child:Padding(
                padding: EdgeInsets.only(top:20.0),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(backgroundColor: Colors.transparent,
                    title: Text('Order Detail',style: TextStyle(color: Colors.deepPurple),),
                    leading: Icon(Icons.arrow_back,color: Colors.deepPurple,),

                      pinned: true,
                      elevation: 0,
                    ),
                    SliverFillRemaining(

                          child:Stack(
                            children: [
                             Padding(
                               padding: EdgeInsets.only(top: 100.0),
                               child:  Container(decoration: BoxDecoration(
                                   color: Colors.blue.shade50,
                                   borderRadius: BorderRadius.circular(30.0)

                               ),
                               child:Padding(padding:EdgeInsets.only(top: 50.0),child: ListView.builder(itemBuilder:(context,index)=>Padding(padding:EdgeInsets.symmetric(
vertical: 5.0,horizontal:20.0                              ),child: ProductTile("Monitor",10.0)),itemCount: 5,))),
                             ),
                             Padding(
                               padding: EdgeInsets.symmetric(
                                 vertical: 20.0,horizontal: 20.0
                               ),
                               child:CustomTile("Sagar"),
                             )
                            ],
                          ),),

                  ],
                ),

              ),
            ),
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}