import 'package:dartz/dartz.dart';

import '../../entity/RegisterResponseEntity.dart';
import '../../failures.dart';


abstract class AuthRemoteDataSource{

  Future<Either<Failures,RegisterResponseEntity>>register (String name, String email, String password, String rePassword,
      String phone);
  Future<Either<Failures,RegisterResponseEntity>>login (String email , String password );

}