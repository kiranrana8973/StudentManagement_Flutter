import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studentmanagement/model/student.dart';
import '../api/url.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Student> _lstStudents = [];
  final String imageURL = "http://10.0.2.2:3000/uploads/";

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

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        _lstStudents = (jsonResponse['data'] as List)
            .map((student) => Student.fromJson(student))
            .toList();
      });
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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 10,
                child: new ListView.builder(
                  itemCount: _lstStudents.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: _lstStudents[index].fullname,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        title: Text(_lstStudents[index].fullname),
                        subtitle: Text(_lstStudents[index].gender),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              imageURL + _lstStudents[index].photo),
                          backgroundColor: Colors.transparent,
                        ),
                        trailing: Wrap(
                          spacing: 10,
                          children: [
                            IconButton(
                              onPressed: () {
                                print('Edit clicked');
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg: _lstStudents[index].fullname,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
