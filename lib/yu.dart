import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:buku_tamu/admin.dart';

class yu extends StatelessWidget {
  Future<void> _updateData(BuildContext context) async {
    print("Updating data...");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Updating data...")),
    );
    await Future.delayed(Duration(seconds: 2));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data updated")),
    );
  }

  Future<void> _deleteData(BuildContext context) async {
    print("Deleting data...");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Deleting data...")),
    );
    await Future.delayed(Duration(seconds: 2));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data deleted")),
    );
  }

  Future<void> _readData(BuildContext context) async {
    print("Reading data...");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Reading data...")),
    );
    await Future.delayed(Duration(seconds: 2));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data fetched")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Data Berhasil!"),
                SizedBox(height: 20),
                Card(
                  elevation: 3,
                  child: Center(
                    child: Image.asset(
                      "assets/d.jpg",
                      width: 450,
                      height: 450,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to logout?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
                              },
                              child: Text('Logout'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 19, 19),
                    onPrimary: Colors.white,
                  ),
                  child: Text("Back to Dashboard"),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _updateData(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 51, 28, 255),
                        onPrimary: Colors.white,
                      ),
                      child: Text("Update"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _deleteData(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 51, 28, 255),
                        onPrimary: Colors.white,
                      ),
                      child: Text("Delete"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _readData(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 51, 28, 255),
                        onPrimary: Colors.white,
                      ),
                      child: Text("Read"),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
