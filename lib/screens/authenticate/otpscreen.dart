import 'package:country_code_picker/country_code.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signup_ui/models/darktheme.dart';
import 'package:signup_ui/models/user.dart';
import 'package:signup_ui/screens/home/home.dart';
import 'package:signup_ui/shared/Databaseservice.dart';
import 'package:signup_ui/shared/constants.dart';

class OtpScreen extends StatefulWidget {
  String userContact;
  CountryCode countryCode;

  OtpScreen(this.userContact, this.countryCode);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool proceedEnable = false;
  String otpEntered = "", errorMessage = "", verificationCode;
  bool loading = false;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    signInWithOtp();
  }

  signInWithOtp() async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "${widget.countryCode.dialCode}" + widget.userContact,
      timeout: Duration(seconds: 60),

      verificationCompleted: (AuthCredential authCredential) async {
        UserCredential authResult =
            await _firebaseAuth.signInWithCredential(authCredential);
        User firebaseUser = authResult.user;
        if (firebaseUser != null) {
          print('Sign in successful');
          setState(() {
            loading = true;
          });
          Userdetails user = await DatabaseService().getUserFromAuthId(
              widget.userContact, firebaseUser.uid, widget.countryCode);
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home(user)));
        } else {
          print("Login unsuccessful");
        }
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.toString());
        print("failed");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      // called when the SMS code is sent
      codeSent: (String verificationId, [int forceResendCode]) {
        verificationCode = verificationId;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(),
        child: loading
            ? Constants.loadingIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                /*Text(
                                "One Time Password",
                                style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24),
                              ),*/
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Enter the OTP sent to",
                                  style: GoogleFonts.raleway(
                                      color: themeChange.darkTheme == true
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24),
                                ),
                                Text(
                                  widget.userContact,
                                  style: TextStyle(
                                      color: themeChange.darkTheme == true
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            getPinEntryItem(otpEntered.length > 0
                                ? otpEntered.substring(0, 1)
                                : ""),
                            getPinEntryItem(otpEntered.length > 1
                                ? otpEntered.substring(1, 2)
                                : ""),
                            getPinEntryItem(otpEntered.length > 2
                                ? otpEntered.substring(2, 3)
                                : ""),
                            getPinEntryItem(otpEntered.length > 3
                                ? otpEntered.substring(3, 4)
                                : ""),
                            getPinEntryItem(otpEntered.length > 4
                                ? otpEntered.substring(4, 5)
                                : ""),
                            getPinEntryItem(otpEntered.length > 5
                                ? otpEntered.substring(5, 6)
                                : ""),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      onPressed: () async {
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationCode,
                                smsCode: otpEntered);
                        UserCredential result = await _firebaseAuth
                            .signInWithCredential(credential);

                        User firebaseUser = result.user;

                        if (firebaseUser != null) {
                          print('Sign in successful');
                          setState(() {
                            loading = true;
                          });
                          Userdetails user = await DatabaseService()
                              .getUserFromAuthId(widget.userContact,
                                  firebaseUser.uid, widget.countryCode);
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(user)));
                        } else {
                          print('user is null');
                        }
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      color: themeChange.darkTheme == true
                          ? Colors.grey.withOpacity(0.1)
                          : Colors.black87.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Spacer(),
                          Text(
                            "Proceed",
                            style: GoogleFonts.raleway(
                                color: proceedEnable
                                    ? Colors.white
                                    : Colors.white.withOpacity(.7),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: proceedEnable
                                ? Colors.white
                                : Colors.white.withOpacity(.7),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  getNumRow('1', '2', '3'),
                  getNumRow('4', '5', '6'),
                  getNumRow('7', '8', '9'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (otpEntered.length > 0) {
                                    otpEntered = otpEntered.replaceRange(
                                        otpEntered.length - 1,
                                        otpEntered.length,
                                        "");
                                    if (otpEntered.length != 6) {
                                      setState(() {
                                        proceedEnable = false;
                                      });
                                    }
                                    //_textEditingController.text = otpEntered;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 16),
                                child: Icon(
                                  Icons.backspace,
                                  color: themeChange.darkTheme == true
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                appendNumber('0');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "0",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.muli(
                                      color: themeChange.darkTheme == true
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget getPinEntryItem(String pin) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      width: 30,
      height: 40,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(8),
          border: Border(
              bottom: BorderSide(
                  color: themeChange.darkTheme == true
                      ? Colors.white
                      : Colors.black,
                  width: 2))),
      child: Center(
          child: Text(
        pin,
        style: TextStyle(
            color: themeChange.darkTheme == true ? Colors.white : Colors.black,
            fontSize: 24),
        textAlign: TextAlign.center,
      )),
    );
  }

  appendNumber(String num) {
    if (otpEntered.length < 6) {
      setState(() {
        otpEntered = otpEntered + num;
        if (otpEntered.length == 6) {
          proceedEnable = true;
        }
      });
    }
  }

  Widget getNumRow(String num1, String num2, String num3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        getNumberItem(num1),
        getNumberItem(num2),
        getNumberItem(num3),
      ],
    );
  }

  Widget getNumberItem(String num) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              appendNumber(num);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                num,
                textAlign: TextAlign.center,
                style: GoogleFonts.muli(
                    color: themeChange.darkTheme == true
                        ? Colors.white
                        : Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration formInputDecoration() {
    return InputDecoration(
        //focusColor: Colors.pinkAccent,
        //focusColor: Colors.amber.shade800,
        //labelStyle: TextStyle(color: Colors.amber.shade800),
        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white.withOpacity(.5),
              width: 2,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
        ),
        focusColor: Colors.white,
        hoverColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20)));
  }
}
