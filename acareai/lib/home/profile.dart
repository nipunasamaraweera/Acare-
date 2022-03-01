import 'package:acareai/blog%20views/home.dart';
import 'package:acareai/messenger/views/home1.dart';
import 'package:acareai/virtulavet/AI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatefulWidget {

  final email, name, profilPic;

  const Profile({ Key key,  this.email, this.name, this.profilPic}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
  print('gg' + widget.email.toString());
  print('gg name' + widget.name.toString());
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
                image: DecorationImage(
              alignment: Alignment.topCenter,
                  image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/568/845/216/dark-blue-blur-gradation-wallpaper-preview.jpg'),
                  fit: BoxFit.cover,
                  ),
              ),
          
                  child: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.profilPic
                      ),
                      radius: 72,
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 16.0),
                Text(widget.email,
                style: TextStyle(fontSize: 18.0),
                ),
                //buttons here
                  SizedBox(height : 16,),
                 GestureDetector(
                                                  child: Card(
                             color: Colors.transparent,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8)
                               
                             ) ,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                             children:<Widget> [
                               Lottie.network('https://assets9.lottiefiles.com/packages/lf20_fGseie.json',height: 128,width: 370),
                               Text('Blog', style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
                             ],),

                           ),
                           onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder:(context) =>HomePage() ));
                          }
                         ),
                           GestureDetector(
                                                  child: Card(
                                                    color: Colors.transparent,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8),
                               
                             ) ,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                             children:<Widget> [
                               Lottie.network('https://assets10.lottiefiles.com/packages/lf20_l13zwx3i.json',height: 128,width: 370),
                               Text('Virtual Vet', style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
                             ],),

                           ),
                           onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder:(context) =>virtualvet() ));
                          }
                         ),
                           GestureDetector(
                                                    child: Card(
                                                      color: Colors.transparent,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8)
                             ) ,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children:<Widget> [
                               Lottie.network('https://assets4.lottiefiles.com/packages/lf20_decvxrvx.json',height: 128,width: 370),
                               Text('Messages', style: GoogleFonts.openSans(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
                             ],),

                         ),
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder:(context) =>Home()));
                         }
                          ),

                        
              ]
            ),
          ),
        ),
      ),
    );
  }
}