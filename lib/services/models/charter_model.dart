class CharterModel {
  ChartererDetails? chartererDetails;

  CharterModel({this.chartererDetails});

  CharterModel.fromJson(Map<String, dynamic> json) {
    chartererDetails = json['chartererDetails'] != null
        ? new ChartererDetails.fromJson(json['chartererDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chartererDetails != null) {
      data['chartererDetails'] = this.chartererDetails!.toJson();
    }
    return data;
  }
}

class ChartererDetails {
  String? name;
  String? email;
  String? address1;
  String? address2;
  String? state;
  String? city;
  String? country;
  String? website;
  String? contactPerson;
  String? phoneNumber;

  ChartererDetails(
      {this.name,
        this.email,
        this.address1,
        this.address2,
        this.state,
        this.city,
        this.country,
        this.website,
        this.contactPerson,
        this.phoneNumber});

  ChartererDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address1 = json['address1'];
    address2 = json['address2'];
    state = json['state'];
    city = json['city'];
    country = json['country'];
    website = json['website'];
    contactPerson = json['contactPerson'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    data['website'] = this.website;
    data['contactPerson'] = this.contactPerson;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}