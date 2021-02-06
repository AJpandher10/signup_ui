import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:signup_ui/models/darktheme.dart';
import 'package:signup_ui/screens/authenticate/register.dart';
import 'package:signup_ui/shared/theme.dart';
import 'package:signup_ui/screens/home/Aboutpage.dart';

class Aboutpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutpageState();
  }
}

class AboutpageState extends State<Aboutpage> {
  PageController _controller;
  double currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    // TODO: implement build
    List<Widget> items = [pageOne(), pageTwo(), pageThree(), loginUi()];

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              children: items,
              controller: _controller,
            ),
          ),
          ScrollingPageIndicator(
            dotColor: themeChange.darkTheme == true
                ? Colors.white
                : Colors.grey.shade400,
            dotSelectedColor: themeChange.darkTheme == true
                ? Colors.tealAccent
                : Colors.black,
            dotSize: 5,
            dotSelectedSize: 10,
            dotSpacing: 12,
            controller: _controller,
            itemCount: items.length,
            orientation: Axis.horizontal,
          ),
        ],
      ),
    );
  }

  Widget pageOne() {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image(
        //   image: AssetImage('assets/images/t1.jpg'),
        //   height: 250,
        //   width: MediaQuery.of(context).size.width,
        // ),
        Switch(
            value: themeChange.darkTheme,
            onChanged: (bool value) {
              themeChange.darkTheme = value;
            }),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "LOGO ",
              style: GoogleFonts.marcellus(
                  color: themeChange.darkTheme == true
                      ? Colors.white
                      : Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.2),
              children: <TextSpan>[
                TextSpan(
                  text: "\n and message",
                  style: GoogleFonts.marcellus(
                      color: themeChange.darkTheme == true
                          ? Colors.white
                          : Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.2),
                ),
              ]),
        )
      ],
    ));
  }

  Widget pageTwo() {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(
          //   image: AssetImage('assets/images/t2.jpg'),
          //   height: 250,
          // ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "KEY FEATURES",
                style: GoogleFonts.marcellus(
                    color: themeChange.darkTheme == true
                        ? Colors.white
                        : Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2),
                children: <TextSpan>[
                  TextSpan(
                    text: "\n and working",
                    style: GoogleFonts.marcellus(
                        color: themeChange.darkTheme == true
                            ? Colors.white
                            : Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget pageThree() {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(
          //   image: AssetImage('assets/images/t3.png'),
          //   height: 250,
          //   width: MediaQuery.of(context).size.width * .85,
          // ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Meet our ",
                style: GoogleFonts.marcellus(
                    color: themeChange.darkTheme == true
                        ? Colors.white
                        : Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2),
                children: <TextSpan>[
                  TextSpan(
                    text: "\n costumers",
                    style: GoogleFonts.marcellus(
                        color: themeChange.darkTheme == true
                            ? Colors.white
                            : Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget loginUi() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: OutlineButton(
                      borderSide: BorderSide(
                        width: 1,
                        color: themeChange.darkTheme == true
                            ? Colors.white
                            : Colors.black,
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(7.0),
                      ),
                      onPressed: () {
                        /*Navigator.pushReplacement(
                    context,
                    PageTransition(
                        curve: Curves.elasticIn,
                        alignment: Alignment.topRight,
                        type:
                        PageTransitionType.rightToLeftWithFade,
                        duration: Duration(milliseconds: 500),
                        child: LoginActivity(widget.extraModel)));*/
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                      color: themeChange.darkTheme == true
                          ? Colors.white
                          : Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(),
                          Text(
                            "Continue",
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              color: themeChange.darkTheme == true
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'By continuing you agree to our',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: themeChange.darkTheme == true
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  Text(
                    'Terms & Conditions',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      color: themeChange.darkTheme == true
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
