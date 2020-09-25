import 'package:crowdie_app/Iniciar_Sesion/Crear_Cuenta.dart';
import 'package:crowdie_app/Iniciar_Sesion/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdie_app/Principal/user_profile.dart';
import 'package:crowdie_app/Proyectos/Proyectos.dart';
import 'package:crowdie_app/Principal/chat_bot.dart';
import 'package:crowdie_app/Proyectos/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user, String uid
}) : super(key: key);
  final AuthResult user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Obtener imagen de firebase
  final AuthService _auth = AuthService();
  final firestoreInstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        title: Text('Crowdie', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0), ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: () async{
              await _auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaLogin()));
            }
          )
        ],
        leading: new Container(),
      ),
      bottomNavigationBar: ColoredBox(
        color: Colors.transparent,
          child: BottomAppBar(
            notchMargin: 3.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 20.0),
                  icon: Icon(Icons.account_circle, color: Colors.white),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UsuarioInfo()));
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 20.0),
                  icon: Icon(Icons.payment, color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Tarjetas()));
                  },
                ),
              ],
            ),
            elevation: 25.0,
            color: Colors.yellow[700],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBotPage()));
        },
        label: Text('Crowdie Bot'),
        icon: Icon(Icons.android),
        backgroundColor: Colors.pink,
        elevation: 25.0,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot){
          return ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: double.maxFinite,
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoUno()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_4.png?alt=media&token=d6d4c914-e3e7-4a15-b110-3fd6c64e2aca"),
                                      new Text(snapshot.data.documents[0]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoDos()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/cinera.jpg?alt=media&token=e6712c0f-5966-4d2b-9b32-18654c063088", fit: BoxFit.fitHeight),
                                      new Text(snapshot.data.documents[1]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoTres()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(5),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/mit_respirator.jpg?alt=media&token=67f0b1a9-9de9-4d6b-97b6-91130022ff03",),
                                      new Text(snapshot.data.documents[2]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoCuatro()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/bigsofti.jpg?alt=media&token=f74ed9b1-0af0-43d0-bf9b-c877962b58ba", fit: BoxFit.fitHeight,),
                                      new Text(snapshot.data.documents[3]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoCinco()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_6.jpg?alt=media&token=119b8528-54c3-4521-af56-9a30a9d59745", fit: BoxFit.fitHeight,),
                                      new Text(snapshot.data.documents[4]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoSeis()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_2.jpg?alt=media&token=35d5d3e6-45dc-4c0f-928a-942349100ce9", fit: BoxFit.fitHeight,),
                                      new Text(snapshot.data.documents[5]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoSiete()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_5.jpg?alt=media&token=697e82ec-e24c-498f-96c1-dbedce0e69f4", fit: BoxFit.fitHeight,),
                                      new Text(snapshot.data.documents[6]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoOcho()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_1.jpg?alt=media&token=1502c726-b259-4ab0-b857-9848b9e78a5b", fit: BoxFit.fitHeight,),
                                      new Text(snapshot.data.documents[7]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                        new InkWell(
                          splashColor: Colors.yellow[700],
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectoNueve()));
                          },
                          child: new Card(
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              semanticContainer: true,
                              elevation: 10,
                              child: new Container(
                                  padding: new EdgeInsets.all(10),
                                  child: new Column(
                                    children: <Widget>[
                                      new Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/upstage.jpg?alt=media&token=cb19fded-ebe9-47f9-9d57-14a30bdda879", fit: BoxFit.fitHeight,),
                                      new Text(snapshot.data.documents[8]['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25))
                                    ],
                                  )
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          );
        }
      ),
    );
  }
}