import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String username;
  final String fullName;
  final String password; // Added fullName property

  const UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.fullName,
    required this.password,
     // Added fullName to constructor
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      fullName: json['fullName'], // Added fullName from JSON
      password: json['password'], // Added fullName from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'fullName': fullName,
      'password': password
      // Added fullName to JSON
    };
  }

  static UserModel? fromSnapshot(DocumentSnapshot userSnapshot) {
    if (userSnapshot.exists) {
      final data = userSnapshot.data() as Map<String, dynamic>;
      return UserModel(
        id: userSnapshot.id,
        email: data['email'],
        username: data['username'],
        fullName: data['fullName'], // Added fullName from snapshot data
        password: data['password'], // Added fullName from snapshot data
      );
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [id, email, username, fullName]; // Include fullName in props list
}
