import 'package:flutter/material.dart';
import 'package:quote_app/utils/Quotelist.dart';
import 'package:quote_app/utils/global.dart';
class EditingScreen extends StatefulWidget {
  const EditingScreen({super.key});

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  @override

  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap:() {
        Navigator.pop(context);
      },child: Icon(Icons.arrow_back)),),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Container(
            padding: EdgeInsets.all(25),
          height: 380,
          width: 380,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$selectedThemeimage'),
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
          ),
          child:
         Align( alignment: Alignment.center,
            child: Text(
              QuoteList[Selecindex]['quote'],
              style: TextStyle(
                  color: selectColor,
                  fontFamily: '$selectedFontFamily',
                  fontSize: 30),
            ),)
        ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    BgimgList.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 10, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedThemeimage = BgimgList[index];
                          });
                          Navigator.of(context).pushNamed('/de');
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('${BgimgList[index]}'),
                                fit: BoxFit.cover),
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fonts',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 28),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          fontFamily.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFontFamily = fontFamily[index];
                                });
                                Navigator.of(context).pushNamed('/de');
                              },
                              child: Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 3),
                                  child: Text(
                                    '${fontFamily[index]}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: selectColor,
                                        fontSize: 20,
                                        fontFamily: '${fontFamily[index]}'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Font Colors',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 28)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          colorList.length,
                              (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectColor = colorList[index];
                              });
                              Navigator.of(context).pushNamed('/de');
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10, right: 12),
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                color: colorList[index],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
