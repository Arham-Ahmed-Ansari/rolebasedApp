import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({super.key});

  @override
  State<Ambulance> createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Ambulance"),
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
            leading:
                Image(image: AssetImage("assets/images/medicalEmergency.jpg")),
            title: Text(
              "Robbery",
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
            leading: Image(image: AssetImage("assets/images/accident.jpg")),
            title: Text(
              "Accident",
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
