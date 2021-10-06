import 'package:demo_locations/Demo_Detail/demo_details.dart';
import 'package:demo_locations/Demo_Signature/demo_signature.dart';
import 'package:demo_locations/Demo_WorkProgress/demo_work_progress.dart';
import 'package:demo_locations/demo_timeline.dart';
import 'package:demo_locations/take_picture.dart';
import 'package:demo_locations/result_take_picture.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color bgColor = Colors.green;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TakePicture(),
    DemoDetails(),
    DemoTimelINE(),
    DemoWorkProgress(),
    DemoSignature(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('DEMO APP : LOCATIONS'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => TakePicture()));
              },
              child: Container(
                margin: EdgeInsets.all(30.0),
                child: Text(
                  'TAKE A PICTURE',
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => DemoTimelINE()));
              },
              child: Container(
                margin: EdgeInsets.all(30.0),
                child: Text(
                  'Demo Timeline',
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DemoWorkProgress()));
              },
              child: Container(
                margin: EdgeInsets.all(30.0),
                child: Text(
                  'DEMO WorkProgress',
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => DemoSignature()));
              },
              child: Container(
                margin: EdgeInsets.all(30.0),
                child: Text(
                  'DEMO Signature',
                ),
              ),
            ),
          ],
        ),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'เมนูหลัก',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'รายละเอียด',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'ปฏิบัติงาน',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'ส่งกลับ',
            backgroundColor: bgColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'ปิดงาน',
            backgroundColor: bgColor,
          ),
        ],
      ),
    );
  }
}
