import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';

//อาหารและโภชนาการ

class Class5 extends StatefulWidget {
  @override
  State<Class5> createState() => PageState();
}

class PageState extends State<Class5> {
   var _textSkils = ['ความสะอาดและสุขอนามัย','ความคิดสร้างสรรค์','การทำงานเป็นทีม','การจัดการเวลา','ความรับผิดชอบ','การควบคุมอารมณ์และความกดดัน',];
  var _iconSkills = [Icons.health_and_safety,Icons.lightbulb,Icons.groups,Icons.timer,Icons.restaurant,Icons.self_improvement,];
  var _classimage = ['image/food/f1.jpg','image/food/f2.jpg','image/food/f3.jpg','image/food/f4.jpg',];

  var _nameClass = [
    'นางบอพิศ เวิดสูงเนิน'
  ];
  var _levelname = [
    'ครูประจำแผนก',
  ];

  var _image = [
    'image/food/bopic.png'
  ];

  final Uri _urlit = Uri.parse(
      'https://web.facebook.com/profile.php?id=100063552101443');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'อาหารและโภชนาการ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff78ffd5),
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
           Container(padding: EdgeInsets.all(30),child: Column(children: [Text('     แผนกอาหารและโภชนาการ เน้นการประกอบอาหารอย่างถูกสุขลักษณะ การคำนวณโภชนาการ และการบริการอาหาร เพื่อให้ผู้เรียนทำงานได้อย่างมีคุณภาพและปลอดภัย',textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.black54,),)],),),
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
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
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
            color: Color(0xff78ffd5), borderRadius: BorderRadius.circular(10)),
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
    child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Icon(_iconSkills[i],color: Colors.black54,),Text(_textSkils[i],style: TextStyle(fontSize: 10,color: Colors.black54),)],),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color(0xff78ffd5),
  )));


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