import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalCrudMethods {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance.collection("posts").add(blogData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return FirebaseFirestore.instance.collection("posts").snapshots();
  }
}



