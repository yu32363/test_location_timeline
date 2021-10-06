import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class DemoTimelINE extends StatefulWidget {
  const DemoTimelINE({Key? key}) : super(key: key);

  @override
  _DemoTimeLineState createState() => _DemoTimeLineState();
}

const kTileHeight = 50.0;

class _DemoTimeLineState extends State<DemoTimelINE> {
  ////Example Json String
  String timeline =
      '{"timelineDemo": [{"title": "บันทึกเวลาถึงที่หมาย","status":"done"},{"title": "ภาพก่อนสินค้าขึ้น","status": "done"},{"title": "อุณหภูมิก่อนขึ้นสินค้า","status": "inProgress"},{"title": "บันทึกเวลาเริ่มขึ้นสินค้า","status": "inProgress"},{"title": "ภาพสินค้าจัดเรียงในรถ","status": "inProgress"},{"title": "บันทึกเวลาขึ้นสินค้าเสร็จ","status": "inProgress"},{"title": "ภาพซีลปิดตู้","status": "inProgress"},{"title": "ประเมิน/ลงนาม","status": "inProgress"},{"title": "บันทึกเวลาออกรถ","status": "inProgress"}]}';

  @override
  Widget build(BuildContext context) {
    final getdata = jsonDecode(timeline);
    TimeLineModel lineData = TimeLineModel.fromJson(getdata);

    return Scaffold(
        appBar: AppBar(
          title: Text('DEMO-TIMELINE'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0,
              connectorTheme: ConnectorThemeData(
                thickness: 5.0,
                color: Color(0xffd3d3d3),
              ),
              indicatorTheme: IndicatorThemeData(
                size: 30.0,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 20.0),
            builder: TimelineTileBuilder.connected(
              /// ความยางของจุดหนึ่งไปอีกจุดหนึ่ง
              itemExtentBuilder: (_, __) => 100.0,
              itemCount: lineData.timelineDemo.length,

              /// ความกว้้างของ จุด (เป็น เปอเซ็น)
              nodePositionBuilder: (_, index) {
                return 0.05;
              },
              //// Contents , In this case I user ListTile and add Button in trailing.
              contentsBuilder: (_, index) {
                print('${lineData.timelineDemo[index].title}');
                return ListTile(
                  title: Text('${lineData.timelineDemo[index].title}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      /* switch (lineData.timelineDemo[index].workid) {
                        case 41:
                            Navigator.push.....
                          break;
                        default:
                      }*/
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: Text('บันทึก'),
                  ),
                );
              },

              //// set line(s) solid or dashed and change there colors
              connectorBuilder: (_, index, __) {
                if (lineData.timelineDemo[index].status == 'done') {
                  return SolidLineConnector(color: Color(0xff6ad192));
                } else {
                  return DashedLineConnector(
                    color: Colors.green,
                  );
                }
              },

              //// config indecator Theme here (Colors, width, shape , etc.)
              indicatorBuilder: (_, index) {
                switch (lineData.timelineDemo[index].status) {
                  case 'done':
                    return DotIndicator(
                      color: Color(0xff6ad192),
                    );
                  case 'inProgress':
                    return OutlinedDotIndicator(
                      color: Color(0xff6ad192),
                      borderWidth: 4.0,
                      backgroundColor: Colors.white,
                    );
                  default:
                    return OutlinedDotIndicator(
                      color: Color(0xffbabdc0),
                      backgroundColor: Color(0xffe6e7e9),
                    );
                }
              },
            ),
          ),
        )));
  }
}

class TimeLineModel {
  TimeLineModel({
    required this.timelineDemo,
  });

  List<TimelineDemo> timelineDemo;

  factory TimeLineModel.fromJson(Map<String, dynamic> json) => TimeLineModel(
        timelineDemo: List<TimelineDemo>.from(
            json["timelineDemo"].map((x) => TimelineDemo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timelineDemo": List<dynamic>.from(timelineDemo.map((x) => x.toJson())),
      };
}

class TimelineDemo {
  TimelineDemo({
    required this.title,
    required this.status,
  });

  String title;
  String status;

  factory TimelineDemo.fromJson(Map<String, dynamic> json) => TimelineDemo(
        title: json["title"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "status": status,
      };
}
