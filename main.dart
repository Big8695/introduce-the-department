import 'package:flutter/material.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        /*Image.asset(
          'test/image.png',
          width: 360,
        ),*/
        Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.lightBlueAccent,
            ]),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1000),
                bottomRight: Radius.circular(1000)),
          ),
        ),
        Spacer(flex: 1),
        Text(
          'Welcome',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text('นี้คือแอปแนะนำแผนก'),
        Spacer(flex: 1),
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 700),
                pageBuilder: (context, animation, secondaryAnimation) => Home(),
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
                },
              ),
            );
          },
          icon: const Text("Skip"),
          label: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ]),
    );
  }
}
