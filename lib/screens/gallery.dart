import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Gallery extends StatefulWidget {

  const Gallery({ Key? key, }) : super(key: key);
 

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  
  String url = '';

  var tmp = true;
  var _image;
  var imagePicker;

  void pickImage() async {
    //image = (await ImagePicker().pickImage(source: ImageSource.gallery)) as Future;
    // try{
      print('hi, before pick image');
      XFile image = await imagePicker.pickImage(source: ImageSource.camera);
      print('after pick image');

      //if (image == null) return;
      //final path = image.path;

    // } catch (err) {
    //   print('Caught error: $err');
    // }
   
    // Reference reference = FirebaseStorage.instance.ref().child("placeholder.jpg");
    // UploadTask uploadTask = reference.putFile(imagePath);

    // uploadTask.whenComplete(() async {
    //   url = await reference.getDownloadURL();
    //   print(url);
    // }).catchError((onError) {
    //   print(onError);
    // });

    //print(url);
    setState(() {
      _image = File(image.path);
    });
  }

  @override void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }
  
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
            ElevatedButton(onPressed: () => pickImage(), child: Text('Button')),
            if (_image != null) Image.file(_image, width: 160, height: 160, fit: BoxFit.cover) 
            //img != null ? FlutterLogo(size: 160) : Image.file(img!, width: 160, height: 160, fit: BoxFit.cover,),
         ],
        ),
      ),
    );
  }

}