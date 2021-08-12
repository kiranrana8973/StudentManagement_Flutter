import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studentmanagement/httpservice/user_api.dart';
import 'package:studentmanagement/model/student.dart';
import 'package:studentmanagement/screens/addstudent.dart';
import '../constants/constants.dart';

class ViewStudent extends StatefulWidget {
  const ViewStudent({Key? key}) : super(key: key);

  @override
  _ViewStudentState createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
  List<Student> _lstStudents = [];

  @override
  void initState() {
    _getAllStudents();
    super.initState();
  }

  late UserAPI userAPI;

  void _getAllStudents() async {
    var response = await http.get(
      Uri.parse(GET_STUDENT_URL),
      headers: {
        'Authorization': 'Bearer $tokenConstant',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(
        () {
          _lstStudents = (jsonResponse['data'] as List)
              .map(
                (student) => Student.fromJson(student),
              )
              .toList();
        },
      );
    }
  }

  void _deleteStudent(String id) async {
    try {
      var response = await http.delete(
        Uri.parse(DELETE_STUDENT_URL + id),
        headers: {
          'Authorization': 'Bearer $tokenConstant',
        },
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Student deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void _showAlertDialog(BuildContext context, int index) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        _deleteStudent(_lstStudents[index].id);
        setState(() {
          _lstStudents.remove(_lstStudents[index]);
        });
        Navigator.pop(context); // close the dialog
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("Are you sure you want to delete ?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
                  print(tokenConstant);
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
                          backgroundImage:
                              _lstStudents[index].photo != "no-photo.jpg"
                                  ? NetworkImage(
                                      imageURL + _lstStudents[index].photo)
                                  : null,
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
                              onPressed: () => _showAlertDialog(context, index),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddStudentDialog(context),
        child: const Icon(Icons.person_add),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _openAddStudentDialog(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddStudent(),
      ),
    );
  }
}
