import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DemoSignature extends StatefulWidget {
  const DemoSignature({Key? key}) : super(key: key);

  @override
  _DemoSignatureState createState() => _DemoSignatureState();
}

class _DemoSignatureState extends State<DemoSignature> {
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  void initState() {
    super.initState();
    _signatureController.addListener(() => print('Value changed'));
  }

  late Uint8List? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo - Signature'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            //SIGNATURE CANVAS
            Signature(
              controller: _signatureController,
              height: 250,
              width: 300.0,
              backgroundColor: Colors.grey.shade200,
            ),
            //OK AND CLEAR BUTTONS
            Container(
              width: 300.0,
              //decoration: const BoxDecoration(color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //SHOW EXPORTED IMAGE IN NEW ROUTE
                  Container(
                    width: 150.0,
                    color: Colors.green,
                    child: TextButton(
                      //icon: const Icon(Icons.check),
                      //color: Colors.blue,
                      child: Text(
                        'บันทึก',
                        style: TextStyle(color: Colors.white),
                      ),

                      onPressed: () async {
                        if (_signatureController.isNotEmpty) {
                          data = await _signatureController.toPngBytes();
                          if (data != null) {
                            await Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return Scaffold(
                                    appBar: AppBar(),
                                    body: Center(
                                      child: Container(
                                        color: Colors.grey[300],
                                        child: Image.memory(data!),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                  //CLEAR CANVAS
                  Container(
                    width: 150.0,
                    color: Colors.red,
                    child: IconButton(
                      icon: const Icon(Icons.clear),
                      //color: Colors.blue,
                      onPressed: () {
                        setState(() => _signatureController.clear());
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: const Center(
                  // child: Image.memory(data),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
