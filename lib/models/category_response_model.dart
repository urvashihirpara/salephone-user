import 'dart:convert';

CategoryResponseModel welcomeFromJson(String str) =>
    CategoryResponseModel.fromJson(json.decode(str));

String welcomeToJson(CategoryResponseModel data) => json.encode(data.toJson());

class CategoryResponseModel {
  CategoryResponseModel({
    this.status,
    this.code,
    this.data,
  });

  int? status;
  int? code;
  List<Category>? data;

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        status: json["status"],
        code: json["code"],
        data:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Category {
  Category(
      {this.id,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.isChecked});

  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? v;

  //Developer purpose
  bool? isChecked;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}
