import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResultTakePicture extends StatefulWidget {
  final LatLng savedLatLong;
  final String image;
  const ResultTakePicture(
      {Key? key, required this.savedLatLong, required this.image})
      : super(key: key);

  @override
  _ResultTakePictureState createState() => _ResultTakePictureState();
}

class _ResultTakePictureState extends State<ResultTakePicture> {
  bool isInit = true;

  GoogleMapController? myMapController;
  @override
  Widget build(BuildContext context) {
    var savedLatLong = widget.savedLatLong;
    return Scaffold(
      appBar: AppBar(
        title: Text('TEXT And Location'),
      ),
      body:

          ///Google Map Box
          Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  color: Colors.black12,
                  width: 200,
                  height: 200,
                  child: Image.file(File(widget.image))),
              SizedBox(
                height: 20.0,
              ),
              Text(
                  'Latitude: ${widget.savedLatLong.latitude} \nLongitude: ${widget.savedLatLong.longitude}'),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    ///Wait and get LatLong values from initState.
                    /// target: get LatLong and then plot on the map.
                    /// zooom: zoom-in
                    GoogleMap(
                      initialCameraPosition:
                          CameraPosition(target: widget.savedLatLong, zoom: 15),
                      mapType: MapType.normal,
                      ////Use this if Latlong have change but this will show USER's Current Location anyway.
                      ///
                      // onCameraMove: (CameraPosition cameraPosition) {
                      //   savedLatLong = cameraPosition.target;
                      // },

                      myLocationEnabled: true,
                    ),
                  ],
                ),

                ////Get google Map to show
              ),
            ],
          ),
        ),
      ),
    );
  }
}
