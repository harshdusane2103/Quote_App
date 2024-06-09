import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:quote_app/utils/global.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Quotes',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight:FontWeight.w700),),
                    SizedBox(width:200,),
                    Icon(Icons.notifications,color:Colors.amber,size: 24,),
                    SizedBox(width: 5,),
                    Icon(Icons.favorite_rounded,color:Colors.red,size: 24,),
                    SizedBox(width: 5,),
                    Icon(Icons.menu,color:Colors.black,size: 24,),
                  ],
                ),
            SizedBox(height: 15,),

            Marquee(
              // animationDuration:Durations.short4,
              autoRepeat: true,


              child:Row(
                children: [
                  ... List.generate(Bannerlist.length, (index) => Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 200,
                    width:360 ,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Bannerlist[index]['image'],)

                      ),


                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(Bannerlist[index]['bqt'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    )),
                  ))

                ],
              ) ,
            ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
