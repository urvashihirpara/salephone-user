class ServiceRequestModel {
  ServiceRequestModel({
    this.categories,
    this.device,
    this.issue,
    this.personalInformation,
    this.deviceDetails,
  });

  List<String>? categories;
  String? device;
  String? issue;
  PersonalInfo? personalInformation;
  DeviceDetails? deviceDetails;

  factory ServiceRequestModel.fromJson(Map<String, dynamic> json) =>
      ServiceRequestModel(
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        device: json["device"],
        issue: json["issue"],
        personalInformation: json['personalInformation'] == null
            ? null
            : PersonalInfo.fromJson(
                json['personalInformation'] as Map<String, dynamic>),
        deviceDetails: json['deviceDetails'] == null
            ? null
            : DeviceDetails.fromJson(
                json['deviceDetails'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories,
        "device": device,
        "issue": issue,
        'personalInformation': personalInformation?.toJson(),
        'deviceDetails': deviceDetails?.toJson(),
      };
}

class PersonalInfo {
  PersonalInfo({
    this.fullName,
    this.mobileNumber,
    this.email,
    this.pinCode,
  });

  String? fullName;
  String? mobileNumber;
  String? email;
  String? pinCode;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        pinCode: json["pinCode"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName ?? "",
        "mobileNumber": mobileNumber ?? "",
        "email": email ?? "",
        "pinCode": pinCode ?? "",
      };
}

class DeviceDetails {
  DeviceDetails({
    this.brandName,
    this.model,
    this.color,
    this.storage,
    this.serialNo,
  });

  String? brandName;
  String? model;
  String? color;
  String? storage;
  String? serialNo;

  factory DeviceDetails.fromJson(Map<String, dynamic> json) => DeviceDetails(
        brandName: json["brandName"],
        model: json["model"],
        color: json["color"],
        storage: json["storage"],
        serialNo: json["serialNo"],
      );

  Map<String, dynamic> toJson() => {
        "brandName": brandName ?? "",
        "model": model ?? "",
        "color": color ?? "",
        "storage": storage ?? "",
        "serialNo": serialNo ?? "",
      };
}
