import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:treatacard_web_app/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Error extends StatefulWidget {
  const Error({super.key});

  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);

    super.dispose();
  }

  final ButtonStyle styleb = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontFamily: "IRANYekan", fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 400,
                  width: 400,
                  child: Image(image: AssetImage("assets/no_internet.jpg")),
                ),
                const Text(
                  "خطا در برقراری ارتباط",
                  style: TextStyle(
                    fontFamily: "IRANYekan",
                    color: Colors.black,
                    fontSize: 32,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Home()),
                      );
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text(
                      'تلاش دوباره',
                      style: TextStyle(
                        fontFamily: "IRANYekan",
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
