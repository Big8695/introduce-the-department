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
  'image/it/it7.jpg',
  'image/it/it8.jpg',
  'image/it/it9.jpg',
  'image/it/it10.jpg',
  'image/it/it11.jpg',
  'image/it/it12.jpg',
  'image/it/it13.jpg',
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
            Container(height: 200,child: PageView(children: [con(_itImage[0]),con(_itImage[1]),con(_itImage[2]),con(_itImage[3]),con(_itImage[4]),con(_itImage[5]),con(_itImage[6]),con(_itImage[7]),con(_itImage[8]),con(_itImage[9]),con(_itImage[10]),con(_itImage[11]),con(_itImage[12])],),),
            Container(width: double.infinity ,padding: EdgeInsets.all(30), child: Column( children: [Text('''   แผนกเทคโนโลยีสารสนเทศเป็นสาขาวิชาที่มุ่งเน้นการศึกษาเกี่ยวกับการใช้คอมพิวเตอร์และเทคโนโลยีสารสนเทศเพื่อจัดการข้อมูลการพัฒนาระบบ🌟 ชวนมาเรียนที่วิทยาลัยการอาชีพวิเชียรบุรีหากคุณอยากมีทักษะไอทีที่ใช้งานได้จริงพร้อมประสบการณ์ตรงจากการลงมือปฏิบัติวิทยาลัยการอาชีพวิเชียรบุรี คือทางเลือกที่ใช่ เรียนสนุก ได้ความรู้ มีอนาคต และพร้อมสู่ตลาดแรงงานยุคดิจิทัล เรียนจบมีงานทำ🚀
            ''',textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.black54,),)],),),
            SizedBox(
              height: 20,
            ),
            Text('Soft Skils',style: textStyle(),),
            SizedBox(height: 200, child: GridView.count(crossAxisCount: 3,childAspectRatio: 3/2,crossAxisSpacing: 7,mainAxisSpacing: 7,padding: EdgeInsets.all(15),children: textSkills(),),),

            SizedBox(
              height: 20,
            ),
            Text('บุคลากรแผนก',style: textStyle(),),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              height: 200,
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

  List<Widget> textSkills() => List.generate(_textSkills.length, (i) => InkWell(
    onTap: () => gotopage(_textSkills[i]),
    child: Container(
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

  void gotopage(var _caption){
    String _title;
    String _content;
    if(_caption == 'การคิดวิเคราะห์'){
      _title = 'การคิดวิเคราะห์';
      _content = 'การเรียนเทคโนโลยีสารสนเทศช่วยฝึกให้คิดอย่างเป็นระบบ วิเคราะห์ข้อมูลและปัญหาได้อย่างแม่นยำ สามารถนำความรู้ไปประยุกต์ใช้ได้จริงทั้งในการเรียนและการทำงานในอนาคต' ;
    }else if(_caption == 'การแก้ปัญหา'){
      _title = 'การแก้ปัญหา';
      _content = 'นักศึกษาจะได้ฝึกแก้ปัญหาจากสถานการณ์จริงด้านคอมพิวเตอร์และเทคโนโลยี ทำให้กล้าคิด กล้าตัดสินใจ และพร้อมรับมือกับปัญหาในโลกการทำงาน';
    }else if(_caption == 'การสื่อสาร'){
      _title = 'การสื่อสาร';
      _content = 'เรียนรู้การสื่อสารด้านเทคโนโลยี การนำเสนอผลงาน และการอธิบายงานอย่างเข้าใจง่าย ช่วยสร้างความมั่นใจและทำงานร่วมกับผู้อื่นได้อย่างมีประสิทธิภาพ';
    }else if(_caption == 'ทำงานเป็นทีม'){
      _title = 'ทำงานเป็นทีม';
      _content = 'ฝึกทำงานกลุ่มผ่านกิจกรรมและโครงงานด้านไอที เรียนรู้การแบ่งหน้าที่ ความรับผิดชอบ และการทำงานร่วมกันอย่างมืออาชีพ';
    }else if(_caption == 'การบริหารเวลา'){
      _title = 'การบริหารเวลา';
      _content = 'การเรียนไอทีช่วยพัฒนาทักษะการวางแผนและจัดการเวลา ทั้งการเรียนและการทำโครงงาน ทำให้ทำงานได้ตรงเวลาและมีคุณภาพ';
    }else if(_caption == 'ความคิดสร้างสรรค์'){
      _title = 'ความคิดสร้างสรรค์';
      _content = 'เปิดโอกาสให้นักศึกษาใช้ความคิดสร้างสรรค์ในการสร้างผลงานด้านเทคโนโลยี เช่น เว็บไซต์ แอปพลิเคชัน และสื่อดิจิทัล ต่อยอดสู่สายอาชีพได้จริง';
    }
    else{
      return;
    }
    materialAlert(
      context,
      title: _title,
      content: _content
    );
  }

  void materialAlert(BuildContext context,{String title = '',String content = ''}){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black54),),
      content: Text(content,style: TextStyle(color: Colors.black54),),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text('OK'))
      ],
    ));
  }
}