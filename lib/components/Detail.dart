import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quote_app/utils/Quotelist.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop('/he');
              },
              child: Icon(Icons.arrow_back_sharp)),
          title: Text(
            "Goal Quote",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ... List.generate(QuoteList.length, (index) =>Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 500,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/goal.webp'))),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(QuoteList[index]['quote'],style: TextStyle(color:Colors.white,fontWeight:FontWeight.w700,fontSize: 18),),
                      )),
                    ),
                    Positioned(
                      bottom: 0.1,
                      child: Container(
                        height: 60,
                        width: 368,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.5,
                            ),
                            boxcat(
                              Icon(
                                Icons.photo_rounded,
                                color: Colors.black,
                                size: 24,
                              ),
                              'Bg',
                            ),
                            SizedBox(
                              width: 40.5,
                            ),
                            boxcat(
                              Icon(
                                Icons.font_download,
                                color: Colors.black,
                                size: 24,
                              ),
                              'Font',
                            ),
                            SizedBox(
                              width: 40.5,
                            ),
                            boxcat(
                              Icon(
                                Icons.copy,
                                color: Colors.black,
                                size: 24,
                              ),
                              'Copy',
                            ),
                            SizedBox(
                              width: 40.5,
                            ),
                            boxcat(
                              Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 24,
                              ),
                              'Share',
                            ),
                            SizedBox(
                              width: 40.5,
                            ),
                            boxcat(
                              Icon(
                                Icons.file_download_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              'Save',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ), )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

Column boxcat(
  i1,
  String name,
) {
  return Column(
    children: [
      Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: i1,
      ),
      Text(name)
    ],
  );
}
