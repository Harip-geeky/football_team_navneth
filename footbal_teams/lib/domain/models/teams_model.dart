// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';
// part 'teams_model.g.dart';
// part 'teams_model.freezed.dart';

// @freezed
// class TeamsModel with _$TeamsModel {
//   const factory TeamsModel({
//     required String id,
//     required String name,
//     required String fifaCode,
//     required String iso2,
//     required String flag,
//     required String emoji,
//     required String emojiString,
//   }) = _TeamsModel;

//   factory TeamsModel.fromJson(Map<String, dynamic> json) =>
//       _$TeamsModelFromJson(json);
// }



class TeamsModel {
  List<Teams>? teams;

  TeamsModel({this.teams});

  TeamsModel.fromJson(Map<String, dynamic> json) {
    if (json['Teams'] != null) {
      teams = <Teams>[];
      json['Teams'].forEach((v) {
        teams!.add(new Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['Teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  int? id;
  String? name;
  String? fifaCode;
  String? iso2;
  String? flag;
  String? emoji;
  String? emojiString;

  Teams(
      {this.id,
      this.name,
      this.fifaCode,
      this.iso2,
      this.flag,
      this.emoji,
      this.emojiString});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fifaCode = json['fifaCode'];
    iso2 = json['iso2'];
    flag = json['flag'];
    emoji = json['emoji'];
    emojiString = json['emojiString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fifaCode'] = this.fifaCode;
    data['iso2'] = this.iso2;
    data['flag'] = this.flag;
    data['emoji'] = this.emoji;
    data['emojiString'] = this.emojiString;
    return data;
  }
}
