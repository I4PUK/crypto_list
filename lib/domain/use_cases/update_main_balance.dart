import 'package:crypto_list/core/error/failure.dart';
import 'package:crypto_list/core/use_cases/use_case.dart';
import 'package:crypto_list/domain/entities/ticker.dart';
import 'package:crypto_list/domain/repositories/ticker_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateMainBalance extends UseCase<TickerEntity, UpdateMainBalanceParams> {
  final TickerRepository tickerRepository;

  UpdateMainBalance(this.tickerRepository);

  @override
  Future<Either<Failure, TickerEntity>> call(UpdateMainBalanceParams params) async {
    return await tickerRepository.updateMainBalance(params.ticker);
  }
}

class UpdateMainBalanceParams {
  final TickerEntity ticker;

  UpdateMainBalanceParams(this.ticker);
}