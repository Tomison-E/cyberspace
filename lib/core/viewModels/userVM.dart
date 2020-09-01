import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:cybespace/core/models/user.dart';
import 'package:cybespace/core/services/api.dart';
//import 'package:fundall/locator.dart';



class UserVM with ChangeNotifier{

  Api _api = Api();
  Users users = Users();
  List<User> approvedUser=[];
  List<User> pendingUsers=[];

  Future<bool> registerUser({@required String email, @required String password,@required firstName, @required lastName,@required passwordConfirmation}) async {
    var payload = convert.jsonEncode({"email": email, "password": password,"password_confirmation": passwordConfirmation,"firstname": firstName, "lastname": lastName});
    bool status=false;
    try {
      var result =  await _api.register(body: payload);
      if (result == null) {
        print("can not get response from server");
        throw "Error connecting.";
      }
      else if (result.statusCode == 200) {
        print("successful registeration");
        status=true;

      } else if (result.statusCode == 400){
        throw result.data["error"]["message"];
      }
      else{
        throw result.data["error"]["message"];
      }
    }
    catch(exception){
      print(exception);
    }
    return status;
  }

  Future<Users> getUser() async {
    var result = await _api.getUser();
    if (result == null) {
      print("can not get response from server");
      throw "Error connecting.";
    }
    else if (result.statusCode == 200) {
      print("successful authentication");
      users = Users.fromMap(result.data);
    } else if (result.statusCode == 400){
      print("There was an error authenticating your request");
      throw result.data["error"]["message"];
    }
    else{
      throw result.data["error"]["message"];
    }
    return users;
  }


  Future<void> sortUsers() async{
    final _users = await getUser();
    _users.users.forEach((element) {
      if (element.approved){
        approvedUser.add(element);
      }
      else {
        pendingUsers.add(element);
      }
    });
  }



  Future<bool> updateAvatar({@required String avatar}) async {
    bool status=false;

    try {
      var result = await _api.updateAvatar(image: avatar,);
      if (result == null) {
        print("can not get response from server");
        throw "Error connecting.";
      }
      else if (result.statusCode == 200) {
        print("update successful");
        status = true;
        await getUser();
      } else if (result.statusCode == 400) {
        throw result.data["error"]["message"];
      }
      else {
        throw result.data["error"]["message"];
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    return status;
  }

  }

/*


*/
