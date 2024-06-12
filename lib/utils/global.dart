import 'package:flutter/material.dart';
import 'package:quote_app/utils/Quotelist.dart';

var selectedThemeimage = 'assets/images/th1.webp';

var selectedFontFamily = 'Cabin';

List fontFamily = [
  'Cabin',
  'Gwendolyn',
  'Oswald',
  'Roboto',
  'Dancing',
];

int Selecindex = 0;

List Bannerlist = [
  {
    'image': 'assets/images/hd1.jpeg',
    'bqt': "The only way to do great work is to love what you do.",
  },
  {
    'image': 'assets/images/b2.webp',
    'bqt': "Life is what happens when you're busy making other plans.",
  },
  {
    'image': 'assets/images/b1.webp',
    'bqt': "Believe you can and you're halfway there.",
  },
  {
    'image': 'assets/images/b5.webp',
    'bqt':
        "The only limit to our realization of tomorrow will be our doubts of today.",
  },
  {
    'image': 'assets/images/hd3.jpeg',
    'bqt':
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
  },
  {
    'image': 'assets/images/hd4.jpg',
    'bqt':
        '"The future belongs to those who believe in the beauty of their dreams." ',
  },
  {
    'image': 'assets/images/hd5.jpg',
    'bqt':
        "In the end, it's not the years in your life that count. It's the life in your years."
  },
];

List Contanertlist = [
  {
    'img': 'assets/images/goal.webp',
    'Qname': 'Goal Quotes',
  },
  {
    'img': 'assets/images/insp.webp',
    'Qname': 'Inspring Quotes',
  },
  {
    'img': 'assets/images/good.webp',
    'Qname': 'Good Quotes',
  },
  {
    'img': 'assets/images/happy.webp',
    'Qname': 'Happiness Quotes',
  },
  {
    'img': 'assets/images/pos.webp',
    'Qname': 'positive Quotes',
  },
  {
    'img': 'assets/images/sad.webp',
    'Qname': 'sad Quotes',
  },
  {
    'img': 'assets/images/strong.webp',
    'Qname': 'Strong Quotes',
  },
  {
    'img': 'assets/images/confidence.webp',
    'Qname': 'Confidence Quotes',
  },
];

List<Color> colorList = [
  Colors.white,
  Colors.blue,
  Colors.grey,
  Colors.amber,
  Colors.teal,
  Colors.orange,
  Colors.green,
  Colors.deepPurple,
  Colors.black,
  Colors.brown,
  Colors.cyan,
  Colors.pink,
  Colors.red,
];
Color selectColor = Colors.black;

List<GlobalKey> imgKey =
    List.generate(QuoteList.length, (index) => GlobalKey());

List GoalImageList = [
  'assets/images/quote1.webp',
  'assets/images/quote2.webp',
  'assets/images/quote3.webp',
  'assets/images/quote4.webp',
  'assets/images/quote5.webp',
  'assets/images/quote6.webp',
  'assets/images/quote7.webp',
  'assets/images/quote8.webp',
  'assets/images/quote9.webp',
  'assets/images/quote10.webp',
];

List BgimgList=[
  'assets/images/th1.webp',
  'assets/images/th2.webp',
  'assets/images/th3.jpg',
  'assets/images/th4.webp',
  'assets/images/th5.webp',
  'assets/images/th6.webp',
  'assets/images/th7.webp',
  'assets/images/th8.webp',
  'assets/images/th9.webp',
  'assets/images/th10.webp',
  'assets/images/th11.webp',
  'assets/images/th12.webp',
  'assets/images/th13.webp',
  'assets/images/th14.webp',
];
