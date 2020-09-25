import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
//Proyecto 1
class ProyectoUno extends StatefulWidget {
  @override
  _ProyectoUnoState createState() => _ProyectoUnoState();
}

class _ProyectoUnoState extends State<ProyectoUno> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 1'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_4.png?alt=media&token=d6d4c914-e3e7-4a15-b110-3fd6c64e2aca"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[0]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[0]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 2
class ProyectoDos extends StatefulWidget {
  @override
  _ProyectoDosState createState() => _ProyectoDosState();
}

class _ProyectoDosState extends State<ProyectoDos> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 2'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/cinera.jpg?alt=media&token=e6712c0f-5966-4d2b-9b32-18654c063088"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[1]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[1]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 3
class ProyectoTres extends StatefulWidget {
  @override
  _ProyectoTresState createState() => _ProyectoTresState();
}

class _ProyectoTresState extends State<ProyectoTres> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 3'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/mit_respirator.jpg?alt=media&token=67f0b1a9-9de9-4d6b-97b6-91130022ff03"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[2]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[2]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 4
class ProyectoCuatro extends StatefulWidget {
  @override
  _ProyectoCuatroState createState() => _ProyectoCuatroState();
}

class _ProyectoCuatroState extends State<ProyectoCuatro> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 4'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/bigsofti.jpg?alt=media&token=f74ed9b1-0af0-43d0-bf9b-c877962b58ba"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[3]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[3]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 5
class ProyectoCinco extends StatefulWidget {
  @override
  _ProyectoCincoState createState() => _ProyectoCincoState();
}

class _ProyectoCincoState extends State<ProyectoCinco> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 5'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_6.jpg?alt=media&token=119b8528-54c3-4521-af56-9a30a9d59745"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[4]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[4]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 6
class ProyectoSeis extends StatefulWidget {
  @override
  _ProyectoSeisState createState() => _ProyectoSeisState();
}

class _ProyectoSeisState extends State<ProyectoSeis> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 6'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_2.jpg?alt=media&token=35d5d3e6-45dc-4c0f-928a-942349100ce9"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[5]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[5]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 7
class ProyectoSiete extends StatefulWidget {
  @override
  _ProyectoSieteState createState() => _ProyectoSieteState();
}

class _ProyectoSieteState extends State<ProyectoSiete> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 7'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_5.jpg?alt=media&token=697e82ec-e24c-498f-96c1-dbedce0e69f4"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[6]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[6]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 8
class ProyectoOcho extends StatefulWidget {
  @override
  _ProyectoOchoState createState() => _ProyectoOchoState();
}

class _ProyectoOchoState extends State<ProyectoOcho> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 8'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/PROYECTO_1.jpg?alt=media&token=1502c726-b259-4ab0-b857-9848b9e78a5b"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[7]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[7]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}

//Proyecto 9
class ProyectoNueve extends StatefulWidget {
  @override
  _ProyectoNueveState createState() => _ProyectoNueveState();
}

class _ProyectoNueveState extends State<ProyectoNueve> {
  @override
  void initState() {
    super.initState();
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-2e8wzvZaP6reAK-1P_D_1w');
  }

  Future<void> pay() async {
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails details) {
          print(details.nonce);

          InAppPayments.completeCardEntry(
              onCardEntryComplete: () async{
                Response response = await get("http://192.168.1.16:8080?nonce=" + details.nonce);
                await showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Square Payments API Response"),
                        content: Text(response.body.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                      );
                    });
              });
        },
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

  void _onCancelCardEntryFlow() {
    // Handle the cancel callback
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Protecto 9'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: <Widget>[
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/cognitive-crowdie.appspot.com/o/upstage.jpg?alt=media&token=cb19fded-ebe9-47f9-9d57-14a30bdda879"),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text('Descripción del proyecto:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[8]['content'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('Dinero Recaudado:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
                ),
                Container(
                  padding: new EdgeInsets.all(10),
                  child: Text(snapshot.data.documents[8]['recaudado'], style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300, fontSize: 30), textAlign: TextAlign.justify,),
                ),
                SizedBox(height: 120.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                    color: Colors.pink,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),)),
                    onPressed: pay,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Agregar fondos".toUpperCase(),
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
                SizedBox(height: 120.0),
              ],
            );
          }
      ),
    );
  }
}