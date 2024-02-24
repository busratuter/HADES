// EmergencyCallingScreen.dart

import 'package:flutter/material.dart';

class EmergencyCallingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calling HELP...'),
        backgroundColor: Colors.amber, 
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors
                      .white), 
            ),
            child: Text(
              'Calling HELP...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
