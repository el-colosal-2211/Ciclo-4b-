import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  late String? id;
  late String? email;
  late String? name;

  AuthModel({this.email, this.name});

  factory AuthModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return AuthModel(
      email: data?["email"],
      name: data?["displayName"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (email != null && email!.isNotEmpty) "email": email,
      if (name != null && name!.isNotEmpty) "displayName": name,
    };
  }

  @override
  String toString() {
    return "AuthModel {$email, $name}";
  }
}
