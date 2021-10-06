import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoWorkProgress extends StatefulWidget {
  const DemoWorkProgress({Key? key}) : super(key: key);

  @override
  _DemoWorkProgressState createState() => _DemoWorkProgressState();
}

class _DemoWorkProgressState extends State<DemoWorkProgress> {
  ////Example Json String
  String timeline =
      '{"workProgress": [{"workId":"1","status":"done","workType":"รับสินค้า","workName":"รับสินค้า พระราม 9","targetTime":"10.30 น.","actualTime":"10.25 น.","contactName":"คุณกาญจนา ชัยพร","contactPhone":"0894567731","details":[{"name":"ส้ม 20 ลัง"},{"name":"แอปเปิล 10 ลัง"}]},{"workId":"2","status":"none","workType":"รับสินค้า","workName":"รับสินค้าคืน ถนนจันทร์ 43 แยก17ฟหกฟหกฟหกฟหก","targetTime":"10.30 น.","actualTime":"","contactName":"คุณกาญจนา ชัยพร","contactPhone":"0894567731","details":[{"name":"ส้ม 20 ลัง"}]},{"workId":"3","status":"inProgress","workType":"ส่งสินค้า","workName":"ส่งสินค้า SSQ","targetTime":"12.30 น.","actualTime":"","contactName":"คุณกาญจนา ชัยพร","contactPhone":"0894567731","details":[{"name":"ส้ม 20 ลัง"},{"name":"แอปเปิล 10 ลัง"},{"name":"องุ่น 10 ลัง"},{"name":"องุ่น 10 ลัง"},{"name":"องุ่น 10 ลัง"},{"name":"องุ่น 10 ลัง"},{"name":"องุ่น 10 ลัง"},{"name":"องุ่น 10 ลัง"},{"name":"องุ่น 10 ลัง"},{"name":"องุ่น 10 ลัง"}]},{"workId":"4","status":"inProgress","workType":"ส่งสินค้า","workName":"ส่งสินค้า เซนทรัลลาดพร้าว","targetTime":"14.30 น.","actualTime":"","contactName":"คุณกาญจนา ชัยพร","contactPhone":"0894567731","details":[{"name":"แอปเปิล 10 ลัง"}]}]}';

  late WorkProgressModel workPrgressData;

  getData() {
    final getdata = jsonDecode(timeline);
    workPrgressData = WorkProgressModel.fromJson(getdata);
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DEMO WorkProgress'),
        ),
        body: workProgressCards());
  }

  Widget workProgressCards() {
    return ListView.builder(
        itemCount: workPrgressData.workProgress.length,
        itemBuilder: (_, index) {
          var work = workPrgressData.workProgress;
          var workStatus = work[index].status;
          return Container(
            height: MediaQuery.of(context).size.height * 0.29,
            child: Card(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_car),
                            Text(
                              'ลำดับที่ ${work[index].workId}',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.green),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              workStatus != 'done'
                                  ? workStatus != 'inProgress'
                                      ? 'สถานะ: ข้าม'
                                      : 'สถานะ: ดำเนินการ'
                                  : 'สถานะ: เสร็จสิ้น',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: workStatus != 'done'
                                      ? workStatus != 'inProgress'
                                          ? Colors.red
                                          : Colors.blue
                                      : Colors.green),
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      height: 5,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                      color: Colors.amber,
                    ),
                    Text(
                      'ชนิดรับงาน: ${work[index].workType}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'ชื่องาน: ${work[index].workName}',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Row(
                      children: [
                        Text(
                          'เวลาเป้าหมาย: ${work[index].targetTime}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          work[index].actualTime == ''
                              ? '  เวลาถึงจริง: -'
                              : '  เวลาถึงจริง: ${work[index].actualTime}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.amber.shade100)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => callDialog(
                                      context,
                                      work[index].workId,
                                      work[index].workName,
                                      work[index].workType,
                                      work[index].targetTime,
                                      work[index].contactName,
                                      work[index].contactPhone,
                                      work[index].details,
                                      work[index].status),
                                );
                              },
                              child: Text(
                                'รายละเอียด',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green)),
                                    onPressed: () {},
                                    child: Text(
                                      'ข้าม',
                                      style: TextStyle(fontSize: 20.0),
                                    )),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green)),
                                    onPressed: () {},
                                    child: Text(
                                      'บันทึก',
                                      style: TextStyle(fontSize: 20.0),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Dialog callDialog(
      BuildContext context,
      String workId,
      String workName,
      String workType,
      String time,
      String contactName,
      String contactPhone,
      List<Detail> details,
      String status) {
    TextStyle textstyle = TextStyle(fontSize: 20.0);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: Colors.amber[100],
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text(
                      '$workId',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 5,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                    color: Colors.amber,
                  ),
                  Text(
                    status != 'done'
                        ? status != 'inProgress'
                            ? 'สถานะ: ข้าม'
                            : 'สถานะ: ดำเนินการ'
                        : 'สถานะ: เสร็จสิ้น',
                    style: textstyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '$workName',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    'ชนิดงาน: $workType',
                    style: textstyle,
                  ),
                  Text(
                    'เวลาเป้าหมาย: $time',
                    style: textstyle,
                  ),
                  Text(
                    'รายการสินค้า: ',
                    style: textstyle,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height *
                          details.length *
                          0.04,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: details.length,
                          itemBuilder: (_, index) {
                            return Text(
                              '   ${index + 1}. ${details[index].name}',
                              style: textstyle,
                            );
                          })),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'ผู้ติดต่อ: $contactName',
                      style: textstyle,
                    ),
                  ),
                  Text(
                    'โทร: $contactPhone',
                    style: textstyle,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade700),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ปิด'),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkProgressModel {
  WorkProgressModel({
    required this.workProgress,
  });

  List<WorkProgress> workProgress;

  factory WorkProgressModel.fromJson(Map<String, dynamic> json) =>
      WorkProgressModel(
        workProgress: List<WorkProgress>.from(
            json["workProgress"].map((x) => WorkProgress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workProgress": List<dynamic>.from(workProgress.map((x) => x.toJson())),
      };
}

class WorkProgress {
  WorkProgress({
    required this.workId,
    required this.status,
    required this.workType,
    required this.workName,
    required this.targetTime,
    required this.actualTime,
    required this.contactName,
    required this.contactPhone,
    required this.details,
  });

  String workId;
  String status;
  String workType;
  String workName;
  String targetTime;
  String actualTime;
  String contactName;
  String contactPhone;
  List<Detail> details;

  factory WorkProgress.fromJson(Map<String, dynamic> json) => WorkProgress(
        workId: json["workId"],
        status: json["status"],
        workType: json["workType"],
        workName: json["workName"],
        targetTime: json["targetTime"],
        actualTime: json["actualTime"],
        contactName: json["contactName"],
        contactPhone: json["contactPhone"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workId": workId,
        "status": status,
        "workType": workType,
        "workName": workName,
        "targetTime": targetTime,
        "actualTime": actualTime,
        "contactName": contactName,
        "contactPhone": contactPhone,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.name,
  });

  String name;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
