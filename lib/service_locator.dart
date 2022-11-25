import 'package:crypto_list/data/data_sources/api_data_source.dart';
import 'package:crypto_list/data/repository/ticker_repository_impl.dart';
import 'package:crypto_list/domain/repositories/ticker_repository.dart';
import 'package:crypto_list/domain/use_cases/get_all_tickers.dart';
import 'package:crypto_list/domain/use_cases/update_main_balance.dart';
import 'package:crypto_list/presentation/bloc/crypto_list_cubit.dart';
import 'package:crypto_list/presentation/bloc/main_balance/main_balance_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> configureDi() async {
  // BLoC / Cubit
  sl.registerFactory(
        () => CryptoListCubit(getAllTickers: sl())
  );
  sl.registerFactory(
          () => MainBalanceCubit(updateMainBalance: sl())
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllTickers(sl()));
  // UseCases
  sl.registerLazySingleton(() => UpdateMainBalance(sl()));

  // Repository
  sl.registerLazySingleton<TickerRepository>(
        () => TickerRepositoryImpl(sl()
    ),
  );

  sl.registerLazySingleton<ApiDataSource>(
        () => ApiDataSourceImpl(
    ),
  );

  // External
}