import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamchat/models/call.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final callReposityoryProvider = Provider(
  (ref) => CallReposityory(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

class CallReposityory {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  CallReposityory({
    required this.firestore,
    required this.auth,
  });

  Future<String> createCall(String callerId, String reciverId) async {
    DocumentReference callDoc = firestore.collection("call").doc();
    CallModel callModel;
    callModel = CallModel(
      callerId: callerId,
      callId: callDoc.id,
      receiverId: reciverId,
      dateTime: DateTime.now(),
    );
    await callDoc.set(callModel.toMap());

    return callDoc.id;
  }

  // getting call id for existing call
  Future<String> getCallId(String callerId, String reciverId) async {
    QuerySnapshot callSnapshot = await firestore
        .collection("call")
        .where('callerId', isEqualTo: callerId)
        .where('receiverId', isEqualTo: reciverId)
        .get();
    if (callSnapshot.docs.isNotEmpty) {
      return callSnapshot.docs.first.id;
    }

    return "";
  }
}
