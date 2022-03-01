import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({ Key key }) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
     //backgroundColor: Colors.greenAcce,
      body:
       Container(
          decoration: BoxDecoration(
                image: DecorationImage(
              alignment: Alignment.topCenter,
                  image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/568/845/216/dark-blue-blur-gradation-wallpaper-preview.jpg'),
                  fit: BoxFit.cover,
                  ),
              ),
                child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.transparent)),
                child: Lottie.network('https://assets1.lottiefiles.com/packages/lf20_rLfMZE.json',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.transparent)),
                            child: Text(
                  'If u need any information about the application send a message to the number below or send an email. ',
                  style: GoogleFonts.openSans(textStyle:TextStyle(fontSize:15, color: Colors.white ),)
                ),
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
                     'Email - Acare@gmail.com',
                    style:GoogleFonts.cairo(textStyle:TextStyle(fontSize:25, color: Colors.white ),)
                  ),
                ),
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
                     'Phone - +94 71 721 5864',
                    style:GoogleFonts.cairo(textStyle:TextStyle(fontSize:23, color: Colors.white ),)
                  ),
                ),
              ),
               SizedBox(
                height: 70,
              ),
            ],
          ),
      ),
       ),
      
    );
  }
}