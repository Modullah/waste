import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:waste/controller/image_notifier.dart';
import 'package:provider/provider.dart';
import 'waste.dart';
import 'dart:io';

import 'package:location/location.dart';

class Gallery extends StatefulWidget {

  const Gallery({ Key? key}) : super(key: key);


  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    //ImageNotifier imageNotifier = Provider.of<ImageNotifier>(context);
    return Scaffold(
      appBar: AppBar(title: Text('New Post')),
      body: Container(
        alignment:Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            imageUrl == null ? CircularProgressIndicator(color: Colors.amberAccent) : Row()
            // Waste(
            //   onFileChanged: (imageUrl){
            //     setState(() {
            //       this.imageUrl = imageUrl;
            //     });
            //   }
            // )
            //imageUrl != null ? Image.file(imageUrl) : CircularProgressIndicator(color: Colors.amberAccent);

          ],
        ),
      ),
    );
  }




}