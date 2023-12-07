import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entity/RegisterResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:ecommerce/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl extends AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) {
   return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, RegisterResponseEntity>> login(String email, String password) {
   return remoteDataSource.login(email, password);
  }
  
}