import 'dart:convert';
import 'package:flutter/material.dart';
import '../api/url.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    _getAllStudents();
    super.initState();  
  }

  void _getAllStudents() async {
    String url = "${Url.url}student/";
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer ${Url.token}',
    });
    var jsonResponse;
    if (response.statusCode == 200) {
      print(response.toString());
      jsonResponse = json.decode(response.body);
      print(jsonResponse["data"]);
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
                child: Text('Arithmetic'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
