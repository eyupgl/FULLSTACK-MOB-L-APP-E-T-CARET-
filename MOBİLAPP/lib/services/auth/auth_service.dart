
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  //firebase auth örneğini alın
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
  //mevcut kullanıcıyı al
  User? getCurrentUser(){
    return _firebaseAuth.currentUser;
  }
  //kayıt olmak
  Future<UserCredential> singInWithEmailPassword(String email,password) async{
    //kullanıcıyı söylemeyi deneyin
    try{
     UserCredential userCredential =
     await _firebaseAuth.signInWithEmailAndPassword(
       email: email,
       password: password,
     );

      return userCredential;
    }
    //herhangi bir hatayı yakalamak
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }

  }
  //üye Ol
  Future<UserCredential> singUpWithEmailPassword(String email,password) async{

    try{
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    }
    //herhangi bir hatayı yakalamak
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }

  }


  //sign out

Future<void> signOut() async{
    return await _firebaseAuth.signOut();
}












}

