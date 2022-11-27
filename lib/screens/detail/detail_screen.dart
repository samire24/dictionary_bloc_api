import 'package:dictionary_bloc_api/bloc/dictionary_cubit.dart';
import 'package:dictionary_bloc_api/model/word_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final WordResponse wordresponse;

  DetailScreen({Key? key, required this.wordresponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "${wordresponse.word}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final meaning = wordresponse.meanings[index];
                      final definations = meaning.definitions;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meaning.partOfSpeech,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8,),
                          ListView.separated(
                              itemBuilder: (context, index)=>Column(
                                children: [
                                  Text("Definations: "+ definations[index].definition),
                                  SizedBox(height: 8,),
                                  Text("Sentence: + ${definations[index].example}"),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                              separatorBuilder: (context,index)=> SizedBox(height: 8,),
                              itemCount: definations.length,
                              shrinkWrap: true,
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index)=>SizedBox(height: 32,),
                    itemCount: wordresponse.meanings.length),),
          ],
        ),
      ),
    );
  }
}
