import 'package:flutter/material.dart';

import 'loading_screen.dart';

class ErrorScreen extends StatefulWidget {
  String error;

  ErrorScreen({this.error});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                SizedBox(width: 10.0),
                Text(widget.error),
              ],
            ),
            SizedBox(height: 50.0),
            TextButton.icon(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
              },
              icon: Icon(Icons.refresh),
              label: Text('Enable Location and Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
