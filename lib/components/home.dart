import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:quote_app/utils/global.dart';

bool Show = true;

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
      appBar: AppBar(
        title: Text(
          'Quotes',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Marquee(
            animationDuration: Duration(microseconds: 30),
            child: Row(
              children: [
                ...List.generate(
                    Bannerlist.length,
                    (index) => Container(
                          margin: EdgeInsets.only(right: 8, top: 20),
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
          ),
          SizedBox(
            height: 9,
          ),
          Row(
            children: [
              boxcat(
                Icon(
                  Icons.widgets_outlined,
                  color: Colors.white,
                  size: 36,
                ),
                'Categories',
                Colors.purple,
              ),
              SizedBox(
                width: 35,
              ),
              boxcat(
                  Icon(
                    Icons.photo_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                  'Quotes',
                  Colors.amberAccent),
              SizedBox(
                width: 35,
              ),
              boxcat(
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 36,
                  ),
                  'Latest',
                  Colors.blue),
              SizedBox(
                width: 35,
              ),
              boxcat(
                  Icon(
                    Icons.menu_book,
                    color: Colors.white,
                    size: 36,
                  ),
                  'Articles',
                  Colors.greenAccent),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Trending Quotes',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
              IconButton(
                onPressed: () {
                  setState(() {
                    Show = !Show;
                  });
                },
                icon: Icon(Show
                    ? Icons.format_list_bulleted_outlined
                    : Icons.grid_view_rounded),
                color: Colors.black,
              )
            ],
          ),

          //Todo List And gird view
          Container(
            height: 350,
            child: Show
                ? InkWell(onTap:() {
              Navigator.of(context).pushNamed('/de');
                },child: Listviewbox())
                : InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/de');
                    },
                    child: Gridviewbox()),
          )
        ]),
      ),
    ));
  }

  ListView Listviewbox() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: Contanertlist.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent.shade100,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.black,width: 1),
                    image: DecorationImage(fit: BoxFit.fill,
                        image: AssetImage(Contanertlist[index]['img']))
                ),
                child: 
              Container(
                margin: EdgeInsets.only(top:160),
                height: 30,
                width: 350,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                          Contanertlist[index]['Qname'],
                          style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),
                        ),
                ) ,
              )
                // Row(
                //
                //   children: [
                //     SizedBox(width: 5,),
                //     CircleAvatar(
                //       backgroundImage: AssetImage(Contanertlist[index]['img']),
                //       radius: 60,
                //     ),
                //     SizedBox(width: 5,),
                //     Text(
                //       Contanertlist[index]['Qname'],
                //       style: TextStyle(color: Colors.black, fontSize: 24),
                //     )
                //   ],
                // ),
              ),
        ));
  }

  GridView Gridviewbox() {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: Contanertlist.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Column(
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
                          image: AssetImage(
                            Contanertlist[index]['img'],
                          ))),
                ),
                Text(
                  Contanertlist[index]['Qname'],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ));
  }

  Column mainquote(String Qname, img) {
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
              )),
        ),
        Text(
          Qname,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Column boxcat(i1, String name, c1) {
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
