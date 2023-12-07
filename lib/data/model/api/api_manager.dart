import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/api/api_constants.dart';
import 'package:ecommerce/data/model/request/LoginRequest.dart';
import 'package:ecommerce/data/model/request/registerRequest.dart';
import 'package:ecommerce/data/model/response/LoginResponseDto.dart';
import 'package:ecommerce/data/model/response/RegisterResponseDto.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance(){
    _instance??= ApiManager._();
    return _instance! ;
  }

  Future<Either<Failures , RegisterResponseDto>>register(String name, String email ,String password ,
      String rePassword , String phone)async{
    Uri url = Uri.https(ApiConstants.baseUrl , ApiConstants.registerApi);
    final connectivityResult =await(Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi){
      var registerBody= RegisterRequest(
          name: name ,
          email: email ,
          password: password ,
          phone: phone ,
          rePassword: rePassword
      );
      var response = await http.post(url , body: registerBody.toJson());
      var registerResponse = RegisterResponseDto.fromJson(jsonDecode(response.body));
     if(response.statusCode >= 200 || response.statusCode < 300){
       return Right(registerResponse);
     }
     else{
       return Left(ServerError(errorMessage: registerResponse.error !=null ?
        registerResponse.error?.msg?? '' :
       registerResponse.message));
     }
    }else{
      return Left(NetworkError(errorMessage: 'please check connectivity'));
    }
    }

  Future<Either<Failures , LoginResponseDto>>login(String email , String password)async{
    Uri url = Uri.https(ApiConstants.baseUrl , ApiConstants.loginApi);
    final connectivityResult =await(Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi){
      var loginBody= LoginRequest(
        email: email ,
          password: password ,
      );
      var response = await http.post(url , body: loginBody.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 || response.statusCode < 300){
        return Right(loginResponse);
      }
      else{
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    }else{
      return Left(NetworkError(errorMessage: 'please check connectivity'));
    }
  }

}