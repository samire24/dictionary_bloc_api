part of 'dictionary_cubit.dart';

@immutable
abstract class DictionaryState {

}

class NoWordSearchedState extends DictionaryState {

}
class WordSearchingState extends DictionaryState {

}
class WordSearchedState extends DictionaryState {
  final List<WordResponse> words;
  WordSearchedState( this.words);
}
class ErrorState extends DictionaryState {
  final message;
  ErrorState(this.message);

}
