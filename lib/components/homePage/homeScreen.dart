
import 'package:flutter/material.dart';
import './NavigationOptions.dart';

import 'package:shop_app/components/homePage/getListForGrid.dart';
import './navBar.dart';

class HomeScreen extends StatefulWidget{
  @override
  HomeScreenState createState() {

    return HomeScreenState();
  }
  
}
class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [
        Container(color: Colors.blue.shade100,),
        Column(
            children: [
              Stack(
                children: [
                  NavBar(),
                  NavigationOptions(),


                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( "Our Services",style:TextStyle(
                          fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.w600
                      )),

                      Text(
                        "View all",style: TextStyle(
                          fontSize: 15.0,color: Colors.black54
                      ),
                      )
                    ]
                ),
              ),


              Expanded(
                // height: 150,

                  child: GridView(
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.354,
                          mainAxisSpacing: 10.0,
                          crossAxisCount:2,
                          crossAxisSpacing: 10.0

                      ),
                      children:getListForGrid([
                        {"label":"home","pic":"https://www.whirlpoolindia.com/media/catalog/product/cache/image/700x560/e9c3970ab036de70892d86c6d221abfe/w/h/whirlpool_supreme_cool_angle-right.jpg"},
                        {"label":"home","pic":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfLgfugMRY6BsHyMt6qhbq7LGbkzaeUoJDCA&usqp=CAU"},
                        {"label":"home","pic":"https://www.whirlpoolindia.com/media/catalog/product/cache/image/700x560/e9c3970ab036de70892d86c6d221abfe/w/h/whirlpool_supreme_cool_angle-right.jpg"},
                        {"label":"home","pic":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfLgfugMRY6BsHyMt6qhbq7LGbkzaeUoJDCA&usqp=CAU"},
                        {"label":"home","pic":"https://www.whirlpoolindia.com/media/catalog/product/cache/image/700x560/e9c3970ab036de70892d86c6d221abfe/w/h/whirlpool_supreme_cool_angle-right.jpg"},
                        {"label":"home","pic":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfLgfugMRY6BsHyMt6qhbq7LGbkzaeUoJDCA&usqp=CAU"},
                      ])
                  )
              ),





            ]
        ),

      ],
    );
  }
  
}