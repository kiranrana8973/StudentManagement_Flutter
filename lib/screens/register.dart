import 'package:flutter/material.dart';
import '../api/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

final fnameController = TextEditingController();
final lnameController = TextEditingController();
final usernameController = TextEditingController();
final passwordController = TextEditingController();

class _RegisterUserState extends State<RegisterUser> {
  @override
  void initState() {
    fnameController.text = "Kiran";
    lnameController.text = "Rana";
    usernameController.text = "kiran";
    passwordController.text = "kiran123";
    super.initState();
  }

  void _Registeruser() async {
    Map user = {
      "fname": fnameController.text,
      "lname": lnameController.text,
      "username": usernameController.text,
      "password": passwordController.text
    };

    String url = "${Url.url}auth/register";
    var response = await http.post(Uri.parse(url), body: user);
    var jsonResponse;
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse["success"]);
    } else if (response.statusCode == 400) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse["error"]);
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                child: TextFormField(
                  controller: fnameController,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "First Name",
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(),
                    hintText: 'First Name',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  controller: lnameController,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(),
                    hintText: 'Last Name',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  autofocus: true,
                  controller: usernameController,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Register'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _Registeruser();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
