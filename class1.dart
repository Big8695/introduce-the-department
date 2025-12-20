import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';

// ไฟฟ้ากำลัง

class Class1 extends StatefulWidget {
  @override
  State<Class1> createState() => PageState();
}

class PageState extends State<Class1> {
   var _textSkils = ['ความรับผิดชอบ','วินัยและความตรงต่อเวลา','การทำงานเป็นทีม','การสื่อสารที่ชัดเจน','การคิดวิเคราะห์และแก้ปัญหา','ความปลอดภัยในการทำงาน',];
   var _iconSkills = [Icons.engineering,Icons.access_time,Icons.groups,Icons.record_voice_over,Icons.psychology,Icons.warning_amber,];

  var _classimage = ['image/electonic/el1.jpg','image/electonic/el2.jpg','image/electonic/el3.jpg','image/electonic/el4.jpg',];

  var _nameClass = [
    'นายผดุงวิทย์ ดิษฐเจริญ',
    'นายกันต์ วรรณา',
    'นายวรวุฒิ เขียวฉวี',
  ];
  var _levelname = [
    'ครูประจำแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก',
  ];

  var _image = [
    'image/electonic/Phudungwit.jpg',
    'image/electonic/KanVanna.png',
    'image/electonic/Worawut.png',
  ];

   final Uri _urlit = Uri.parse(
      'https://web.facebook.com/groups/Nattawut/?fref=ts&_rdc=1&_rdr');

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ไฟฟ้ากำลัง',
            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffff78a3),
          actions: [
            IconButton(onPressed: _launchInBrowserView, icon: Icon(Icons.insert_link_outlined))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(height: 200,child: PageView(children: [con(_classimage[0]),con(_classimage[1]),con(_classimage[2]),con(_classimage[3])],),),
            Container(padding: EdgeInsets.all(30),child: Column(children: [Text('     แผนกการไฟฟ้า มุ่งเน้นการเรียนรู้เกี่ยวกับ ระบบไฟฟ้าและอิเล็กทรอนิกส์พื้นฐาน ตั้งแต่การผลิต การส่งจ่าย การติดตั้ง ควบคุม และการซ่อมบำรุงระบบไฟฟ้า ให้ผู้เรียนมีทั้ง ความรู้ทางทฤษฎีและทักษะปฏิบัติจริง พร้อมสามารถทำงานได้อย่างปลอดภัยตามมาตรฐานวิชาชีพ',textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.black54,),)],),),
            Text('Soft Skils',style: textStyle()),
            SizedBox(
              height: 200,
              child: GridView.count(crossAxisCount: 3, childAspectRatio: 3/2 ,crossAxisSpacing: 7,mainAxisSpacing: 7,padding: EdgeInsets.all(15),children: textSkills(),),
            ),
            Text(
              'บุคลากรแผนก',
              style: textStyle(),
              // style: textStyle(),
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
              Text(text,style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),),
              Text(texttitle,style: TextStyle(color: Colors.white70),),
            ],)
          ],
        ),
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xffff78a3), borderRadius: BorderRadius.circular(10)),
      );

  Widget con(var text) => Container(
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(text),fit: BoxFit.cover)
    ),
  );

  List<Widget> textSkills() => List.generate(_textSkils.length, (i) => Container(
    padding: EdgeInsets.all(5),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Icon(_iconSkills[i],color: Colors.white70,),Text(_textSkils[i],style: TextStyle(fontSize: 10,color: Colors.white70),)],),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xffff78a3)
    ),
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