import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';

// การจัดการโลจิติกส์

class Class6 extends StatefulWidget {
  @override
  State<Class6> createState() => PageState();
}

class PageState extends State<Class6> {
  var _textSkils = ['การวางแผนและจัดระบบ','การแก้ปัญหาเฉพาะหน้า','การสื่อสารและประสานงาน','การบริหารเวลา','ความรับผิดชอบ','การทำงานเป็นทีม',];
  var _iconSkills = [Icons.route,Icons.psychology,Icons.support_agent,Icons.schedule,Icons.inventory,Icons.groups,];
  var _classimage = ['image/logic/lo1.jpg','image/logic/lo2.jpg','image/logic/lo3.jpg',];
  var _nameClass = [
    'นางวาสนา เวฬุวนารักษ์',
  ];
  var _levelname = [
    'หัวหน้าแผนกวิชา',
  ];

  var _image = [
    'image/logic/wasana.jpg',
  ];

  final Uri _urlit = Uri.parse(
      'https://web.facebook.com/logisticswicec?_rdc=1&_rdr');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'การจัดการโลจิติกส์',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffa1bdfb),
          actions: [
            IconButton(onPressed: _launchInBrowserView, icon: Icon(Icons.insert_link_outlined))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(height: 200,child: PageView(children: [con(_classimage[0]),con(_classimage[1]),con(_classimage[2])],),),
            Container(padding: EdgeInsets.all(30),child: Column(children: [Text('     แผนกการจัดการโลจิสติกส์ ศึกษาการวางแผนขนส่ง การจัดเก็บสินค้า และการบริหารซัพพลายเชน เพื่อให้การส่งมอบสินค้าเป็นไปอย่างมีประสิทธิภาพ',textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.black54,),)],),),
            Text('Soft Skils',style: textStyle(),),
             SizedBox(
              height: 200,
              child: GridView.count(crossAxisCount: 3, childAspectRatio: 3/2 ,crossAxisSpacing: 7,mainAxisSpacing: 7,padding: EdgeInsets.all(15),children: textSkills(),),
            ),
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
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  texttitle,
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ],
        ),
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xffa1bdfb), borderRadius: BorderRadius.circular(10)),
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
      color: Color(0xffa1bdfb)
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