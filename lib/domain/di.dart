import 'package:ecommerce/data/model/api/api_manager.dart';
import 'package:ecommerce/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce/data/repository/repository/auth_repository_impl.dart';
import 'package:ecommerce/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:ecommerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:ecommerce/domain/use_case/login_use_case.dart';
import 'package:ecommerce/domain/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract:injectAuthRepositoryContract() );
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract:injectAuthRepositoryContract() );
}
AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}