import 'package:flutter/material.dart';
class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(5),

        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Colors.grey.shade500,Colors.grey.shade700,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              "1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );
  }
}
class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),

        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Colors.grey.shade500,Colors.grey.shade700,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              "2",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );  }
}
class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),

        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Colors.grey.shade500,Colors.grey.shade700,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              "3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );  }
}
class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),

        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Colors.grey.shade500,Colors.grey.shade700,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              "Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
              "4",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );  }
}