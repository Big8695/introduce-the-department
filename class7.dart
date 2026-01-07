import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';

// เครื่องกล

class Class7 extends StatefulWidget {
  @override
  State<Class7> createState() => PageState();
}

class PageState extends State<Class7> {
  var _textSkils = ['ความรอบคอบและละเอียด','การคิดวิเคราะห์และแก้ปัญหา','ความมีวินัยและความอดทน','การทำงานเป็นทีม','ความปลอดภัยในการทำงาน','การเรียนรู้เทคโนโลยีใหม่',];
  var _iconSkills = [Icons.precision_manufacturing,Icons.build,Icons.fitness_center,Icons.groups,Icons.warning_amber,Icons.engineering,];
  var _classimage = ['image/mechenical/me1.jpg','image/mechenical/me2.jpg','image/mechenical/me3.jpg','image/mechenical/me4.jpg',];
  var _nameClass = [
    'นายสุชาติ วงษ์โพธิ์',
    'นายสนิท โสมา',
    'นายทักษิณ โสมณะวัตร',
    'นายอภิรักษ์ บุญดัด',
    'นายวชิระพันธ์ คันธมาศน์'
  ];
  var _levelname = [
    'ครูประจำแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก',
  ];

  var _image = [
    'image/mechenical/s.png',
    'image/mechenical/sadit.png',
    'image/mechenical/tust.png',
    'image/mechenical/ape.png',
    'image/mechenical/wasaren.png'
  ];

  final Uri _urlit = Uri.parse(
      'https://web.facebook.com/groups/1393999217514843/?_rdc=1&_rdr');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'เครื่องกล',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 222, 161, 251),
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
            Container(padding: EdgeInsets.all(30),child: Column(children: [Text('     แผนกเครื่องกล มุ่งเน้นงานเครื่องยนต์ เครื่องจักรกล และการซ่อมบำรุง เพื่อให้ผู้เรียนมีทักษะการทำงานจริง ควบคู่กับความปลอดภัย',textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.black54,),)],),),
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
            ),
            
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
            color: Color.fromARGB(255, 222, 161, 251), borderRadius: BorderRadius.circular(10)),
      );

  Widget con(var text) => Container(
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(text),fit: BoxFit.cover)
    ),
  );

  List<Widget> textSkills() => List.generate(_textSkils.length, (i) => InkWell(
    onTap: () => gotopage(_textSkils[i]),
    child: Container(
    padding: EdgeInsets.all(5),
    child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Icon(_iconSkills[i],color: Colors.white70,),Text(_textSkils[i],style: TextStyle(fontSize: 10,color: Colors.white70),)],),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 222, 161, 251)
    ),
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
    if(_caption == 'ความรอบคอบและละเอียด'){
      _title = 'ความรอบคอบและละเอียด';
      _content = 'นักศึกษาจะได้เรียนรู้ทักษะการทำงานที่ต้องใช้ความรอบคอบและความละเอียดในการตรวจสอบชิ้นส่วนเครื่องจักร เพื่อป้องกันความผิดพลาดในการซ่อมบำรุง';
    }else if(_caption == 'การคิดวิเคราะห์และแก้ปัญหา'){
      _title = 'การคิดวิเคราะห์และแก้ปัญหา';
      _content = "นักศึกษาจะได้เรียนรู้ทักษะการวิเคราะห์ปัญหาที่เกิดขึ้นกับเครื่องจักร และการหาวิธีแก้ไขปัญหาอย่างมีประสิทธิภาพ";
    }else if(_caption == 'ความมีวินัยและความอดทน'){
      _title = 'ความมีวินัยและความอดทน';
      _content = 'นักศึกษาจะได้เรียนรู้การมีวินัยในการทำงาน และการอดทนต่อสภาพแวดล้อมการทำงานที่อาจมีความยากลำบาก เช่น เสียงดัง ฝุ่นละออง หรือสภาพอากาศที่ไม่เอื้ออำนวย';
    }else if(_caption == 'การทำงานเป็นทีม'){
      _title = 'การทำงานเป็นทีม';
      _content = 'นักศึกษาจะได้เรียนรู้การทำงานร่วมกับผู้อื่นในการซ่อมบำรุงเครื่องจักร การแบ่งหน้าที่ และการประสานงานอย่างมีประสิทธิภาพ';
    }else if(_caption == 'ความปลอดภัยในการทำงาน'){
      _title = 'ความปลอดภัยในการทำงาน';
      _content = 'นักศึกษาจะได้เรียนรู้มาตรฐานและแนวปฏิบัติด้านความปลอดภัยในการทำงานกับเครื่องจักร เพื่อป้องกันอุบัติเหตุและสร้างสภาพแวดล้อมการทำงานที่ปลอดภัย';
    }else if(_caption == 'การเรียนรู้เทคโนโลยีใหม่'){
      _title = 'การเรียนรู้เทคโนโลยีใหม่';
      _content = 'นักศึกษาจะได้เรียนรู้การติดตามและปรับตัวกับเทคโนโลยีใหม่ๆ ที่เกี่ยวข้องกับเครื่องจักรกล เพื่อให้สามารถนำความรู้ไปประยุกต์ใช้ในการทำงานได้อย่างมีประสิทธิภาพ';
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