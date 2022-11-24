import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:charterapp/services/Injector.dart';
import 'package:charterapp/services/api_providers/api_constants.dart';
import 'package:charterapp/services/models/charter_model.dart';
import 'package:charterapp/services/models/charter_success_model.dart';
import 'package:charterapp/services/models/error_model_add_charter.dart';
import 'package:charterapp/services/models/login_response_model.dart';
import 'package:charterapp/services/models/success_search_charter_model.dart';
import 'package:charterapp/utils/helper/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharterApiProvider {
  late Dio _dio;

  CharterApiProvider() {
    _dio = Injector().getDio();
  }

  Future<dynamic> loginApiProvider() async {
    try {
      final data = await _dio.post(
        ApiConstants.loginUrl,
        data: {
          "email": "xihoh55496@dineroa.com",
          "password": "Marlo@123",
          "returnSecureToken": true
        },
      );
      LoginResponse loginData = LoginResponse.fromJson(data.data);
      SharedPreferenceHelper().saveFcmToken(loginData.idToken);
      return true;
    } catch (error) {}
  }

  Future<dynamic> addCharter(CharterModel model, BuildContext context ) async {
    try {
      print("MODELLLLLL:::::: ${model.toJson()}");
      final data = await _dio.post(ApiConstants.addCharter,
          data: model,
          options: Options(
              headers: {"authToken": SharedPreferenceHelper().getFcmToken()}));
      SuccessModelAddCharter response =
          SuccessModelAddCharter.fromJson(data.data);
      var snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          color: Colors.green,
          title: 'Success!',
          message: response.message!,
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    } catch (error) {
      final res = (error as dynamic).response;
      ErrorModelAddCharter errorResponse = ErrorModelAddCharter.fromJson(res.data);
      var snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error!',
          message: '${errorResponse.error?.message}',
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return null;
      try {
      } catch (e) {
        return null;
      }
    }
  }

  Future<dynamic> searchCharter(String? value) async {
    try{
      final data = await _dio.get(ApiConstants.searchCharter,
          queryParameters: {
            "charterer_name": value
          },
          options: Options(
          headers: {"authToken": SharedPreferenceHelper().getFcmToken()}));
      SuccessSearchCharterModel response = SuccessSearchCharterModel.fromJson(data.data);
      return response;
    }catch(error) {
      final res = (error as dynamic).response;
      ErrorModelAddCharter errorResponse = ErrorModelAddCharter.fromJson(res.data);
      return errorResponse;
    }
  }
}
