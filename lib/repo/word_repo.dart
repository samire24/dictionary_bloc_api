import 'dart:io';

import 'package:dictionary_bloc_api/model/word_model.dart';
import 'package:dictionary_bloc_api/service/http_service.dart';
import 'package:flutter/material.dart';

class WordRepository {
  Future<List<WordResponse>?> getWordsFromDictionary(String query) async{
    try {
      final response = await HttpService.getRequest("en/$query");
      
      if (response.statusCode == 200){
        final result = wordResponseFromJson(response.body);
        return result;
      }else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    }on HttpException catch (e) {
      throw e;
    }on FormatException catch (e) {
      throw e;
    }
  }
}