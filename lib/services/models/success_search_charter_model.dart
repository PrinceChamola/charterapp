class SuccessSearchCharterModel {
  List<Data>? data;
  String? errorFlag;
  String? message;

  SuccessSearchCharterModel({this.data, this.errorFlag, this.message});

  SuccessSearchCharterModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    errorFlag = json['error_flag'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error_flag'] = this.errorFlag;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? chartererId;
  String? chartererName;
  String? tier;

  Data({this.chartererId, this.chartererName, this.tier});

  Data.fromJson(Map<String, dynamic> json) {
    chartererId = json['chartererId'];
    chartererName = json['chartererName'];
    tier = json['Tier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chartererId'] = this.chartererId;
    data['chartererName'] = this.chartererName;
    data['Tier'] = this.tier;
    return data;
  }
}
