import 'package:ecommerce/data/model/response/Errors.dart';
import 'package:ecommerce/domain/entity/RegisterResponseEntity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmed500@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NmI3NDU3MjgxYzkxNmM3YTdiMzY4OCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAxNTQwOTUyLCJleHAiOjE3MDkzMTY5NTJ9.C3ru8DIJ8_yfddZWZt2HJu5ix6atehN7-IRAL2yDdkA"

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg,
  this.error
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
String? statusMsg ;
  Error? error ;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }
 RegisterResponseEntity toRegisterResponseEntity(){
   return RegisterResponseEntity(message: message ,
    token:token ,user: user?.toUserEntity()
    );
 }
}


