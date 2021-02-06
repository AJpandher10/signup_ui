import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:signup_ui/models/user.dart';
import 'package:signup_ui/screens/home/Aboutpage.dart';
import 'package:signup_ui/screens/home/Splash.dart';

import 'package:signup_ui/screens/home/home.dart';
import 'package:signup_ui/shared/theme.dart';
import 'package:signup_ui/models/darktheme.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  Widget initialScreen = SplashScreen();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    init();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  init() async {
    //checkInternetConnection();
    checkAuthState();
  }

  void checkAuthState() async {
    Userdetails user;
    FirebaseAuth.instance.authStateChanges().listen((User firebaseUser) {
      if (firebaseUser == null) {
        print('User is currently signed out!');
        setState(() {
          initialScreen = Aboutpage();
        });
      } else {
        print('User is signed in!');
        setState(() {
//        initialScreen=UploadProfilePicScreen(user);
          initialScreen = Home(user);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (
          BuildContext context,
          value,
          Widget child,
        ) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: initialScreen,
          );
        },
      ),
    );
  }
}
