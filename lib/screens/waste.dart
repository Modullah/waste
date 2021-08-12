import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:waste/screens/gallery.dart';
import 'dart:io';

class Waste extends StatefulWidget {
  const Waste({ Key? key,}) : super(key: key);
  //final Function (String imageUrl) onFileChanged;  required this.onFileChanged 
  @override
  _WasteState createState() => _WasteState();
}

class _WasteState extends State<Waste> {
  var loading = true;
  File? file; //File
  String url ='';

  // pickImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   image != null ? file = File(image.path) : print(image.toString());
  //   //final pickedImage = File(img?.path ?? '');
  //   // final Reference storageReference = FirebaseStorage.instance.ref().child('placeholder.jpg');
  //   // UploadTask uploadTask = storageReference.child('placeholder.jpg').putFile(pickedImage);
  //   // url = await (await uploadTask).ref.getDownloadURL();
  //   await uploadImage(file);

  //   print(url);
  //   setState(() {
  //     //file = pickedImage;
  //   });
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()));
  // }

  // uploadImage(file) async {
  //   Reference reference = FirebaseStorage.instance.ref().child('path').child('/.jpg');
  //   UploadTask task = reference.putFile(file);
  //   TaskSnapshot snapshot = await task;
  //   url = await snapshot.ref.getDownloadURL();
  // }

  
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
                leading: Text(post['quantity'].toString()),
                title: Text('Placeholder'),
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
      onPressed: () => {},
    );
  }

  // void newPost() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()));
  // }

  // pickImgGallery() {
  //   pickImage();
  //   //uploadImage();
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()));
  // }
  //onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Camera()))
}