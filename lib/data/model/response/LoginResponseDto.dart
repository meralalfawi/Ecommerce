import 'package:ecommerce/data/model/response/UserDto.dart';

import '../../../domain/entity/RegisterResponseEntity.dart';
import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti3431@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NzBkNTllZDM0YWUzYjIwOWM0NmM5YiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAxOTA4MDA0LCJleHAiOjE3MDk2ODQwMDR9.sCE6dHBCYS2TpfDRXvEwGpjHG78_S8iLn-s0ocQM1js"

class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
String? statusMsg ;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
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