import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'progress_hud.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFF02BB9F),
      ),
      home: MyHomePage(title: 'Webview Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProgressHUD(
          child: InAppWebView(
          initialUrl: 'https://mts.csx.com.kh',
          onLoadStop: (InAppWebViewController controller, String url) async {
                    setState(() {
                       _isLoading = false;
                      // this.url = url;
                    });
                  },
        ),
          inAsyncCall: _isLoading,
          opacity: 0.0,
        ));
  }
  void pageFinishedLoading(String url) {
    setState(() {
      _isLoading = false;
    });
  }
} 

// import 'package:flutter/material.dart';
// // import 'package:pps/home_page.dart';
// import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: InAppWebView(
//         initialUrl: 'https://mts.csx.com.kh',
//       ),
//     );
//   }
// }