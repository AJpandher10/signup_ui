

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signup_ui/models/user.dart';

class DatabaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Userdetails> getUserFromAuthId(
      String contact, String authId, CountryCode countryCode) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('User')
        .where('authId', isEqualTo: authId)
        .limit(1)
        .get();
    Userdetails user;
    if (querySnapshot.docs.length > 0) {
      user = Userdetails.toObject(querySnapshot.docs[0].data());
      print(user.toString());
      return user;
    } else {
      user = Userdetails();
      user.countryDialCode = countryCode.dialCode;
      user.countryIsoCode = countryCode.code;
      user.authId = authId;
      user.phoneNumber = contact;
      user.creationDate = DateTime.now();
      await _firestore
          .collection('User')
          .doc(user.authId)
          .set(user.getMap());
      return user;
    }
  }



}
