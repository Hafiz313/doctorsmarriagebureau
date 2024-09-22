// To parse this JSON data, do
//
//     final interestResponse = interestResponseFromJson(jsonString);

import 'dart:convert';

MyInterestResponse myInterestResponseFromJson(String str) =>
    MyInterestResponse.fromJson(json.decode(str));

String interestResponseToJson(MyInterestResponse data) =>
    json.encode(data.toJson());

class MyInterestResponse {
  MyInterestResponse({
    this.data,
    this.links,
    this.meta,
    this.result,
  });

  List<Data>? data;
  Links? links;
  Meta? meta;
  bool? result;

  factory MyInterestResponse.fromJson(Map<String, dynamic> json) {
    json["data"].removeWhere((element) {
      return element == null;
    });
    return MyInterestResponse(
      data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      result: json["result"] == null ? null : json["result"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links == null ? null : links!.toJson(),
        "meta": meta == null ? null : meta!.toJson(),
        "result": result == null ? null : result,
      };
}

class Data {
  Data({
    this.userId,
    this.packageUpdateAlert,
    this.photo,
    this.name,
    this.age,
    this.religion,
    this.country,
    this.mothereTongue,
    this.status,
  });

  int? userId;
  bool? packageUpdateAlert;
  String? photo;
  String? name;
  int? age;
  String? religion;
  String? country;
  String? mothereTongue;
  String? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"] == null ? null : json["user_id"],
        packageUpdateAlert: json["package_update_alert"] == null
            ? null
            : json["package_update_alert"],
        photo: json["photo"] == null ? null : json["photo"],
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        religion: json["religion"] == null ? null : json["religion"],
        country: json["country"] == null ? null : json["country"],
        mothereTongue:
            json["mothere_tongue"] == null ? null : json["mothere_tongue"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "package_update_alert":
            packageUpdateAlert == null ? null : packageUpdateAlert,
        "photo": photo == null ? null : photo,
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "religion": religion == null ? null : religion,
        "country": country == null ? null : country,
        "mothere_tongue": mothereTongue == null ? null : mothereTongue,
        "status": status == null ? null : status,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "links": links == null
            ? null
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"] == null ? null : json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label == null ? null : label,
        "active": active == null ? null : active,
      };
}
