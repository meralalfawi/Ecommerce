import 'package:ecommerce/data/model/api/api_manager.dart';
import 'package:ecommerce/domain/entity/RegisterResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager ;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email,
      String password, String rePassword, String phone)async {
  var either = await apiManager.register(name, email, password, rePassword, phone);
  return either.fold((l) {
    return Left(Failures(errorMessage: l.errorMessage));
  }, (response){
    return Right(response.toRegisterResponseEntity());
  });
  }

  @override
  Future<Either<Failures, RegisterResponseEntity>> login(String email, String password)async {
    var either = await apiManager.login( email, password);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response){
      return Right(response.toRegisterResponseEntity());
    });
  }

}