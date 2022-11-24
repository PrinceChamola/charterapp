class ErrorSearchCharterModel {
  Error? error;

  ErrorSearchCharterModel({this.error});

  ErrorSearchCharterModel.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Error {
  String? errorFlag;
  String? message;

  Error({this.errorFlag, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    errorFlag = json['error_flag'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_flag'] = this.errorFlag;
    data['message'] = this.message;
    return data;
  }
}