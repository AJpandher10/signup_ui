import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signup_ui/models/darktheme.dart';
import 'package:signup_ui/screens/authenticate/otpscreen.dart';
import 'package:signup_ui/shared/darkthemeprefrences.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with ChangeNotifier {
  var _formKey = GlobalKey<FormState>();
  String userContact = "";
  CountryCode countryCode = CountryCode.fromCode('IN');

  @override
  Widget build(BuildContext context) {
    Color color2 = Theme.of(context).primaryColor;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          switcthemeicon(themeChange),
        ],
        title: Row(

          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            ShowUp(
              delay: 5,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "LOGIN",
                    style: GoogleFonts.openSans(
                        color: themeChange.darkTheme == true
                            ? Colors.white
                            : Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 0),
                    children: <TextSpan>[]),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShowUp(
                  delay: 5,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "BAMBOO",
                        style: GoogleFonts.marcellus(
                            color: themeChange.darkTheme == true
                                ? Colors.white
                                : Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.2),
                        children: <TextSpan>[
                          TextSpan(
                            text: "\nCAPITAL",
                            style: GoogleFonts.marcellus(
                                color: themeChange.darkTheme == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.2),
                          ),
                        ]),
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.1)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: CountryCodePicker(
                          initialSelection: 'IN',
                          favorite: ['IN', 'AU', 'GB', 'CA', 'US'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                          onChanged: (code) {
                            countryCode = code;
                            /*setState(() {
                                                                  countryCode = code;
                                                                });*/
                            print('Dial code ${countryCode.dialCode}');
                            print('Iso Code ${countryCode.code}');
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Enter mobile number',
                              hintStyle: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: themeChange.darkTheme == true
                                        ? Colors.grey
                                        : Colors.black38,
                                    letterSpacing: 0.2),
                              ),
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.black87),
                              // suffixIcon: Icon(Icons.phone,color: Colors.grey),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              userContact = val;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: themeChange.darkTheme == true
                              ? Colors.grey.withOpacity(0.1)
                              : Colors.black87.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () {
                          // if (userContact.length > 8)
                          if (_formKey.currentState.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpScreen(userContact, countryCode)));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Spacer(),
                              Text(
                                'Proceed',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      color: themeChange.darkTheme == true
                                          ? Colors.white
                                          : Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "You will get an OTP for verification",
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: themeChange.darkTheme == true
                                ? Colors.white
                                : Colors.black,
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUp({@required this.child, this.delay});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}

Widget switcthemeicon(DarkThemeProvider themeProvider) {
  return IconButton(
      icon: Icon(Icons.lightbulb),
      onPressed: () {
        themeProvider.darkTheme = !themeProvider.darkTheme;
      });
}
