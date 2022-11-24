import 'package:charterapp/bloc/charter/charter_event.dart';
import 'package:charterapp/bloc/charter/charter_state.dart';
import 'package:charterapp/services/api_providers/charater_api_provider.dart';
import 'package:charterapp/services/models/error_model_add_charter.dart';
import 'package:charterapp/services/models/success_search_charter_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CharterBloc extends Bloc<CharterEvent, CharterState> {
  CharterBloc() : super(InitialState()) {
    on<SearchCharterEvent>((event, emit) async {
      final data = await CharterApiProvider().searchCharter(event.value);
      if (data is SuccessSearchCharterModel) {
        SuccessSearchCharterModel response = data;
        emit(CharterSearchState(data: response));
      } else if (data is ErrorModelAddCharter) {
        emit(CharterErrorState());
      }
    });
    on<CharterAddEvent>((event, emit) async{
      emit(Loading());
      try {
        final data =
            await CharterApiProvider().addCharter(event.model, event.context);
        emit(LoadingEnd());
      } catch (e) {
        emit(LoadingEnd());
      }
    });
  }
}
