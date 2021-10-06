import 'dart:async';
import 'dart:io';
import 'package:demo_locations/result_take_picture.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class TakePicture extends StatefulWidget {
  const TakePicture({Key? key}) : super(key: key);

  @override
  _TakePictureState createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  String image = '';
  var picker = ImagePicker();

  ////Location
  bool serviceEnabled = false;
  bool isInit = true;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  late LatLng _updateposition;
  GoogleMapController? myMapController;

  Location location = new Location();

  Future selectImage() async {
    var pickedImage = await picker.getImage(
      source: ImageSource.camera,
    );
    setState(() {
      image = pickedImage!.path;
    });
  }

  Future checkLocationService() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();

    if (mounted) {
      setState(() {
        _updateposition =
            LatLng(_locationData!.latitude!, _locationData!.longitude!);
        isInit = false;
      });
    }

    print('location: $_locationData');
    print('latitude: ${_locationData!.latitude}');
    print('longitude: ${_locationData!.longitude}');
  }

  @override
  void initState() {
    // TODO: implement initState
    checkLocationService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PICTURE and Location'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        color: Colors.black12,
                        width: 200,
                        height: 200,
                        child: image == ''
                            ? Container()
                            : Image.file(File(image))),
                    IconButton(
                      icon: Icon(
                        Icons.add_a_photo,
                        color: image == '' ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        selectImage();
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        // _getCurrentLocation();
                        setState(() {
                          checkLocationService();
                        });

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ResultTakePicture(
                                savedLatLong: _updateposition, image: image)));
                      },
                      child: Text('Save')),
                ),
              ],
            ),
          ),
        ));
  }
}
