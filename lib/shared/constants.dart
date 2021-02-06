import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Constants {
  static const textInputDecoration = InputDecoration(
    fillColor: Colors.transparent,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
    contentPadding: EdgeInsets.all(0.0),
    errorStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(color: Colors.transparent, width: 1.0),
    ),
  );

  static Widget loadingIndicator() {
    return Center(
      child: Container(
        height: 40,
        width: 40,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SpinKitRing(
              color: Colors.blue,
//size: 36,
              lineWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
