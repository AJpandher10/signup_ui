import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup_ui/models/Portfolio.dart';
import 'package:signup_ui/models/user.dart';
import 'package:signup_ui/shared/Utils.dart';
import 'package:signup_ui/shared/constants.dart';

class Profileview extends StatefulWidget {
  @override
  _ProfileviewState createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  Userdetails userdetails;
  bool loading = true;
  FirebaseFirestore db = FirebaseFirestore.instance;
  User firebaseuser = FirebaseAuth.instance.currentUser;
  Map map2;

  @override
  void initState() {
    super.initState();
    getprofile();
    getportfolio();
    // getportfolio2();
  }
// Portfolio portfolioo;
  Portfolio portfolio = Portfolio();

  Future<Userdetails> getprofile() async {
    DocumentSnapshot documentSnapshot =
        await db.collection('User').doc(Utils.UID).get();
    setState(() {
      loading = false;
    });
    userdetails = Userdetails.toObject(documentSnapshot.data());
    return userdetails;
  }

  Portfolio result;

  Future<Portfolio> getportfolio() async {
    DocumentSnapshot documentSnapshot = await db
        .collection('User')
        .doc(Utils.UID)
        .collection('report')
        .doc(Utils.UID)
        .get()
        .then((value) => value);
    result = Portfolio.tobject(documentSnapshot.data());
    return result;
    setState(() {
      loading = false;
    });
  }

  Future setportfolio() async {
    // setState(() {
    //   portfolio.income = 55;
    // });
    portfolio.maried =true;
    portfolio.income = 55;
    print(Utils.UID);
    await db
        .collection('User')
        .doc(Utils.UID)
        .collection('report')
        .doc(Utils.UID)
        .set(portfolio.getMap());
    return portfolio;
  }

  // getportfolio2() async {
  //   DocumentSnapshot documentSnapshot = await db
  //       .collection('User')
  //       .doc(Utils.UID)
  //       .collection('report')
  //       .doc(Utils.UID)
  //       .get();
  //   setState(() {
  //     loading = false;
  //   });
  //   print(
  //       '======================================================================');
  //   print(documentSnapshot.data());
  //   print(
  //       '======================================================================');
  //   map2 = documentSnapshot.data();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: loading
          ? Constants.loadingIndicator()
          : Container(
              child: Column(
                children: [
                  Text(
                    userdetails.phoneNumber,
                    style: TextStyle(color: Colors.black),
                  ),
                  // Text(
                  //   result.income.toString(),
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  // Text(
                  //   portfolio.maried.toString(),
                  //   style: TextStyle(color: Colors.black),
                  // ),
                  // StreamBuilder<DocumentSnapshot>(
                  //     stream: db.collection('User').doc(firebaseuser.uid).snapshots(),
                  //     builder: (context, snapshot) {
                  //       userdetails = Userdetails.toObject(snapshot.data.data());
                  //       return Text(userdetails.name);
                  //     })
                  //
                  //
                  // TextFormField(
                  //   maxLines: 1,
                  //   initialValue:
                  //       userdetails.name == null ? "" : userdetails.name,
                  //   decoration: InputDecoration(
                  //     hintText: 'Enter Name',
                  //     isDense: true,
                  //     contentPadding: EdgeInsets.all(0),
                  //     border: InputBorder.none,
                  //     /*enabledBorder: UnderlineInputBorder(
                  //                           borderSide: BorderSide(color: Colors.grey.shade200),
                  //                         ),*/
                  //   ),
                  //   style: TextStyle(fontSize: 15),
                  //   onChanged: (val) {
                  //     username = val.trim();
                  //   },
                  // ),
                  // OutlineButton(onPressed: () async {
                  //   await updatePersonalDetails();
                  // })
                  // Text(portfolio.income.toString()),
                  // Text(map2.values.toString()),
                  RaisedButton(
                    onPressed: () {
                      setportfolio();
                    },
                    child: Text("MAp"),
                  )
                ],
              ),
            ),
    );
  }
}
