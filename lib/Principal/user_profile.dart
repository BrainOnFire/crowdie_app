import 'package:flutter/material.dart';

class UsuarioInfo extends StatefulWidget {
  @override
  _UsuarioInfoState createState() => _UsuarioInfoState();
}

class _UsuarioInfoState extends State<UsuarioInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("Perfil de usuario"),
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                    colors: [Colors.pink, Colors.pink])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      minRadius: 60,
                      backgroundColor: Colors.deepPurple.shade300,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/usuario.jpeg"),
                        minRadius: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Luciano Zagastizábal",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                Text(
                  "Lima, Perú",
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Correo",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "luciano@gmail.com",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Teléfono",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "940158781",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Twitter",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "@BuffaloWings69",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Facebook",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "facebook.com/Luciano Zagastizabal",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
