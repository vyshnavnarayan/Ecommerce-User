import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_user/login/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserSignup {

  Future<void> createUser(String email, String password, String name, String phoneNumber, BuildContext context)async {

    final auth = FirebaseAuth.instance;
    final CollectionReference userRefferance = 
    FirebaseFirestore.instance.collection('usercollection');
    

    try{
     final userCredential =await auth.createUserWithEmailAndPassword(email: email, password: password);

     await userRefferance.doc(userCredential.user!.uid).set({
      'username': name,
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'user_id': auth.currentUser!.uid,
        'type': 'user'
     });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    
    }on FirebaseAuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
    }
  }
}