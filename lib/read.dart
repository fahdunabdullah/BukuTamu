import 'dart:convert';

import 'package:buku_tamu/ya.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController objectiveController = TextEditingController();

  Future<void> _kirimData() async {
    print("Tombol ditekan!");
    var url = Uri.http("localhost", "phpflutter/simpan.php", {'q': '{http}'});
    var respon = await http.post(url, body: {
      "id": idController.text,
      "name": nameController.text,
      "email": emailController.text,
      "address": addressController.text,
      "objective": objectiveController.text,
    });
    var data = jsonDecode(respon.body);
    if (data.toString() == 'Berhasil') {
      print("Data terkirim");
    } else {
      print("Gagal!");
    }
  }

  Future<void> _updateData() async {
    var url = Uri.http("localhost", "phpflutter/update.php");
    var response = await http.post(url, body: {
      "id": idController.text,
      "name": nameController.text,
      "email": emailController.text,
      "address": addressController.text,
      "objective": objectiveController.text,
    });
    if (response.statusCode == 200) {
      print("Data updated");
    } else {
      print("Failed to update data");
    }
  }

  Future<void> _hapusData() async {
    var url = Uri.http("localhost", "phpflutter/delete.php");
    var response = await http.post(url, body: {
      "id": idController.text,
      "name": nameController.text,
      "email": emailController.text,
      "address": addressController.text,
      "objective": objectiveController.text,
    });
    if (response.statusCode == 200) {
      print("Data deleted");
    } else {
      print("Failed to delete data");
    }
  }

  Future<void> _ambilData() async {
    var url = Uri.http("localhost", "phpflutter/read.php");
    var response = await http.post(url, body: {
      "id": idController.text,
      "name": nameController.text,
      "email": emailController.text,
      "address": addressController.text,
      "objective": objectiveController.text,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data.toString() == 'Berhasil') {
        print("Data fetched");
        idController.text = data['id'];
        nameController.text = data['name'];
        emailController.text = data['email'];
        addressController.text = data['address'];
        objectiveController.text = data['objective'];
      } else {
        print("Failed to fetch data");
      }
    } else {
      print("Failed to fetch data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guest Book"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 86, 254, 223),
                Color.fromARGB(255, 212, 33, 243),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [


              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _kirimData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YaPage(
                              id : idController.text,
                              name: nameController.text,
                              email: emailController.text,
                              address: addressController.text,
                              objective: objectiveController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Save"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _updateData();
                      }
                    },
                    child: const Text("update"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _hapusData();
                      }
                    },
                    child: const Text("Delete"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _ambilData();
                      }
                    },
                    child: const Text("Read"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
