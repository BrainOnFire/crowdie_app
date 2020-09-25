import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crowdie_app/Principal/Home.dart';
import 'package:flutter/material.dart';
import 'Crear_Cuenta.dart';
import 'Login.dart';
import 'dart:async';

//Inicializacion de la app
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crowdie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PaginaLogin()
    );
  }
}

//Variables locales
final FirebaseAuth _auth1 = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn1 = GoogleSignIn();

//Inicio de sesion con google
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn1.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final AuthResult authResult = await _auth1.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth1.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

//Salir de la sesion
void signOutGoogle() async{
  await _googleSignIn1.signOut();
  print("User Sign Out");
}

//PaginaLogin Startup
class PaginaLogin extends StatefulWidget {
  @override
  PaginaLoginState createState() => PaginaLoginState();
}

//Construccion de la pagina
class PaginaLoginState extends State<PaginaLogin> {
  //UI
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/crowd.jpg"),
                  fit: BoxFit.fitHeight
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: kToolbarHeight + 56),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Bienvenido",
                          style: TextStyle(
                            color: Colors.yellow[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 30.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Bienvenido a Crowdie \n Inicia sesión o crea una cuenta nueva",
                          style: TextStyle(
                            color: Colors.yellow[700],
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.indigo[900],
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text("Iniciar Sesión"),
                          onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InicioSesion(), fullscreenDialog: true),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.yellow[700],
                          textColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text("Crear Cuenta"),
                          onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CrearCuenta(), fullscreenDialog: true),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  OutlineButton.icon(
                    borderSide: BorderSide(color: Colors.red[900]),
                    //color: Colors.yellow,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    icon: Icon(FontAwesomeIcons.googlePlusG),
                    label: Text("Iniciar sesión con Google"),
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
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        )
    );
  }
}

