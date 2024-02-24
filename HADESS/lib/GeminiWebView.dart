import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GeminiWebView extends StatelessWidget {
  final String apiKey; 

  const GeminiWebView({Key? key, required this.apiKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Theme.of(context).platform == TargetPlatform.android) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your AI Psychologist'),
          backgroundColor: Colors.amber,
        ),
        body: WebView(
          initialUrl: 'https://www.gemini.com/chat?apiKey=$apiKey',
          javascriptMode: JavascriptMode.unrestricted,
          onWebResourceError: (error) {
            if (error.errorCode == 1009) {
              print('Dosya veya kaynak bulunamadı.');
            }
          },
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text('WebView is not supported on this platform.'),
        ),
      );
    }
  }
}
