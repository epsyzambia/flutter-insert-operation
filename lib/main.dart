import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();

  String press() {
    print('Data inserted successfully');
    return 'code';
  }

  Future<void> senddata() async {
    try {
      final response = await http
          .post(Uri.parse("https://trendallapp.com/insertdata.php"), body: {
        "name": name.text,
        "email": email.text,
        "mobile": mobile.text,
      });

      if (response.statusCode == 200) {
        // Request was successful
        print('Data inserted successfully');
        // Optionally, you can show a success message or perform any other actions
      } else {
        // Request failed
        print('Failed to insert data. Error: ${response.statusCode}');
        // Optionally, you can show an error message or perform any other error handling
      }
    } catch (e) {
      // Exception occurred during the request
      print('Error occurred while inserting data: $e');
      // Optionally, you can show an error message or perform any other error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "your name",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(hintText: 'name'),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              Text(
                "Mobile",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: mobile,
                decoration: InputDecoration(hintText: 'Mobile'),
              ),
              ElevatedButton(
                child: Text("Register"),
                onPressed: () {
                  senddata();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
