import '../../../../domain/entity/RegisterResponseEntity.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{
  String? loadingMessage;
  LoginLoadingState({required this.loadingMessage});
}

class LoginErrorState extends LoginStates{
  String? errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates{
  ///response
  RegisterResponseEntity resultEntity ;
  LoginSuccessState({required this.resultEntity});

}