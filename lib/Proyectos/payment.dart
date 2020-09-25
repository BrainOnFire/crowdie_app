import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

String text = 'Presinar el boton para apoyar este proyecto';
double totalCost = 10.0;
int amount = 0;
bool showSpinner = false;

class Tarjetas extends StatefulWidget {
  @override
  _TarjetasState createState() => _TarjetasState();
}

class _TarjetasState extends State<Tarjetas> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => pay(),
        child: Icon(Icons.payment),
      ),
      appBar: AppBar(
        title: Text('Tarjetas de crédito y débito'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('Añadir tarjeta de crédito o de débito'),
            )
          ],
        ),
      ),
    );
  }
}
