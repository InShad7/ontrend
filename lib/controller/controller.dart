import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppProvider extends ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCountry = '+968';

  Future<bool> isUserRegistered(String email) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot =
          await users.where('email', isEqualTo: email).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking user registration: $e');
      return false;
    }
  }

  Future<bool> registerUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String email = emailController.text.trim();

    bool userExists = await isUserRegistered(email);
    if (userExists) {
      Fluttertoast.showToast(msg: 'User already registered');
      return false;
    }

    final docRef = users.doc();

    try {
      await docRef.set({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': email,
        'number': "$selectedCountry${phoneNumberController.text.trim()}",
        'password': passwordController.text.trim(),
      });

      Fluttertoast.showToast(msg: 'User Registered successfully');
      print('User added successfully');

      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      phoneNumberController.clear();
      passwordController.clear();

      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error registering user');
      print('Failed to add user: $e');
      return false;
    }
  }

  Future<bool> checkUserCredentials() async {
    var emailOrNumber = userNameController.text.trim();
    final password = passwordController.text.trim();

    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      QuerySnapshot querySnapshot =
          await users.where('email', isEqualTo: emailOrNumber).get();
      QuerySnapshot querySnapshot2 =
          await users.where('number', isEqualTo: emailOrNumber).get();

      if (querySnapshot.docs.isNotEmpty || querySnapshot2.docs.isNotEmpty) {
        // User with the specified email or number found
        var userData = (querySnapshot.docs.isNotEmpty
            ? querySnapshot.docs.first.data()
            : querySnapshot2.docs.first.data()) as Map<String, dynamic>;

        if (userData['password'] == password) {
          // Password matches
          userNameController.clear();
          passwordController.clear();
          return true;
        } else {
          Fluttertoast.showToast(msg: 'Incorrect password');
          return false;
        }
      } else {
        Fluttertoast.showToast(msg: 'No user found with this username');
        return false;
      }
    } catch (e) {
      print('Error checking user credentials: $e');
      Fluttertoast.showToast(msg: 'User credentials not valid');
      return false;
    }
  }
}
