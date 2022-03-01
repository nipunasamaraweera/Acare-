import 'package:acareai/messenger/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key key }) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
final int _numPages = 3;  
final PageController _pageController = PageController(initialPage: 0);
int _currentPage = 0;


List<Widget> _buildPageIndicator() {
  List<Widget> list = [];
  for(int i = 0; i < _numPages; i++){
    list.add(i== _currentPage ? _indicator(true): _indicator(false));
  }
  return list;
}

Widget _indicator(bool isActive){
  return AnimatedContainer(duration: Duration(milliseconds: 150),
  margin: EdgeInsets.symmetric(horizontal:8.0),
  height:8.0 ,
  width: isActive ? 24.0 : 16.0,
  decoration: BoxDecoration(
    color:  isActive ? Colors.white : Color(0xFF7B51D3),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),

  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:SystemUiOverlayStyle.dark ,
                  child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1,0.4,0.7,0.8],
                colors: 
                [Color(0xFF0f35a8),
                Color(0xFF0c1178),
                Color(0xFF090a42),
                Color(0xFF0f0430),
                ],
                 
                ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical:40.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[
                Container(alignment:Alignment.centerRight,
                child: FlatButton(onPressed: () =>print('Skip'),
                child: Text('Skip',
                style: TextStyle(color: Colors.transparent,
                fontSize: 20.0,
                ),
                )
                ,),
                ),
                Container(height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page){
                    setState(() {
                      _currentPage =page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                                          child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child:Lottie.network('https://assets5.lottiefiles.com/private_files/lf30_bk5yj3c9.json',
                        height: 350.0,
                        ),
                        ),
                        SizedBox(height:30.0),
                        Text('Best animal care application with vet support',
                        style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:20, color: Colors.white,fontWeight:FontWeight.bold ),)
                        ),
                        SizedBox(height:15.0),
                         Text('all the support for treat animals from one place',
                        style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:15, color: Colors.white, ),)
                        ),
                        SizedBox(height: 15.0),
                        
 
                      ],
                      ),
                      
                    ),
                     Padding(
                      padding: EdgeInsets.all(20.0),
                                          child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child:Lottie.network('https://assets2.lottiefiles.com/packages/lf20_ZdoRW2.json',
                        height: 350.0,
                        ),
                        ),
                        SizedBox(height:30.0),
                        Text('Best animal care application with vet support',
                        style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:20, color: Colors.white,fontWeight:FontWeight.bold ),)
                        ),
                        SizedBox(height:15.0),
                         Text('all the support for treat animals from one place',
                        style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:15, color: Colors.white, ),)
                        ),
                        SizedBox(height: 15.0),
                        
 
                      ],
                      ),
                      
                    ),
                     Padding(
                      padding: EdgeInsets.all(20.0),
                                          child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child:Lottie.network('https://assets2.lottiefiles.com/packages/lf20_fckv1rgt.json',
                        height: 350.0,
                        ),
                        ),
                        SizedBox(height:30.0),
                        Text('Best animal care application with vet support',
                        style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:20, color: Colors.white,fontWeight:FontWeight.bold ),)
                        ),
                        SizedBox(height:15.0),
                         Text('all the support for treat animals from one place',
                        style: GoogleFonts.cairo(textStyle:TextStyle(fontSize:15, color: Colors.white, ),)
                        ),
                        SizedBox(height: 15.0),
                        
 
                      ],
                      ),
                      
                    ),

                ],
                ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                ? Expanded(
                  child: Align(
                    alignment:FractionalOffset.bottomRight ,
                    child: FlatButton(onPressed: (){
                      Navigator.push(context,  MaterialPageRoute(builder:(context) =>SignIn1() ));
                    },
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      mainAxisSize: MainAxisSize.min ,
                      children: <Widget>[
                        Text('Start', style: TextStyle(color:Colors.tealAccent, fontSize:22.0,
                        )
                        ),
                        SizedBox(width:10.0),
                        Icon(
                          Icons.arrow_forward
                        ),
                      ],
                      ),
                    ),
                    ) ,
                )
                :Text('')
              ],

              ),
            ),
          ),
        ), 
         bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => Navigator.push(context,  MaterialPageRoute(builder:(context) =>SignIn1() )),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
      : Text(''),
    );
  }
}