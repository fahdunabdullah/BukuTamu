import 'dart:convert';

import 'package:buku_tamu/logout.dart';
import 'package:buku_tamu/ya.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key) ;

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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Id',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                controller: idController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Id';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Objective',
                  prefixIcon: Icon(Icons.assignment),
                  border: OutlineInputBorder(),
                ),
                controller: objectiveController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Objective';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
                            builder: (context) => YuPage(
                              // id: idController.text,
                              // name: nameController.text,
                              // email: emailController.text,
                              // address: addressController.text,
                              // objective: objectiveController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Save"),
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
