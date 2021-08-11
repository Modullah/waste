

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:waste/screens/camera.dart';


class Waste extends StatefulWidget {
  const Waste({ Key? key }) : super(key: key);

  @override
  _WasteState createState() => _WasteState();
}

class _WasteState extends State<Waste> {
  var loading = true;
  File? image;
  final picker = ImagePicker();

  void pickImage(ImageSource source) async {
    try{
    final pickedFile = await picker.pickImage(source: source);
    final imageTemp = File(pickedFile!.path);
    setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  
  CollectionReference ref = FirebaseFirestore.instance.collection('post');

  @override
  Widget build(BuildContext context) {
    return loading == false ? crclProgInd(): waste();
  }

  waste(){
    return Scaffold(
      appBar: AppBar(title: Text('Waste')),
      floatingActionButton: camera(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          return !snapshot.hasData ? const Text('Loading...') : ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot post = snapshot.data.docs[index];
              return ListTile(
                leading: Text(post['quantity'].toString(),
                
                ),
              );
            }
          
          );

        } 
      
      ),
    );
  }

  crclProgInd() {
    return Center(
      child: CircularProgressIndicator()
    );
  }

  Widget camera(){
    return FloatingActionButton(
      child: Icon(Icons.camera_alt),
      onPressed: () => pickImage(ImageSource.gallery),
    );
  }
  //onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Camera()))
}