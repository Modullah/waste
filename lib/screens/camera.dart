import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:waste/controller/image_notifier.dart';
import 'package:provider/provider.dart';
import 'waste.dart';
import 'dart:io';

import 'package:location/location.dart';

class Camera extends StatefulWidget {

  const Camera({ Key? key}) : super(key: key);


  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  

  @override
  Widget build(BuildContext context) {
    //ImageNotifier imageNotifier = Provider.of<ImageNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: Text('New Post')),
      body: Center(
        child: CircularProgressIndicator(color: Colors.amberAccent,),
      ) ,
    );
  }




}