import 'package:cart/core/network/check_connection.dart';
import 'package:cart/features/cart/data/dataSources/remote_data_source.dart';
import 'package:cart/features/cart/data/reposatory/data_reposatory.dart';
import 'package:cart/features/cart/domain/reposatory/carts_reposatory.dart';
import 'package:cart/features/cart/domain/usecases/get_all_carts_usecase.dart';
import 'package:cart/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final depen = GetIt.instance;

Future<void> init() async {
  // ✅ تسجيل CheckConnection بشكل صحيح

  depen.registerLazySingleton(() => InternetConnection());
  // ✅ تسجيل DeviceConnection بشكل صحيح
  depen.registerLazySingleton<DeviceConnection>(
    () => DeviceConnection(internetConnectionChecker: depen()),
  );

  // ✅ تسجيل Dio
  depen.registerLazySingleton<Dio>(
    () => Dio(),
  );

  // ✅ تسجيل RemoteDataSource
  depen.registerLazySingleton<RemoteDataSource>(
    () => RemoteDatatSourceImple(dio: depen()),
  );

  // ✅ تسجيل Repository
  depen.registerLazySingleton<CartsReposatory>(
    () => DataReposatory(depen(), remoteDataSource: depen()),
  );

  // ✅ تسجيل UseCase
  depen.registerLazySingleton<GetAllCartsUsecase>(
    () => GetAllCartsUsecase(cartsReposatory: depen()),
  );

  // ✅ تسجيل Cubit
  depen.registerFactory<CartCubit>(
    () => CartCubit(depen()),
  );
}
