import 'package:flutter/material.dart';

class User {
  final String id;
  final String firstName;
  final String time;
  final String avatar;
  final String amount;
  final bool approved;

  User({
    @required this.id,
    @required this.amount,
    @required this.firstName,
    this.avatar,
    this.time,
    this.approved
  })
      :assert(id != null),
        assert(time != null),
        assert(avatar != null),
        assert(firstName != null);

  User.fromMap(Map<dynamic, dynamic> map)
      : id = map["id"] ,
        firstName = map["name"],
        time = map["createdAt"],
        avatar= map["avatar"],
        approved = map["isLoanApproved"] as bool,
        amount= map["amount"] ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["name"] = firstName;
    data["createdAt"] = time;
    data["avatar"] = avatar;
    data["isLoanApproved"] = approved;
    data["amount"] = amount;

    return data;
  }

}


  class Users {
  final List<User> users;
  Users({this.users});


  Users.fromMap(List<dynamic> maps):
  users = maps.map((i)=> User.fromMap(i)).toList();

  Map<String, dynamic> toJson() => {
  'users': users.map((i)=> i.toJson()).toList(),
  };

  Users.fromJson(List<dynamic> json)
      : users = json.map((i)=> User.fromMap(i)).toList();

  }