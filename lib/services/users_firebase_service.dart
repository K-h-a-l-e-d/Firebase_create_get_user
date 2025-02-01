import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_info/models/user_model.dart';

class UsersFirebaseService {
  var db = FirebaseFirestore.instance;

  Future<List<UserModel>> getUsersFromFireBase() async {
    List<UserModel> users = [];

    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        users.add(UserModel.fromFirestore(doc));
      }
    });

    return users;
  }
}
