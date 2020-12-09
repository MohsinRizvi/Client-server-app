import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String displayName) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  DocumentReference users =
      FirebaseFirestore.instance.collection('Users').doc(uid);
  users.set({'displayName': displayName, 'uid': uid});
  return;
}
