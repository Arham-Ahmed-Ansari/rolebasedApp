import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project9/views/login.dart';

class Police extends StatefulWidget {
  const Police({super.key});

  @override
  State<Police> createState() => _PoliceState();
}

class _PoliceState extends State<Police> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text("Police"),
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
                leading: Image(image: AssetImage("assets/images/robbery.jpg")),
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
                leading:
                    Image(image: AssetImage("assets/images/harrasment.jpg")),
                title: Text(
                  "Harrasment",
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
                leading: Image(image: AssetImage("assets/images/fight.png")),
                title: Text(
                  "Fight",
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
          )),
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
