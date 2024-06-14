import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:quote_app/utils/Quotelist.dart';
import 'package:quote_app/utils/global.dart';

import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:share_extend/share_extend.dart';

GlobalKey editimgKey = GlobalKey();

class EditingScreen extends StatefulWidget {
  const EditingScreen({super.key});

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop('/de');
            },
            child: Icon(Icons.arrow_back)),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ... List.generate(BgimgList.length, (index) =>
            //     ),
            RepaintBoundary(
              key: editimgKey,
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
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  QuoteList[Selecindex]['quote'],
                                  style: TextStyle(
                                      color: selectColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontFamily: selectedFontFamily),
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '- ${QuoteList[Selecindex]['author']}',
                                    style: TextStyle(
                                        color: selectColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        fontFamily: selectedFontFamily),
                                  ),
                                ),
                              ],
                            ))),
                    // Align( alignment: Alignment.center,
                    //   child: Text(
                    //     QuoteList[Selecindex]['quote'],
                    //     style: TextStyle(
                    //         color: selectColor,
                    //         fontFamily: '$selectedFontFamily',
                    //         fontSize: 30),
                    //   ),)
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                boxcat(
                  InkWell(
                    onTap: () async {
                      RenderRepaintBoundary boundary =
                          editimgKey.currentContext!.findRenderObject()
                              as RenderRepaintBoundary;

                      ui.Image image = await boundary.toImage();
                      ByteData? bytedata = await image.toByteData(
                          format: ui.ImageByteFormat.png);
                      Uint8List img = bytedata!.buffer.asUint8List();

                      final path = await getApplicationDocumentsDirectory();
                      File file = File("${path.path}/img.png");
                      file.writeAsBytes(img);
                      ShareExtend.share(file.path, "image");
                    },
                    child: Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  'Share',
                ),
                SizedBox(
                  width: 20,
                ),
                boxcat(
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.teal.shade50,
                            title: Text(
                              'Do you want to Set Wallpaper ?',
                              style:
                              TextStyle(color: Colors.black),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')),
                              TextButton(
                                  onPressed: () async {
                                    RenderRepaintBoundary
                                    boundary = editimgKey
                                        .currentContext!
                                        .findRenderObject()
                                    as RenderRepaintBoundary;

                                    ui.Image image =
                                    await boundary.toImage();
                                    ByteData? bytedata =
                                    await image.toByteData(
                                        format: ui
                                            .ImageByteFormat
                                            .png);
                                    Uint8List img = bytedata!
                                        .buffer
                                        .asUint8List();

                                    final path =
                                    await getApplicationDocumentsDirectory();
                                    File file = File(
                                        "${path.path}/img.png");
                                    file.writeAsBytes(img);
                                    ShareExtend.share(
                                        file.path, "image");
                                    int location = WallpaperManager
                                        .BOTH_SCREEN; //can be Home/Lock Screen
                                    bool result =
                                    await WallpaperManager
                                        .setWallpaperFromFile(
                                        file.path,
                                        location);
                                    Navigator.pop(context);
                                    //
                                  },
                                  child: Text('Yes'))
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.wallpaper,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  'Wallpaper',
                ),
                SizedBox(
                  width: 20,
                ),
                boxcat(
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.teal.shade50,
                            title: Text(
                              'Do you want to Save ?',
                              style: TextStyle(color: Colors.black),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Back')),
                              TextButton(
                                  onPressed: () async {
                                    RenderRepaintBoundary boundary = editimgKey
                                            .currentContext!
                                            .findRenderObject()
                                        as RenderRepaintBoundary;

                                    ui.Image image = await boundary.toImage();
                                    ByteData? bytedata = await image.toByteData(
                                        format: ui.ImageByteFormat.png);
                                    Uint8List img =
                                        bytedata!.buffer.asUint8List();
                                    ImageGallerySaver.saveImage(img);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Save'))
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.file_download_outlined,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  'Save',
                ),
              ],
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
                        fontSize: 24),
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
                                // Navigator.of(context).pushNamed('/de');
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
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
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
                          fontSize: 24)),
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
                              // Navigator.of(context).pushNamed('/de');
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10, right: 12),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorList[index],
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
