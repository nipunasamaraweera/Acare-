import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogView extends StatefulWidget {
  final String imgUrl, title, description, authorName;
  const BlogView({ Key key,
  @required this.imgUrl,
      @required this.title,
      @required this.description,
      @required this.authorName }) : super(key: key);

  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(widget.title),
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
                widget.imgUrl,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'By ' + widget.authorName,
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