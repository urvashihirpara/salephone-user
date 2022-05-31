import 'dart:convert';

import 'category_response_model.dart';
import 'login_response_model.dart';

ServiceResponseModel welcomeFromJson(String str) =>
    ServiceResponseModel.fromJson(json.decode(str));

String welcomeToJson(ServiceResponseModel data) => json.encode(data.toJson());

class ServiceResponseModel {
  ServiceResponseModel({
    this.status,
    this.code,
    this.data,
  });

  int? status;
  int? code;
  ServiceResponse? data;

  factory ServiceResponseModel.fromJson(Map<String, dynamic> json) =>
      ServiceResponseModel(
        status: json["status"],
        code: json["code"],
        data: ServiceResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
      };
}

class ServicesResponseModel {
  ServicesResponseModel({
    this.status,
    this.code,
    this.data,
  });

  int? status;
  int? code;
  List<ServiceResponse>? data;

  factory ServicesResponseModel.fromJson(Map<String, dynamic> json) =>
      ServicesResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<ServiceResponse>.from(
            json["data"].map((x) => ServiceResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ServiceResponse {
  ServiceResponse({
    this.personalInformation,
    this.deviceDetails,
    this.id,
    this.user,
    this.categories,
    this.device,
    this.issue,
    this.referenceId,
    this.type,
    this.serviceStatus,
    this.additionalNotes,
    this.status,
  });

  PersonalInformationResponse? personalInformation;
  DeviceDetailsResponse? deviceDetails;
  String? id;
  User? user;
  List<Category>? categories;
  String? device;
  String? issue;
  String? referenceId;
  String? type;
  List<ServiceStatus>? serviceStatus;
  String? additionalNotes;
  String? status;

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      ServiceResponse(
        personalInformation:
            PersonalInformationResponse.fromJson(json["personalInformation"]),
        deviceDetails: DeviceDetailsResponse.fromJson(json["deviceDetails"]),
        id: json["_id"],
        user: User.fromJson(json["user"]),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        device: json["device"],
        issue: json["issue"],
        referenceId: json["referenceId"],
        type: json["type"],
        serviceStatus: List<ServiceStatus>.from(
            json["serviceStatus"].map((x) => ServiceStatus.fromJson(x))),
        additionalNotes: json["additionalNotes"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "personalInformation": personalInformation?.toJson(),
        "deviceDetails": deviceDetails?.toJson(),
        "_id": id,
        "user": user?.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "device": device,
        "issue": issue,
        "referenceId": referenceId,
        "type": type,
        "serviceStatus":
            List<dynamic>.from(serviceStatus!.map((x) => x.toJson())),
        "additionalNotes": additionalNotes,
        "status": status,
      };
}

class DeviceDetailsResponse {
  DeviceDetailsResponse({
    this.model,
    this.color,
    this.storage,
    this.serialNo,
    this.brandName,
  });

  String? model;
  String? color;
  String? storage;
  String? serialNo;
  String? brandName;

  factory DeviceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      DeviceDetailsResponse(
        model: json["model"],
        color: json["color"],
        storage: json["storage"],
        serialNo: json["serialNo"],
        brandName: json["brandName"],
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "color": color,
        "storage": storage,
        "serialNo": serialNo,
        "brandName": brandName,
      };
}

class PersonalInformationResponse {
  PersonalInformationResponse({
    this.email,
    this.pinCode,
    this.fullName,
    this.mobileNumber,
  });

  String? email;
  String? pinCode;
  String? fullName;
  String? mobileNumber;

  factory PersonalInformationResponse.fromJson(Map<String, dynamic> json) =>
      PersonalInformationResponse(
        email: json["email"],
        pinCode: json["pinCode"],
        fullName: json["fullName"],
        mobileNumber: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "pinCode": pinCode,
        "fullName": fullName,
        "mobileNumber": mobileNumber,
      };
}

class ServiceStatus {
  ServiceStatus({
    this.status,
    this.date,
    this.id,
  });

  String? status;
  DateTime? date;
  String? id;

  factory ServiceStatus.fromJson(Map<String, dynamic> json) => ServiceStatus(
        status: json["status"],
        date: DateTime.parse(json["date"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "date": date?.toIso8601String(),
        "_id": id,
      };
}
