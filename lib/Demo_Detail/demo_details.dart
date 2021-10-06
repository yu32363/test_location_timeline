import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DemoDetails extends StatefulWidget {
  const DemoDetails({Key? key}) : super(key: key);

  @override
  _DemoDetailsState createState() => _DemoDetailsState();
}

class _DemoDetailsState extends State<DemoDetails> {
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heigthSize = MediaQuery.of(context).size.height * 0.2;
    Color bgColor = Colors.grey.shade300;

    var drivers = ['driver1', 'driver2', 'driver3', 'driver3', 'driver3'];

    Widget headTitleBar(String title, Icon icon) {
      return Column(
        children: [
          ListTile(
            leading: icon,
            title: Text('$title'),
          ),
          Divider(
            color: Colors.amber,
            height: 1,
            thickness: 2,
            endIndent: 15,
            indent: 15,
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดงาน'),
        actions: [
          StreamBuilder(
            stream: Stream.periodic(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text(
                    DateFormat('hh:mm:ss').format(DateTime.now()),
                  ),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widthSize,
                  height: heigthSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: bgColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headTitleBar('ข้อมูลรถ', Icon(Icons.train)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ประเภท: รถตู้เย็น'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ทะเบียน: 4กท3236'),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widthSize,
                  //height: heigthSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: bgColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      headTitleBar('พนักงานที่ไปกับรถ', Icon(Icons.people)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 200, minHeight: 56.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: drivers.length,
                              itemBuilder: (context, index) {
                                return Text('- ${drivers[index]}');
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widthSize,
                  height: heigthSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: bgColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headTitleBar('ข้อมูลรถ', Icon(Icons.pin_drop)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ประเภท: รถตู้เย็น'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ทะเบียน: 4กท3236'),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widthSize,
                  height: heigthSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: bgColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headTitleBar('ข้อมูลรถ', Icon(Icons.air_rounded)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ประเภท: รถตู้เย็น'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ทะเบียน: 4กท3236'),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widthSize,
                  height: heigthSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), color: bgColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headTitleBar('ข้อมูลรถ', Icon(Icons.mic)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ประเภท: รถตู้เย็น'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ทะเบียน: 4กท3236'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
