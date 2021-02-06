import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signup_ui/models/darktheme.dart';
class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body:Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RichText( textAlign: TextAlign.center,
                text: TextSpan(
                    text: "BAMBOO",
                    style: GoogleFonts.marcellus(
                        color: themeChange.darkTheme == true
                            ? Colors.white
                            : Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2),
                    children: <TextSpan>[
                      TextSpan(

                        text: "\nCAPITAL",
                        style: GoogleFonts.marcellus(

                            color: themeChange.darkTheme == true
                                ? Colors.white
                                : Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2),
                      ),
                    ]),
              ),
              SizedBox(height: 32,),
              //  Text("Credmate",style: GoogleFonts.merriweather(fontSize: 32,color: Colors.grey.shade600),),
              SpinKitCircle(
                color: Color(0xffb7005e),
                size: 40,
              )
            ],
          )

      ) ,
    );
  }
}
