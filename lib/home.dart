import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:treatacard_web_app/error.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var loadingPercentage = 0;
  var canPop = false;
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://treatacard.com"));

  @override
  void initState() {
    super.initState();
    controller
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          loadingPercentage = 0;
        });
      }, onProgress: (progress) {
        setState(() {
          loadingPercentage = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          loadingPercentage = 100;
        });
      }, onWebResourceError: (error) {
        print(error);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Error()),
        );
      }))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("Snackbar", onMessageReceived: (message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.message)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PopScope(
                canPop: canPop,
                onPopInvoked: (didPop) async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "برای خروج یک بار دیگر دکمه بازگشت را بزنید",
                        style: TextStyle(
                          fontFamily: "IRANYekan",
                          fontSize: 18,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ));
                    setState(() {
                      canPop = true;
                    });
                  }
                },
                child: Stack(children: [
                  WebViewWidget(controller: controller),
                  if (loadingPercentage < 100)
                    LinearProgressIndicator(
                      value: loadingPercentage / 100.0,
                      color: Colors.blue,
                    )
                ]))));
  }
}
