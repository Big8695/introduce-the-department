import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';

// เทคโนโลยีสารสนเทศ

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => PageState();
}

class PageState extends State<Page2> {
  var _textSkills = ['การคิดวิเคราะห์','การแก้ปัญหา','การสื่อสาร','ทำงานเป็นทีม','การบริหารเวลา','ความคิดสร้างสรรค์'];
  var _iconSkills = [Icons.psychology,Icons.build,Icons.campaign,Icons.group,Icons.access_time,Icons.extension];

  var _colors = [
Color(0xffdcb7b9),
    Color(0xfff2d5f8),
    Color(0xffe6c0e9),
    Color(0xffbfabcb),
    Color(0xff8d89a6),
    Color(0xffa1bdfb),
  ];

  var _itImage = [
    'image/it/it1.jpg',
  'image/it/it2.jpg',
  'image/it/it3.jpg',
  'image/it/it4.jpg',
  'image/it/it5.jpg',
  'image/it/it6.jpg',
  ]
;
  var _nameClass = [
    'นายนันทพล สิ่งมิ่ง',
    'นางสาวอนินทิตา ทั่งคำ',
    'นางสาวอัญธิกา คำภิระแปง',
    'นางสาวพิมพ์ณิชา ทองยั่งยืน'
  ];
  var _levelname = [
    'หัวหน้าแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก'
  ];

  var _image = [
    'image/it/jackpic.jpg',
    'image/it/ain.jpeg',
    'image/it/ben.jpg',
    'image/it/ke.jpg',
  ];

  final Uri _urlit = Uri.parse(
      'https://web.facebook.com/itWicec?_rdc=1&_rdr');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'เทคโนโลยีสารสนเทศ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffffd578),
          actions: [
            IconButton(onPressed: _launchInBrowserView, icon: Icon(Icons.insert_link_outlined))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(height: 200,child: PageView(children: [con(_itImage[0]),con(_itImage[1]),con(_itImage[2]),con(_itImage[3]),con(_itImage[4]),con(_itImage[5])],),),
            Container(width: double.infinity ,padding: EdgeInsets.all(30), child: Column( children: [Text('   แผนกเทคโนโลยีสารสนเทศเป็นสาขาวิชาที่มุ่งเน้นการศึกษาเกี่ยวกับการใช้คอมพิวเตอร์และเทคโนโลยีสารสนเทศเพื่อจัดการข้อมูลการพัฒนาระบบ และ การแก้ไขปัญหาในองค์กรหรือชีวิตประจำวันโดยผสมผสานความรู้ด้านฮาร์ดแวร์ซอฟต์แวร์ระบบเครือข่าย และ ฐานข้อมูล',textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.black54,),)],),),
            SizedBox(
              height: 20,
            ),
            Text('Soft Skils',style: textStyle(),),
            SizedBox(height: 200, child: GridView.count(crossAxisCount: 3,childAspectRatio: 3/2,crossAxisSpacing: 7,mainAxisSpacing: 7,padding: EdgeInsets.all(15),children: textSkills(),),),

            Text(
              'บุคลากรแผนก',
              style: textStyle(),
            ),
            SizedBox(
              height: 300,
              child: ListView(
                padding: EdgeInsets.all(5),
                itemExtent: 80,
                children: listViewname(),
              ),
            )
          ]),
        ));
  }

  
  TextStyle textStyle() => TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.black54,
    fontSize: 15
  );


  List<Widget> listViewname() => List.generate(_nameClass.length,
      (index) => listItem(_nameClass[index], _levelname[index], _image[index]));

  Widget listItem(String text, String texttitle, var images) => Container(
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(images), fit: BoxFit.contain)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 16),
                ),
                Text(
                  texttitle,
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ],
        ),
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xffffd578), borderRadius: BorderRadius.circular(10)),
      );


  Widget con( var text) => Container(
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(text),fit: BoxFit.cover)
    ),
  );

  List<Widget> textSkills() => List.generate(_textSkills.length, (i) => Container(
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(_iconSkills[i],color: Colors.black54,),Text(_textSkills[i],style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black54),)],),
    decoration: BoxDecoration(
      color: Color(0xffffd578),
      borderRadius: BorderRadius.circular(20)
    ),
    alignment: Alignment.center,
  ));

  TextStyle _fontText() => TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
  TextStyle _fontcontext() => TextStyle(
        fontSize: 11,
      );

    Future<void> _launchInBrowserView() async {
    if (!await launchUrl(_urlit, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $_urlit');
    }
  }
}