import 'package:flutter/material.dart';
import 'package:flutter_application_1/class1.dart';
import 'package:flutter_application_1/class2.dart';
import 'package:flutter_application_1/class5.dart';
import 'package:flutter_application_1/class6.dart';
import 'package:url_launcher/url_launcher.dart';
import 'class3.dart';
import 'class7.dart';
import 'main.dart';

// หน้าแรก

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home> {
  final Uri _url = Uri.parse(
      'https://docs.google.com/forms/d/e/1FAIpQLSf06B-u22fPhmgPRVm4P8glxNDk3Qpgu-ISJ5v_wLmsqGIFIA/viewform?usp=publish-editor');
  var _colors = [
    Color(0xffff78a3),
    Color(0xffff9178),
    Color(0xffffd578),
    Color(0xff78ffd5),
    Color(0xff78a3ff),
    Color(0xffa1bdfb),
  ];

  var _nameColor = [
    Color(0xffdcb7b9),
    Color(0xfff2d5f8),
    Color(0xffe6c0e9),
    Color(0xffbfabcb),
    Color(0xff8d89a6)
  ];
  var caption = [
    'ไฟฟ้ากำลัง',
    'การบัญชี',
    'เทคโนโลยีสารสนเทศ',
    'อาหารและโภชนาการ',
    'การจัดการโลจิติกส์',
    'เครื่องกล'
  ];
  var _name = [
    'ว่าที่ร้อยตรีฐีพงศ์ แสนอุบล',
    'นางสาวกัลยาณี กุลวงษ์',
    'นายวรดร เมืองเหมอะ',
    'นางสาวกรเกศ สิงค์โสภา'
  ];
  var _nametitle = [
    'ผู้อำนวยการ',
    'รองผู้อำนวยการฝ่ายวิชาการ',
    'รองผู้อำนวยการฝ่ายทรัพยากร',
    'รองผู้อนวยการฝ่ายแผนงาน'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/profile.jpg'),
                      fit: BoxFit.fitWidth)),
            ),
            Text(
              'แผนก',
              style: textStyle(),
            ),
            SizedBox(height: 10,),
            SizedBox(
                height: 240,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  padding: EdgeInsets.all(5),
                  children: gridChildren(),
                )),
            Text(
              'คณะผู้บริหาร',
              style: textStyle(),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color:Colors.blueGrey,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('image/Ec/all.gif')
                ],
              )
            ),
            SizedBox(height: 20,),
            Container(child: Center(child: Column(children: [bin()],),)),
           // SizedBox(height: 200,child: PageView(children: [Container(color: Colors.blue,),Container(color: Colors.red,)],),)
            
          ],
        ),
      ),
    ));
    
  }

  TextStyle textStyle() => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: Colors.black54
      );

  List<Widget> gridChildren() =>
      List.generate(caption.length, (i) => _captions(caption[i], _colors[i]));

  Widget _captions(String textCaption, var colors) => InkWell(
        onTap: () {
          gotopage(textCaption);
        },
        child: Container(
          padding: EdgeInsets.all(6),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textCaption,
                  style: TextStyle(color: Colors.white),
                )
              ]),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: colors, borderRadius: BorderRadius.circular(20)),
        ),
      );

  void gotopage(String title) {
    Widget page;
    if (title == 'ไฟฟ้ากำลัง') {
      page = Class1();
    } else if (title == 'การบัญชี') {
      page = Class2();
    } else if (title == 'เทคโนโลยีสารสนเทศ') {
      page = Page2();
    } 
     else if (title == 'อาหารและโภชนาการ') {
      page = Class5();
    } else if (title == 'การจัดการโลจิติกส์') {
      page = Class6();
    }else if (title == 'เครื่องกล') {
      page = Class7();
    } else {
      return;
    }
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final slideAnimation = Tween<Offset>(
                begin: Offset(1, 0), // เริ่มจากขวา
                end: Offset(0, 0), // เข้าตรงกลาง
              ).animate(animation);
              return SlideTransition(
                position: slideAnimation,
                child: child,
              );
            }));
  }
  Widget bin() => ElevatedButton(
      onPressed: _launchInBrowserView, child: Text('แบบสอบถาม'));

  Future<void> _launchInBrowserView() async {
    if (!await launchUrl(_url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $_url');
    }
  }
  
}
