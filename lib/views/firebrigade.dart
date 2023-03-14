import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Firebrigade extends StatefulWidget {
  const Firebrigade({super.key});

  @override
  State<Firebrigade> createState() => _FirebrigadeState();
}

class _FirebrigadeState extends State<Firebrigade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Firebrigade"),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Image(image: AssetImage("assets/images/fire.jpg")),
            title: Text(
              "Fire",
              style: TextStyle(fontSize: 18),
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  final message = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      dismissDirection: DismissDirection.up,
                      content: Text("The Request has been accepted"));
                  ScaffoldMessenger.of(context).showSnackBar(message);
                },
                child: Text("Accept")),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading:
                Image(image: AssetImage("assets/images/cylinderblast.jpg")),
            title: Text(
              "Cylinder Blast",
              style: TextStyle(fontSize: 18),
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  final message = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      dismissDirection: DismissDirection.up,
                      content: Text("The Request has been accepted"));
                  ScaffoldMessenger.of(context).showSnackBar(message);
                },
                child: Text("Accept")),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image(image: AssetImage("assets/images/shortcircuit.jpg")),
            title: Text(
              "Short Circuit",
              style: TextStyle(fontSize: 18),
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  final message = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      dismissDirection: DismissDirection.up,
                      content: Text("The Request has been accepted"));
                  ScaffoldMessenger.of(context).showSnackBar(message);
                },
                child: Text("Accept")),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
