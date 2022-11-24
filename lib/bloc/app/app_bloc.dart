

import 'package:charterapp/bloc/app/app_event.dart';
import 'package:charterapp/bloc/app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(DarkThemeState()) {
    on<LightThemeEvent>((event, emit) => emit(LightThemeState()));
    on<DarkThemeEvent>((event, emit) => emit(DarkThemeState()));
  }
}