import 'package:buku_tamu/yu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(admin());
}
  
class admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
       
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter valid username and password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Masuk"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Nama Admin'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Kata Sandi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text == 'fahd' && passwordController.text == '12345') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => yu()),
                  );
                } else {
                  _showErrorDialog();
                }
              },
              child: Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}