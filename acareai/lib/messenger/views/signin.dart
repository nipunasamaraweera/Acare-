import 'package:acareai/messenger/services2/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn1 extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://cdn.dribbble.com/users/566817/screenshots/2866636/lagifathon28_dribbble.gif"),
            fit: BoxFit.cover,
          ),
        ),
         child: Center(
        child: GestureDetector(
          onTap: () {
            AuthMethods().signInWithGoogle(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueAccent,
              
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Sign In with Google",
              style: GoogleFonts.openSans(textStyle:TextStyle(fontSize: 20, color: Colors.white)),
            ),
            
          ),
        ),
        
      
      ),
      
    ),
    );
  }
}