import 'package:flutter/material.dart';

import 'main.dart';

class Result extends StatelessWidget {
  int result;
  int totalQues;
  Result({Key? key,required this.result,required this.totalQues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message ="";
    if(result<=totalQues/2){
      message="We are so sorry but you get $result/$totalQues which makes %${(result/totalQues * 100).round()}";
    }else{
      message="Congratulations you get $result/$totalQues which makes %${(result/totalQues * 100).round()}";
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(flex: 1,child: SizedBox()),
                  Text(message,style: const TextStyle(fontSize: 25)),
                  const Expanded(flex: 1,child: SizedBox()),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (_){
                            return const App();
                          }
                      ),
                    );
                  }, child: const Text("Back",))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
