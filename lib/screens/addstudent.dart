import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  late XFile? _image;

  _openGallery() async {
    // var pickedFile = await ImagePicker().pickImage(
    //   source: ImageSource.gallery,
    //   maxWidth: 500,
    //   maxHeight: 500,
    // );
    // if (pickedFile != null) {
    //   _image = File(pickedFile.path);
    // }

    _image = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  _openCamera() {}

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Make a choice"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text('Open Gallery'),
                  onTap: () {
                    _openGallery();
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                GestureDetector(
                  child: Text('Open Camera'),
                  onTap: () {
                    _openCamera();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  var _fullnameController = TextEditingController();
  var _ageController = TextEditingController();
  // var _genderController = TextEditingController();
  // var _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _imagePath = "assets/images/index.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _showChoiceDialog(context);
                  },
                  child: Container(
                    child: _image != null
                        ? new Image.asset(
                            _imagePath,
                            height: 300,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            child: Image.file(
                              _image as File,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    controller: _fullnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(),
                      hintText: "Full name",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Age",
                      border: OutlineInputBorder(),
                      hintText: "Age",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add Student'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
