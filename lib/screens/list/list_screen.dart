import 'package:dictionary_bloc_api/model/word_model.dart';
import 'package:dictionary_bloc_api/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<WordResponse> words;

  ListScreen({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
        itemCount: words.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            "${index + 1}. ${words[index].word}",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(wordresponse: words[index]),
              ),
            );
          },
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
