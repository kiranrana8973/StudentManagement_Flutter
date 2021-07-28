import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:studentmanagement/model/student.dart';
import 'package:studentmanagement/model/user.dart';
import 'package:studentmanagement/response/studentresponse.dart';
import '../api/url.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Student> lstStudents = [];

  @override
  void initState() {
    _getAllStudents();
    super.initState();
  }

/*

    var response = await http.post(Uri.parse(url), body: body);
    var jsonResponse;
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      //To get the value from jsonresponse
      var token = jsonResponse["token"];
      Url.token = token;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    }
*/
  void _getAllStudents() async {
    String url = "${Url.url}student/";
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${Url.token}',
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      lstStudents = (jsonResponse['data'] as List)
          .map((student) => Student.fromJson(student))
          .toList();
      // lstStudents = jsonResponse
      //     .map((val) => new StudentResponse.fromJson(val['data']))
      //     .toList();

      print(lstStudents);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(Url.token);
                },
                child: Text('Show Students'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
