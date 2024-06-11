import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_models.dart';
import '../services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  String _errorMessage = '';
  bool _isLoading = false;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  late UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  final AuthService _authService = AuthService();

  Future<void> getCurrentUser() async {
    try {
      _isLoading = true;
      notifyListeners();

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        _currentUser = UserModel.fromSnapshot(userSnapshot);
      } else {
        _currentUser = null;
      }
    } catch (e) {
      // Handle errors
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signUp({
    required String email,
    required String fullName,
    required String password,
    required String username,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _authService.signup(
        email: email,
        fullName: fullName,
        password: password,
        username: username,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _authService.signIn(email: email, password: password);
      await getCurrentUser();
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signOut() async {
    try {
      _isLoading = true;
      notifyListeners();

      await _authService.signOut();
      _currentUser = null;
      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
