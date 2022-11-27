import 'package:bloc/bloc.dart';
import 'package:dictionary_bloc_api/model/word_model.dart';
import 'package:dictionary_bloc_api/repo/word_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _wordRepository;
  DictionaryCubit(this._wordRepository) : super(NoWordSearchedState());

  final queryController = TextEditingController();

  Future getWordSearched() async{
    emit(WordSearchingState());

    try {
      final words = await _wordRepository.getWordsFromDictionary(queryController.text);
      
      if (words == null){
        emit(ErrorState("There is no word to return"));
      }else{
        print(words.toString());
        emit(WordSearchedState(words));
        emit(NoWordSearchedState());
      }
    } on Exception catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }

}
