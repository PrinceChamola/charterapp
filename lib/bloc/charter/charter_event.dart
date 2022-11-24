import 'package:charterapp/bloc/charter/charter_state.dart';
import 'package:flutter/cupertino.dart';

import '../../services/models/charter_model.dart';

abstract class CharterEvent {}

class SearchCharterEvent extends CharterEvent {
  String value;

  SearchCharterEvent({required this.value});
}

class CharterAddEvent extends CharterEvent {
  BuildContext context;
  CharterModel model;

  CharterAddEvent({required this.model, required this.context});
}
