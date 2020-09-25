import 'package:crowdie_app/Principal/Home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//InicioSesion Startup
class InicioSesion extends StatefulWidget {
  @override
  InicioSesionState createState() => InicioSesionState();
}

final FirebaseAuth _auth2 = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn2 = GoogleSignIn();

//Inicio de sesion con google
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn2.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final AuthResult authResult = await _auth2.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth2.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

//Salir de la sesion
void signOutGoogle() async{
  await _googleSignIn2.signOut();
  print("User Sign Out");
}

//Contruccion de la pagina
class InicioSesionState extends State<InicioSesion> {

  //Variables locales
  final _formKeyLogin = new GlobalKey<FormState>();
  String _email;
  String _password;

  //Inicio de sesion con email y contraseña
  Future<String> signIn() async {
    final formState = _formKeyLogin.currentState;
    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user,)));
      } catch(e){
        print(e.message);
      }
    }
    return null;
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKeyLogin,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Stack(
                children: <Widget>[
                  Positioned(
                    left: 20.0,
                    top: 15.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      width: 70.0,
                      height: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      "Iniciar Sesión",
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
                  validator: (value){
                    if(value.isEmpty){
                      return 'Porfavor escribir su correo';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.mail, color: Colors.black),
                      labelText: "Email"),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                child: TextFormField(
                  validator: (value){
                    if(value.length < 6){
                      return 'Porfavor escribir su contraseña';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                  obscureText: true,
                  maxLines: 1,
                  decoration: InputDecoration(
                      icon: new Icon(Icons.lock, color: Colors.black),
                      labelText: "Contraseña"),
                ),
              ),
              SizedBox(height: 120.0),
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
                  onPressed: signIn,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Acceder".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      SizedBox(width: 40.0),
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
                    icon: Icon(FontAwesomeIcons.googlePlusG, size: 18.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}