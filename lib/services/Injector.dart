import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Injector {
  static final Injector _singleton = Injector._internal();
  static final _dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  Dio getDio() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 180000, connectTimeout: 180000);
    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());
    return _dio;
  }

  static Options? getHeaderToken() {
/*    // String? token = SharedPreferenceHelper().getUserToken();
    if (token != null) {
      //  print("token=" + token);
      //  String? userId = SharedPreferenceHelper().getUserId();
      if (userId != null) {
        print("userId=" + userId.toString());
      }*/
    var headerOptions = Options(headers: {
      "X-USER-CLIENT": "ANDROID",
      "X-APP-VERSION": "1.0.0",
      "X-TENANT-ID": "EPOSTBOOK",
      "X-TENANT-SUB": "RETAIL",
      'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.'
          'eyJpc3MiOiJwb3N0YmFnIiwiYXVkIj'
          'oicG9zdGJhZyIsImlhdCI6MTY2NTQ5O'
          'Dk3OCwibmJmIjoxNjY1NDk4OTg4LCJleHA'
          'iOjE2Njk4MTg5NzgsImRhdGEiOnsidHlwZS'
          'I6Imd1ZXN0IiwiaWQiOiI1ZjM3YzU3YzY1NG'
          'FiNzUwOGRhYmU5YWQ4NzQ4YjlmNiIsInBsYX'
          'Rmb3JtIjoiQU5EUk9JRCIsInZlcnNpb24iOiI'
          'xLjAuMCIsImFnZW50IjoiUG9zdG1hblJ1bnRpb'
          'WVcLzcuMjkuMiIsImlwIjoiNDkuMTUuMjI2LjI'
          'yMCIsInRlbmFudCI6IkVQT1NUQk9PSyIsInRlbm'
          'FudHN1YiI6IlJFVEFJTCJ9fQ.AsJMk29_EqxWFr'
          '8Z94rIBL6i8NRXbfKCboLXQcYOm1I',
    });
    return headerOptions;
  }
}

class LoggingInterceptors extends Interceptor {
  String printObject(Object object) {
    // Encode your object and then decode your object to Map variable
    Map jsonMapped = json.decode(json.encode(object));

    // Using JsonEncoder for spacing
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');

    // encode it to string
    String prettyPrint = encoder.convert(jsonMapped);
    return prettyPrint;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        "--> ${options.method.toUpperCase()} ${"" + (options.baseUrl) + (options.path)}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));
    if (options.data != null) {
      try {
        // print("Body: ${printObject(options.data)}");
        FormData formData = options.data as FormData;
        print("Body:-------");
        var buffer = [];
        for (MapEntry<String, String> pair in formData.fields) {
          buffer.add(pair.key + ':' + pair.value);
        }
        print("Body:{${buffer.join(', ')}}");
      } catch (e) {
        print("Body: ${printObject(options.data)}");
      }
    }
    print(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(
        "<-- ${dioError.message} ${(dioError.response?.requestOptions != null ? (dioError.response!.requestOptions.baseUrl + dioError.response!.requestOptions.path) : 'URL')}");
    print(
        "${dioError.response != null ? dioError.response!.data : 'Unknown Error'}");
    print("<-- End error");
    if (dioError.response!.statusCode == 403) {
      //   var errorModel = ErrorModel.fromJson(dioError.response!.data);
      //   MyApp.startFirstScreen(errorModel.message);
      return;
    }
    return super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}
