import 'package:ecommerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:dartz/dartz.dart';
import '../entity/RegisterResponseEntity.dart';
import '../failures.dart';

class LoginUseCase{
  AuthRepositoryContract repositoryContract;
  LoginUseCase({required this.repositoryContract});

  Future<Either<Failures, RegisterResponseEntity>>invoke(String email, String password){
    return repositoryContract.login(email , password);
  }
}