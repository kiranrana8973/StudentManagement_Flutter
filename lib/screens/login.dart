import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studentmanagement/response/user_response.dart';
import 'package:studentmanagement/screens/dashboard.dart';
import 'package:studentmanagement/screens/register.dart';
import '../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //_getAllStudents();
    usernameController.text = "kiran";
    passwordController.text = "kiran123";

    super.initState();
  }

  late UserResponse userResponse;

  // Future _getUser() async {
  //   Response response;
  //   try {
  //     response = await httpService.getRequest("auth/me");

  //     if (response.statusCode == 200) {
  //       userResponse = UserResponse.fromJson(response.data);
  //     } else {
  //       print("Error");
  //     }
  //   } on Exception catch (e) {
  //     print("Mero error " + e.toString());
  //   }
  // }

  void _login() async {
    var username = usernameController.text;
    var password = passwordController.text;

    Map body = {"username": username, "password": password};

    var response = await http.post(Uri.parse(LOGIN_URL), body: body);
    var jsonResponse;
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      //To get the value from jsonresponse
      tokenConstant = jsonResponse["token"];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                  child: Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterUser(),
                      ),
                    );
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
