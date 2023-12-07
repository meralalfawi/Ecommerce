import 'package:ecommerce/domain/entity/RegisterResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositoryContract{

  Future<Either<Failures,RegisterResponseEntity>>register (String name, String email, String password, String rePassword,
      String phone);
  Future<Either<Failures,RegisterResponseEntity>>login (String email, String password);

}