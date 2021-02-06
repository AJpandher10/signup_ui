import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:signup_ui/models/Sliderdata.dart';
import 'file:///E:/Elaleteo/signup_ui/lib/shared/Databaseservice.dart';
import 'package:signup_ui/models/darktheme.dart';
import 'package:signup_ui/models/user.dart';
import 'package:signup_ui/screens/authenticate/otpscreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signup_ui/screens/authenticate/register.dart';
import 'package:signup_ui/screens/drawer/Profile.dart';
import 'package:signup_ui/shared/Utils.dart';

class Home extends StatefulWidget {
  Userdetails user;
  Home(this.user);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool checkUserInFirebaseAuth() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if(auth.currentUser != null) {
      Utils.UID = auth.currentUser.uid;
      return true;
    }else{
      return false;
    }
  }

  void initState() {
    super.initState();
    checkUserInFirebaseAuth();
  }

  @override
  Widget build(BuildContext context) {

    final themeChange = Provider.of<DarkThemeProvider>(context);
    List cardList = [Item1(), Item2(), Item3(), Item4()];
    return Scaffold(
      drawer: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Profile'),
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profileview()));
                    },
                  ),
                ],
              ),
              FlatButton.icon(
                icon: Icon(Icons.power_settings_new),
                label: Text('logout'),
                onPressed: () {
                  try {
                    FirebaseAuth.instance.signOut().whenComplete(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    });
                  } catch (e) {
                    print("Error signing out");
                  }
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                      value: themeChange.darkTheme,
                      onChanged: (bool value) {
                        themeChange.darkTheme = value;
                      }),
                  Text("Dark mode"),
                ],
              ),
            ],
          ),
        ],
      )),
      appBar: AppBar(
        title: Text('Welcome'),
        elevation: 10.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: cardList
                    .map(
                      (card) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: card,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  Products",
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: new List<Widget>.generate(4, (index) {
                          return new Card(
                              elevation: 0,
                              color: Colors.grey.shade200,
                              child: new Center(
                                child: new Text(
                                  'tile $index',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ));
                        })),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: GridView.count(
                        crossAxisCount: 1,
                        scrollDirection: Axis.horizontal,
                        children: new List<Widget>.generate(6, (index) {
                          return new GridTile(
                            child: new Card(
                                elevation: 0,
                                color: Colors.grey.shade200,
                                child: new Center(
                                  child: new Text('tile $index',
                                      style: TextStyle(color: Colors.black)),
                                )),
                          );
                        })),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
