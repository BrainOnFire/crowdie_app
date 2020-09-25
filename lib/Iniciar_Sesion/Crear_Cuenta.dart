import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crowdie_app/Principal/Home.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

//Variables locales
final FirebaseAuth _auth3 = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn3 = GoogleSignIn();

class User {
  final String uid;
  User({ this.uid });
}

class AuthService{
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Registro con correo y contraseña
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth3.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Salir de la sesión
  Future signOut() async {
    try {
      return await _auth3.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

//Inicio de sesion con google
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn3.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final AuthResult authResult = await _auth3.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth3.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

//Salir de la sesion
void signOutGoogle() async{
  await _googleSignIn3.signOut();
  print("User Sign Out");
}

class CrearCuenta extends StatefulWidget {
  @override
  CrearCuentaState createState() => CrearCuentaState();
}

class CrearCuentaState extends State<CrearCuenta> {
  final AuthService _auth4 = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _error;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80.0),
              Stack(
                children: <Widget>[
                  Positioned(
                    left: 20.0,
                    top: 15.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 70.0,
                      height: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      "Crear cuenta",
                      style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                child: TextFormField(
                  validator: (value) => value.isEmpty ? 'Ingrese un correo electrónico': null,
                  onChanged: (value) {
                    setState(() => _email = value);
                  },
                  decoration: InputDecoration(labelText: "Correo"),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                child: TextFormField(
                  validator: (value) => value.length < 6 ? 'Ingresar una contraseña de al menos 6 caracterres': null,
                  onChanged: (value) {
                    setState(() => _password = value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Contraseña"),
                ),
              ),
              const SizedBox(height: 60.0),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  padding: const EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                  color: Colors.yellow[700],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0))),
                  onPressed: () async{
                    if(_formKey.currentState.validate()) {
                      dynamic result = await _auth4.registerWithEmailAndPassword(_email, _password);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      if(result == null){
                        setState(() {
                          _error = 'Porfavor ingresar bien los parámetros pedidos';
                        });
                      }
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Crear cuenta".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      const SizedBox(width: 40.0),
                      Icon(
                        FontAwesomeIcons.arrowRight,
                        size: 18.0,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 200.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton.icon(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 30.0,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red[900]),
                    color: Colors.red[900],
                    highlightedBorderColor: Colors.red[900],
                    textColor: Colors.red[900],
                    icon: Icon(
                      FontAwesomeIcons.googlePlusG,
                      size: 18.0,
                    ),
                    label: Text("Google"),
                    onPressed: () {
                      signInWithGoogle().whenComplete(() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}