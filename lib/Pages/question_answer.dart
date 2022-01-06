//import 'dart:core';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webappflutter/Models/answer.dart';
class QustionAnswerPage extends StatefulWidget {
  const QustionAnswerPage({Key? key}) : super(key: key);

  @override
  _QustionAnswerPageState createState() => _QustionAnswerPageState();
}

class _QustionAnswerPageState extends State<QustionAnswerPage> {

  final TextEditingController _textContoller = TextEditingController();

  Answer? _currentAnswer;
var cliet = http.Client();
  _handleGetAnswer()async{
    String qustionText = _textContoller.text.trim();
    if(qustionText == null&& qustionText.isEmpty && qustionText[qustionText.length-1] !='?'){
      return;
    }
      try{
        http.Response response = await http.get(Uri.parse('https://yesno.wtf/api'));

        if(response.statusCode == 200 && response.body.isNotEmpty){
          Map<String,dynamic> responseBody = json.decode(response.body);
          Answer answer =Answer.fromMap(responseBody);
          setState(() {
            _currentAnswer = answer;
          });
          print(_currentAnswer!.image);
        }
      }catch(err,stakTrace){
        print("from err :$err");
        print("from stack : $stakTrace");
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("I know everything"),
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Container(
            width: 0.5* MediaQuery.of(context).size.width,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: "Ask a Question",
                  border: OutlineInputBorder()
                ),
              )),
          const SizedBox(height: 20,),
          if(_currentAnswer != null)
              Stack(
                children:[
                Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_currentAnswer!.image.toString()),
                  )
                ),
            ),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                      child:Text(_currentAnswer!.answer.toUpperCase(),style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 24
                      ),) ,
                      )
                  )
            ]
              ),
            
          if(_currentAnswer != null)
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _handleGetAnswer, child:const Text('Get Answer')),
              const SizedBox(width: 20,),
              ElevatedButton(onPressed: (){}, child:const Text('Reset')),
            ],
          )
        ],
      ),
    );
  }
}
