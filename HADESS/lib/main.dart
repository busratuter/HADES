// main.dart

import 'package:flutter/material.dart';
import 'LocationService.dart';
import 'EmergencyCallingScreen.dart';
import 'GeminiWebView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('H.A.D.E.S')),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: EmergencyButton(),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hi! I'm your psychologist.\nTalk to me 😊",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 8.0),
            PhotoButton(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class EmergencyButton extends StatefulWidget {
  @override
  _EmergencyButtonState createState() => _EmergencyButtonState();
}

class _EmergencyButtonState extends State<EmergencyButton> {
  bool callingHelp = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _handleEmergencyButtonClick(context);
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(100.0),
        primary: Color(0xff9f1309),
      ),
      child: Text(
        callingHelp ? 'Calling Help' : 'HADES',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
        ),
      ),
    );
  }

  Future<void> _handleEmergencyButtonClick(BuildContext context) async {
    if (callingHelp) {
      return; 
    }

    setState(() {
      callingHelp = true; 
    });

    try {
      await LocationService.handleLocationButtonClick();

      setState(() {
        callingHelp = false;
      });

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EmergencyCallingScreen(),
      ));
    } catch (error) {
      setState(() {
        callingHelp = false; 
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }
}

class PhotoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GeminiWebView(
                apiKey: 'YOUR_GEMINI_API_KEY'),
          ),
        );
      },
      child: Container(
        width: 150.0,
        height: 100.0,
        child: Image.asset(
          'assets/gemini_icon.jpg',
          fit: BoxFit.cover, 
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
