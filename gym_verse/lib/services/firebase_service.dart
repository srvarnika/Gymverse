import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> saveUserProfile(
      String userId, Map<String, dynamic> profileData) async {
    await _db
        .collection('users')
        .doc(userId)
        .set(profileData, SetOptions(merge: true));
  }

  static Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final doc = await _db.collection('users').doc(userId).get();
    return doc.exists ? doc.data() : null;
  }
}
