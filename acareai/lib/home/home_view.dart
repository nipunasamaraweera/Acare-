import 'package:acareai/AboutUs/aboutus.dart';
import 'package:acareai/animal%20help/animal_home.dart';
import 'package:acareai/blog%20views/home.dart';
import 'package:acareai/home/profile.dart';
import 'package:acareai/messenger/views/home1.dart';
import 'package:acareai/messenger/views/signin.dart';
import 'package:acareai/virtulavet/AI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class homeView extends StatefulWidget {

  final email, name, profilPic;

  const homeView({ Key key, this.email, this.name, this.profilPic }) : super(key: key);

  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  Function get toggleView => null;

  @override
  Widget build(BuildContext context) {

    print('home email ' + widget.email.toString());

    var size = MediaQuery.of(context).size;
    return Scaffold(
    
       
      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
              alignment: Alignment.topCenter,
                  image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/568/845/216/dark-blue-blur-gradation-wallpaper-preview.jpg'),
                  fit: BoxFit.cover,
                  ),
              ),
          ),

          SafeArea(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(
 
                children: <Widget>[
                  Container(
                    height : 200,
                    child : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 68,
                          backgroundImage: NetworkImage('https://image.freepik.com/free-vector/cute-corgi-dog-eating-bone-cartoon_138676-2534.jpg'),
                        ),
                        SizedBox(width : 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start ,
                          children: <Widget>[
                          Text('ACare', style: GoogleFonts.archivo(textStyle:TextStyle(fontSize: 30, color: Colors.cyanAccent)) ),
                          Text('With VIrtual Vet',style: GoogleFonts.oxygen(textStyle:TextStyle(fontSize: 20, color: Colors.cyanAccent))),
                        ],)
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                     mainAxisSpacing: 10,
                     crossAxisSpacing: 10,
                     primary: false,

                     children: <Widget>[
                       GestureDetector(
                                                child: Card(
                                                  color: Colors.transparent,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8)
                           ) ,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:<Widget> [
                             Lottie.network('https://assets9.lottiefiles.com/packages/lf20_sDO0PX.json',height: 128),
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
                             borderRadius: BorderRadius.circular(8)
    
                           ) ,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:<Widget> [
                             Lottie.network('https://assets9.lottiefiles.com/packages/lf20_syqnfe7c.json',height: 128),
                             Text('Profile', style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
                           ],),

                       ),
                        onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder:(context) =>Profile(
                           email: widget.email,
                           name: widget.name,
                           profilPic: widget.profilPic,
                          ) ));
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
                             Lottie.network('https://assets4.lottiefiles.com/packages/lf20_96bovdur.json',height: 128),
                             Text('Virtual Vet', style: GoogleFonts.openSans(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
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
                             Lottie.network('https://assets1.lottiefiles.com/packages/lf20_lKnuQT.json',height: 128),
                             Text('Messages', style: GoogleFonts.openSans(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
                           ],),

                       ),
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder:(context) =>Home()));
                       }
                        ),
                         GestureDetector(
                                                  child: Card(
                                                    color: Colors.transparent,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(16)
                           ) ,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:<Widget> [
                             Lottie.network('https://assets4.lottiefiles.com/packages/lf20_2qmtqq0y.json',height: 128),
                             Text('Help Animals',style: GoogleFonts.openSans(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
                           ],),

                       ),
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder:(context) =>AnimalHome() ));
                       }
                        ),
                        GestureDetector(
                                                  child: Card(
                                                    color: Colors.transparent,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(16)
                           ) ,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:<Widget> [
                             Lottie.network('https://assets9.lottiefiles.com/private_files/lf30_oSaQwF.json',height: 128),
                             Text('About Us', style: GoogleFonts.openSans(textStyle:TextStyle(fontSize:20, color: Colors.teal ),))
                           ],),

                       ),
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder:(context) =>AboutUs() ));
                       }
                        ),
                     ],
                     crossAxisCount: 2
                      ),
                  )
                  

                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}