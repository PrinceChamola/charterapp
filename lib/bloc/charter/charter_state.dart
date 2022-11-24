

import 'dart:ffi';

import 'package:charterapp/services/models/success_search_charter_model.dart';

abstract class CharterState {}

class InitialState extends CharterState {}

class CharterSearchState extends CharterState {
  SuccessSearchCharterModel data ;

  CharterSearchState({required this.data});
}

class Loading extends CharterState{}

class LoadingEnd extends CharterState{}

class CharterErrorState extends CharterState {}

class CharterAddState extends CharterState {

}


