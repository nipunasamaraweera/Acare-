import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimalBlog extends StatefulWidget {
  final String img, phone, description, name;
  const AnimalBlog({ Key key, 
   @required this.img,
      @required this.phone,
      @required this.description,
      @required this.name
         }) : super(key: key);

  @override
  _AnimalBlogState createState() => _AnimalBlogState();
}

class _AnimalBlogState extends State<AnimalBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
     //backgroundColor: Colors.,
      body:
       SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 150,
              child: Image.network(
                widget.img,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'contact ' + widget.phone,
              style: GoogleFonts.openSans(textStyle:TextStyle(fontSize:17, color: Colors.white ),)
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // alignment: ,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget. description,
                  style:GoogleFonts.cairo(textStyle:TextStyle(fontSize:15, color: Colors.white ),)
                ),
              ),
            )
          ],
        ),
      ),
      
      
    );
  }
}