import 'dart:io';

import 'package:acareai/services/animalcrud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class Help extends StatefulWidget {
  const Help({ Key key }) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}




class _HelpState extends State<Help> {

  
   String name,phone,description;
  File selectedImage;
  bool _isLoading = false;
  final _picker = ImagePicker();
 AnimalCrudMethods animalcrudMethods = new AnimalCrudMethods();

 Future getImage() async { 
    var image = await _picker.getImage(source: ImageSource.gallery);

  setState(() {
        selectedImage = File(image.path);
      });
    }
  


 uploadBlog() async {
    if (selectedImage != null) {
      setState(() {
        _isLoading = true;
      });

    
      
      /// uploading image to firebase storage
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("animalImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final  UploadTask uploadTask = reference.putFile(selectedImage);

      var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      print("this is url $downloadUrl");

      Map<String, String> blogMap = {
        "img": downloadUrl,
        "name": name,
        "phone": phone,
        "desc": description,
      };
      animalcrudMethods.addData(blogMap).then((result) {
        BuildContext context;
                Navigator.of(context);
      });
    } else {}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
          Text("A",style: TextStyle(
            fontSize: 22,
            color: Colors.white70
          ),
          ),
          Text("Care", style: TextStyle(fontSize: 22, color: Colors.blue),)
        ],
        ),
        backgroundColor:Colors.transparent ,
        elevation: 0.0,
       actions: <Widget>[
         GestureDetector(
            onTap: () {
              uploadBlog();
            },
           child: Container(
               padding:EdgeInsets.symmetric(horizontal: 16),
               child: Icon(Icons.file_upload)),
         ),
         
       ],
      ),
      body:  _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : 
      
      Container(
        decoration: BoxDecoration(
                image: DecorationImage(
              alignment: Alignment.topCenter,
                  image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/568/845/216/dark-blue-blur-gradation-wallpaper-preview.jpg'),
                  fit: BoxFit.cover,
                  ),
              ),
              child: Container(child: Column(children: <Widget>[
          SizedBox(height: 10,),
          GestureDetector(
           onTap: () {
            getImage();
                        },
                         child: selectedImage != null
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 170,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    selectedImage,fit: BoxFit.cover,
                                    
                                  ),
                                ),
                              )
            : Container(
              margin:EdgeInsets.symmetric(horizontal:16 ) ,
            height: 150,
             decoration: BoxDecoration(color: Colors.white,
             borderRadius: BorderRadius.circular(6) ) , 
            width: MediaQuery.of(context).size.width,
            child:Icon(Icons.add_a_photo, color: Colors.blue,),
            ),
          ),
          SizedBox(height: 8,),
          Container(
            margin:EdgeInsets.symmetric(horizontal:16 ) ,
            child: Column(children: <Widget>[
            TextField(
            decoration: InputDecoration(hintText: "Name"),
            onChanged:(val){
              name = val;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "phone number"),
            onChanged:(val){
              phone = val;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Description"),
            onChanged:(val){
              description = val;
            },
          ),
          ],
          ),
          )

        ],)
        ,),
      )
      ,
    );
      
    
  }
}