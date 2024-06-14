import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quote_app/utils/Quotelist.dart';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quote_app/utils/global.dart';
import 'package:share_extend/share_extend.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

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
            "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  QuoteList.length,
                  (index) => Stack(
                    children: [
                      RepaintBoundary(
                        key: imgKey[index],
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 500,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(GoalImageList[index % 10])),
                          ),
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Text(
                                        QuoteList[index]['quote'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            fontFamily: 'Cabin'),
                                      )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '- ${QuoteList[index]['author']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                              fontFamily: 'Cabin'),
                                        ),
                                      ),
                                    ],
                                  ))),
                        ),
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
                                width: 5.5,
                              ),
                              boxcat(
                                InkWell(
                                  onTap: () {
                                    Selecindex = index;
                                    Navigator.of(context).pushNamed('/ed');
                                    // Random random = Random();
                                    // String hd = random.toString(BgimgList[index]);
                                    // selectedThemeimage=hd;
                                  },
                                  child: Icon(
                                    Icons.photo_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                'Bg',
                              ),
                              SizedBox(
                                width: 30.5,
                              ),
                              boxcat(
                                InkWell(
                                  onTap: () {
                                    Selecindex = index;
                                    Navigator.of(context).pushNamed('/ed');
                                  },
                                  child: Icon(
                                    Icons.font_download,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                'Font',
                              ),
                              SizedBox(
                                width: 26.5,
                              ),
                              boxcat(
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                        text: QuoteList[index]['quote']));
                                  },
                                  child: Icon(
                                    Icons.copy,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                'Copy',
                              ),
                              SizedBox(
                                width: 26.5,
                              ),
                              boxcat(
                                InkWell(
                                  onTap: () async {
                                    RenderRepaintBoundary boundary =
                                        imgKey[index]
                                                .currentContext!
                                                .findRenderObject()
                                            as RenderRepaintBoundary;

                                    ui.Image image = await boundary.toImage();
                                    ByteData? bytedata = await image.toByteData(
                                        format: ui.ImageByteFormat.png);
                                    Uint8List img =
                                        bytedata!.buffer.asUint8List();

                                    final path =
                                        await getApplicationDocumentsDirectory();
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
                                width: 26.5,
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
                                                      boundary = imgKey[index]
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
                                width: 20.5,
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
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Back')),
                                            TextButton(
                                                onPressed: () async {
                                                  RenderRepaintBoundary
                                                      boundary = imgKey[index]
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
                                                  ImageGallerySaver.saveImage(
                                                      img);
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
                              SizedBox(
                                width: 2.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
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
