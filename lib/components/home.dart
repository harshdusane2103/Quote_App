import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    Text(
                      'Quotes',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Icon(
                      Icons.notifications,
                      color: Colors.amber,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: 24,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Marquee(
                  animationDuration: Duration(microseconds: 30),
                  // autoRepeat: true,

                  child: Stack(children: [
                    Row(
                      children: [
                        ...List.generate(
                            Bannerlist.length,
                            (index) => Container(
                                  margin: EdgeInsets.only(right: 8),
                                  height: 200,
                                  width: 360,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          Bannerlist[index]['image'],
                                        )),
                                  ),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Bannerlist[index]['bqt'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  )),
                                ))
                      ],
                    ),
                    Container(
                      child: Row(
                        children: [],
                      ),
                    )
                  ]),
                ),

                SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    boxcat(Icon(
                      Icons.widgets_outlined,
                      color: Colors.white,size: 36,
                    ),'Categories', Colors.purple,),
                    SizedBox(width: 35,),
                    boxcat(Icon(
                      Icons.photo_rounded,
                      color: Colors.white,size: 36,
                    ),'Quotes',Colors.amberAccent),
                    SizedBox(width: 35,),
                    boxcat(Icon(
                      Icons.notifications,
                      color: Colors.white,size: 36,
                    ),'Latest',Colors.blue),
                    SizedBox(width: 35,),
                    boxcat(Icon(
                      Icons.menu_book,
                      color: Colors.white,size: 36,
                    ),'Articles',Colors.greenAccent),
                  ],
                ),
                Align(
                    alignment:Alignment.centerLeft,child: Text('Trending Quotes',style: TextStyle(color: Colors.black,fontSize:24,fontWeight: FontWeight.bold),)),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(onTap:() {
                      Navigator.of(context).pushNamed('/de');
                    },child: mainquote('Goal Quotes',AssetImage('assets/images/goal.webp'))),
                    SizedBox(width: 8,),
                    mainquote('Inspiration Quotes',AssetImage('assets/images/insp.webp')),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mainquote('Positive Quotes',AssetImage('assets/images/pos.webp')),
                    SizedBox(width: 8,),
                    mainquote('Strong Quotes',AssetImage('assets/images/strong.webp')),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mainquote('Sad Quotes',AssetImage('assets/images/sad.webp')),
                    SizedBox(width: 8,),
                    mainquote('Confidence Quotes',AssetImage('assets/images/con.webp')),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    mainquote('Good Quotes',AssetImage('assets/images/good.webp')),
                    SizedBox(width: 8,),
                    mainquote('Happiness Quotes',AssetImage('assets/images/happy.webp')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column mainquote(String Qname,img) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: img,
                          )
                        ),
                      ),
                      Text(Qname,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  );
  }

  Column boxcat(i1,String name,c1) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: c1,
            borderRadius: BorderRadius.circular(10),
          ),
          child: i1,
        ),
        Text(name)
      ],
    );
  }
}
