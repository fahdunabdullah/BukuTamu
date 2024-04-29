import 'package:flutter/material.dart';
import 'package:buku_tamu/dashboard.dart';

class YaPage extends StatelessWidget {
  // const YaPage({
    // Key? key,
    // this.id,
    // this.name,
    // this.email,
    // this.address,
    // this.objective,
  // }) : super(key: key);

  // final String? id;
  // final String? name;
  // final String? email;
  // final String? address;
  // final String? objective;


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
        title: Text("WHO HAS COME"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text("Hi! ${name ?? 'none'}"),
                // Text("id : ${id ?? 'none'}"),
                // Text("Email: ${email ?? 'none'}"),
                // Text("Address: ${address ?? 'none'}"),
                // Text("Objective: ${objective ?? 'none'}"),
                SizedBox(height: 20),
                Card(
                  elevation: 3,
                  child: Center(
                    child: Image.asset(
                      "",
                      width: 450,
                      height: 450,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 51, 28, 255),
                    onPrimary: Colors.white,
                  ),
                  child: Text("ADD"),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 21, 19, 19),
                    onPrimary: Colors.white,
                  ),
                  child: Text("Back to Dashboard"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
