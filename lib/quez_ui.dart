import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/result_page.dart';
import 'question.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuesScaffold()
    );
  }
}

class QuesScaffold extends StatefulWidget {
  const QuesScaffold({Key? key}) : super(key: key);

  @override
  State<QuesScaffold> createState() => _QuesScaffoldState();
}

class _QuesScaffoldState extends State<QuesScaffold> {
  List<Question> questions = [
    Question(qu: "Flutter is a ", choices: ['framework', 'library', 'language', 'SDK'], answer: 0),
    Question(qu: "We can design on ", choices: ['SDK', 'SDK', 'JDK', 'Figma'], answer: 3),
    Question(qu: "Dart is a " , choices: ['Programming Language', 'IDE', 'SDK', 'Mohamed Salah'], answer: 0),
    Question(qu: "Java is a " , choices: ['Programming Language', 'IDE', 'SDK', 'Mohamed Salah'], answer: 0),
    Question(qu: "OOP stands for " , choices: ['Programming Language', 'Object Oriented Programming', 'SDK', 'Mohamed Salah'], answer: 1),
    Question(qu: "Widget have a mutable state", choices: ['Staful', 'JDK', 'SDK', 'Stateless'], answer: 0),
    Question(qu: "Widget have not a mutable state", choices: ['Staful', 'JDK', 'SDK', 'Stateless'], answer: 3),
  ];

  int _currQue = 0;
  int _counter = 60;
  int _correctAnswers=0;
  void checkIfTheLastQue(BuildContext context, int userAnswer){
    if(questions[_currQue].answer == userAnswer){
      _correctAnswers++;
     setState(() {
       questions[_currQue].statue=1;
     });
    }else{
      setState(() {
        questions[_currQue].statue=-1;
      });
    }
    if(_currQue == questions.length-1 && hasUserFinished()){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_){
              return Result(result: _correctAnswers, totalQues: questions.length);
            }
        ),
      );
    }else{
      if(_currQue != questions.length-1){
        setState(() {
          _currQue++;
        });
      }
    }
  }
  void finish(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_){
            return Result(result: _correctAnswers, totalQues: questions.length);
          }
      ),
    );
  }
  bool hasUserFinished(){
    for(int i=0; i<questions.length;i++){
      if(questions[i].statue == 0){
        return false;
      }
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${_currQue+1}",style: const TextStyle(fontSize: 25),),
                  ElevatedButton(onPressed: (){
                    finish();
                  }, child: const Text("Submit"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    itemCount: questions.length,
                    itemBuilder: (ctx, index) {
                      return
                        ItemOfQuestion(
                          message: '${index+1}',
                          customOnTap: (){
                            setState(() {
                              _currQue=index;
                            });
                          },
                        );
                    }
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Expanded(flex: 1,child: SizedBox()),
                  Text(questions[_currQue].qu,style: const TextStyle(fontSize: 20)),
                  const Expanded(flex: 1,child: SizedBox()),
                ],
              ),
              const Expanded(flex: 1,child: SizedBox()),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed:
                    questions[_currQue].statue == 0 ? () {
                      checkIfTheLastQue(context, 0);
                    }:null,
                    child: Text(questions[_currQue].choices[0])),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: questions[_currQue].statue == 0 ? () {
                  checkIfTheLastQue(context, 1);
                }:null,
                    child: Text(questions[_currQue].choices[1])),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed:questions[_currQue].statue == 0 ? () {
                  checkIfTheLastQue(context, 2);
                }:null,
                    child: Text(questions[_currQue].choices[2])),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: questions[_currQue].statue == 0 ? () {
                  checkIfTheLastQue(context, 3);
                }:null,
                    child: Text(questions[_currQue].choices[3])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemOfQuestion extends StatefulWidget {
  GestureTapCallback customOnTap;
  String message = '-1';

  ItemOfQuestion({Key? key, required this.message,required this.customOnTap}) : super(key: key);

  @override
  State<ItemOfQuestion> createState() => _ItemOfQuestionState();
}

class _ItemOfQuestionState extends State<ItemOfQuestion> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.customOnTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: Colors.blue),
          ),
              child: Text(widget.message,style: const TextStyle(fontSize: 18),
              ),
          ),
    );
  }
}
