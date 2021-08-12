import 'package:flutter/material.dart';
import 'package:studentmanagement/screens/viewstudents.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewStudent(),
                      ),
                    );
                  },
                  child: Text(
                    'View Students',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
