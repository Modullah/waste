import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  int? quantity;
  double? latitude, longitude;
  String? imageUrl;
  DateTime? date;

  Post({quantity, latitude, longitude, imageUrl, date});

  Post.fromMap(Map<String,dynamic> json) {
    quantity = int.parse(json['quantity']);
    latitude = json['latitude'];
    longitude =json['longitude']; 
    imageUrl = json['imageUrl'];
    date = json['date'];
  }

  //  Post.fromSnapshot({DocumentSnapshot snapshot}){
  //   this.date = snapshot.json['date'].toDate();
  //   this.imageUrl = snapshot.json['imageUrl'];
  //   this.quantity = snapshot.json['quantity'];
  //   this.latitude = snapshot.json['latitude'];
  //   this.longitude = snapshot.json['longitude'];
  // }

 
}


//  Post.fromMap(Map<String,dynamic> data) {
//     this.date = data['date'];
//     this.imageUrl = data['imageUrl'];
//     this.quantity = data['quantity'];
//     this.latitude = data['latitude'];
//     this.longitude = data['longitude'];
//   }

//  Post.fromSnapshot({DocumentSnapshot snapshot}){
//     this.date = snapshot.json['date'].toDate();
//     this.imageUrl = snapshot.json['imageUrl'];
//     this.quantity = snapshot.json['quantity'];
//     this.latitude = snapshot.json['latitude'];
//     this.longitude = snapshot.json['longitude'];
//   }