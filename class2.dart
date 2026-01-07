import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'dart:async';

// การบัญชี

class Class2 extends StatefulWidget {
  @override
  State<Class2> createState() => PageState();
}

class PageState extends State<Class2> {
  var _textSkils = ['ความละเอียดรอบคอบ','ความซื่อสัตย์และจรรยาบรรณ','การคิดวิเคราะห์ตัวเลข','การบริหารเวลา','ความรับผิดชอบ','การสื่อสารทางธุรกิจ',];
  var _iconSkills = [Icons.fact_check,Icons.verified_user,Icons.analytics,Icons.schedule,Icons.assignment_turned_in,Icons.business_center,];
  var _classimage = ['image/acc/acc1.jpg','image/acc/acc2.jpg','image/acc/acc3.jpg','image/acc/acc4.jpg',];
  
  var _nameClass = [
    'นางบอพิศ เวิดสูงเนิน',
    'นางวาสนา เวฬุวนารักษ์',
    'นางจิราภา กงยนต์',
    'นางสาวศิริลักษณ์ บัวเผื่อน'
  ];
  var _levelname = [
    'ครูประจำแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก',
    'ครูประจำแผนก'
  ];

  var _image = [
    'image/acc/Bopis.png',
    'image/acc/Vasana.jpg',
    'image/acc/Jirapha.jpg',
    'image/acc/reuse.jpg',
  ];

  final Uri _urlit = Uri.parse(
      'https://web.facebook.com/accwicec?_rdc=1&_rdr');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'การบัญชี',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffff9178),
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
            Container(padding: EdgeInsets.all(30),child: Column(children: [Text('     แผนกการบัญชี มุ่งเน้นการเรียนรู้ด้านการบันทึกบัญชี การจัดทำงบการเงิน ภาษี และการใช้โปรแกรมบัญชี เพื่อให้ผู้เรียนมีความถูกต้อง รอบคอบ และมีจรรยาบรรณทางวิชาชีพ',textAlign: TextAlign.start ,style: TextStyle(fontSize: 12,color: Colors.black54,),)],),),
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
            color: Color(0xffff9178), borderRadius: BorderRadius.circular(10)),
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
      color: Color(0xffff9178)
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
    if(_caption == 'ความละเอียดรอบคอบ'){
      _title = 'ความละเอียดรอบคอบ';
      _content = 'การเรียนบัญชีต้องการความแม่นยำและความรอบคอบสูง นักศึกษาจะได้ฝึกทักษะเหล่านี้ผ่านการบันทึกบัญชีและการจัดทำงบการเงินอย่างถูกต้อง'; ;
    }else if(_caption == 'ความซื่อสัตย์และจรรยาบรรณ'){
      _title = 'ความซื่อสัตย์และจรรยาบรรณ';
      _content = "นักศึกษาจะได้เรียนรู้ความสำคัญของจรรยาบรรณทางวิชาชีพในการทำงานบัญชี เช่น การรักษาความลับของข้อมูลทางการเงิน และการปฏิบัติตามกฎหมายที่เกี่ยวข้อง";
    }else if(_caption == 'การคิดวิเคราะห์ตัวเลข'){
      _title = 'การคิดวิเคราะห์ตัวเลข';
      _content = 'คิดวิเคราะห์ตัวเลขเป็นทักษะสำคัญในการทำบัญชี นักศึกษาจะได้ฝึกวิเคราะห์ข้อมูลทางการเงิน เพื่อตัดสินใจและแก้ไขปัญหาทางธุรกิจ';
    }else if(_caption == 'การบริหารเวลา'){
      _title = 'การบริหารเวลา';
      _content = 'บริหารเวลาเป็นทักษะที่จำเป็นสำหรับนักบัญชี เนื่องจากต้องจัดการงานหลายอย่างพร้อมกัน นักศึกษาจะได้เรียนรู้วิธีการวางแผนและจัดลำดับความสำคัญของงานต่างๆ อย่างมีประสิทธิภาพ';
    }else if(_caption == 'ความรับผิดชอบ'){
      _title = 'ความรับผิดชอบ';
      _content = 'ความรับผิดชอบเป็นคุณสมบัติที่สำคัญสำหรับนักบัญชี นักศึกษาจะได้เรียนรู้การรับผิดชอบต่อหน้าที่การงาน และการทำงานอย่างมีคุณภาพเพื่อสร้างความน่าเชื่อถือในสายอาชีพ';
    }else if(_caption == 'การสื่อสารทางธุรกิจ'){
      _title = 'การสื่อสารทางธุรกิจ';
      _content = 'นักศึกษาจะได้ฝึกทักษะการสื่อสารที่มีประสิทธิภาพ ทั้งการเขียนรายงานทางการเงินและการนำเสนอข้อมูลต่อผู้บริหารหรือบุคคลภายนอกองค์กร';
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