import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  Future<String> createuser(String email, String password) async {
    String note = "";
    var firebaseAuth = FirebaseAuth.instance;

    try {
      firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      note = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        note = "Password is too short";
      } else if (e.code == "email-already-in-use") {
        note = "You are already User";
      } else {
        note = "You are already User ${e.message}";
      }
    }
    return note;
  }

  Future<String> loginuser(String email, String password) async {
    String note = "";
    var firebaseAuth = FirebaseAuth.instance;

    try {
      firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      note = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        note = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        note = 'Wrong password provider for that user.';
      }
    }
    return note;
  }

  bool cheakUser() {
    var firebaseAuth = FirebaseAuth.instance;
    var user = firebaseAuth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  void signOut() {
    var firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut();
    GoogleSignIn().signOut();
  }

  void googleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? user =
        await googleSignInAccount!.authentication;

    var crd = GoogleAuthProvider.credential(
        idToken: user.idToken, accessToken: user.accessToken);
    var firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signInWithCredential(crd);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

/** flutter_facebook_login:  add pubspec.yaml dependencies **/

//Future < FirebaseUser > facebookLogin(BuildContext context) async {
//         FirebaseUser currentUser;
//         try {
//             final FacebookLoginResult facebookLoginResult = await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
//             if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
//                 FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
//                 final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);
//                 final FirebaseUser user = await auth.signInWithCredential(credential);
//                 assert(user.email != null);
//                 assert(user.displayName != null);
//                 assert(!user.isAnonymous);
//                 assert(await user.getIdToken() != null);
//                 currentUser = await auth.currentUser();
//                 assert(user.uid == currentUser.uid);
//                 return currentUser;
//             } catch (e) {
//                 print(e);
//                 return currentUser;
//             }
//         }

/*
Future < bool > facebookLoginOut() async {
    await auth.signOut();
    await fbLogin.logOut();
    return true;
}
 */
}
