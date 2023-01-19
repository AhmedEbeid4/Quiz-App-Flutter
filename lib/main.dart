import 'package:flutter/material.dart';
import 'package:quiz_app/quez_ui.dart';

void main() {
  runApp(const App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding()
    );
  }
}
class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_){
                        return const Quiz();
                      }
                  ),
                );
              },
                child: const Text("Start"),),
            ),
          ),
        ),
      ),
    );
  }
}


