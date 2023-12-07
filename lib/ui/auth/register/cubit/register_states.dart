import '../../../../domain/entity/RegisterResponseEntity.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{
  String? loadingMessage;
  RegisterLoadingState({required this.loadingMessage});
}

class RegisterErrorState extends RegisterStates{
  String? errorMessage;
  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates{
  ///response
  RegisterResponseEntity resultEntity ;
  RegisterSuccessState({required this.resultEntity});

}