import 'package:flutter/material.dart';
import './home_live.dart';
import './home_word.dart';
import './home_palmstation_guide.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: const Center(
              child: Text('HOME',
                  style: TextStyle(
                    color: Colors.black,
                  ))),
          actions: const <Widget>[
            Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleSection,
              HomeLive(),
              HomeWord(),
              HomePalmstationGuide(),
            ],
          ),
        ),
      ),
    );
  }

  final Widget _titleSection = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bar.png"),
            repeat: ImageRepeat.repeatY,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              '말씀의 권세와 영혼이 영원토록 사는 축복',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Text(
              '시대 성경, 요한계사록 14장 6절, 요한복음 5장 24절, 요한복음 6장 58절',
              style:
              TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
            ),
          ],
        ),
      ),
    ],
  );
}
