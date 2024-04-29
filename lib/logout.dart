
import 'package:flutter/material.dart';
import 'package:buku_tamu/main.dart';

class YuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('exit'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
               MaterialPageRoute(
      builder: (context) => MyApp(),
    ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
          ),
          child: Text('Logout'),
        ),
      ),
    );
  }
}

