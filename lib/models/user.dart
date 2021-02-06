import 'package:cloud_firestore/cloud_firestore.dart';

class Userdetails {
  String name;
  String phoneNumber;
  String email;
  String address;
  String profilePicUrl;
  String authId;
  DateTime creationDate;
  String userHashCode;
  String deviceToken;
  String countryDialCode;
  String countryIsoCode;

  Userdetails() {
    name = "";
    phoneNumber = "";
    email = "";
    profilePicUrl = "";
    address = "";
    authId = "";
    userHashCode = "";
  }

  Userdetails.toObject(Map map) {

    name = map['name'];
    phoneNumber = map['phoneNumber'];
    email = map['email'];
    address = map['address'];
    profilePicUrl = map['profilePicUrl'];
    userHashCode = map['userHashCode'];
    authId = map['authId'];
    creationDate = DateTime.fromMicrosecondsSinceEpoch(
        map["creationDate"].microsecondsSinceEpoch);
    countryIsoCode = map['countryIsoCode'];
    countryDialCode = map['countryDialCode'];
    deviceToken = map['deviceToken'];
  }

  Map getPersonalDetailsMap() {
    Map<String, dynamic> map = Map();
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['address'] = address;

    return map;
  }

  Map getMap() {

    Map<String, dynamic> map = Map();

    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['proilePicUrl'] = profilePicUrl;
    map['address'] = address;
    map['userHashCode'] = userHashCode;
    map['authId'] = authId;
    map['creationDate'] = FieldValue.serverTimestamp();
    map['countryDialCode'] = countryDialCode;
    map['countryIsoCode'] = countryIsoCode;
    return map;
  }

  @override
  String toString() {
    return 'User{name: $name, phoneNumber: $phoneNumber, email: $email, , address: $address, authId: $authId, userHashCode: $userHashCode}';
  }

}
