import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project9/controller/service_controller.dart';
import 'package:project9/views/login.dart';

class UserServicesView extends StatelessWidget {
  final serviceController = Get.put(UserServiceController());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("User"),
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
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.white))),
                    margin: EdgeInsets.zero,
                    accountName: Text("User"),
                    accountEmail: Text("User@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                  )),
              ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
              ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  ),
                  title: Text(
                    "profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
              ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Email me",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
              ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Contact us",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
      body: GetBuilder<UserServiceController>(
        builder: ((controller) {
          return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 240,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              padding: EdgeInsets.only(left: 5, right: 20),
              itemCount: serviceController.serviceData.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    width: 170,
                    height: 240,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 40),
                          child: Image.asset(
                            serviceController
                                .serviceData[index].allServicesImages,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        customText(
                            EdgeInsets.only(top: 20, left: 20),
                            serviceController.serviceData[index].allServices,
                            FontWeight.w600,
                            16.0,
                            Color(0xff181725)),
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25, left: 18),
                            child: SizedBox(
                              width: 140,
                              child: Builder(builder: (context) {
                                return ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.deepPurple),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15)))),
                                    onPressed: () {
                                      final message = SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.blueGrey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          dismissDirection: DismissDirection.up,
                                          content: Text(
                                              "Submitted We will reach as soon as possible"));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(message);
                                    },
                                    child: Text("Help"));
                              }),
                            ),
                          ),
                        ])
                      ],
                    ));
              });
        }),
      ),
    );
  }
}

customText(edgeinset, text, weight, size, color) {
  return Padding(
    padding: edgeinset,
    child: Text(text,
        style: TextStyle(
          fontWeight: weight,
          fontSize: size,
          color: color,
        )),
  );
}
